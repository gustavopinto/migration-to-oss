import json, requests, sys
from collections import defaultdict, OrderedDict

class NoMorePagesAvailable(Exception):
  pass

def get_week(month, day):
  return (int(month) - 1) * 4 + (int(day) / 7) + 1

def read_data(repo):
  token = "access_token=8c2bc79c047f26f92f1a46ed52d6b1b47b9565c5"
  root = "https://api.github.com/repos/"

  url = "%s%s&%s" % (root, repo, token)

  resp = requests.get(url)

  if len(resp.text) == 2:
    print("No more pages. We are done!")
    raise NoMorePagesAvailable()
  else:
    forks = json.loads(resp.text)
    return forks

def gather_metadata(project, type):

  max_pages = 10000000 # limite de paginas da api do github
  period = defaultdict(int)

  for page in range(1, max_pages):
    print "Page: " + str(page)
    repo = "%s/%s?page=%s" % (project, type, page)
    forks = []

    try:
      forks = read_data(repo)
    except NoMorePagesAvailable:
      return period
    else:
      for fork in forks:
        year, month, day = fork['created_at'][:10].split("-")
        week = get_week(month, day)
        key = year + "," + str(week)

        period[key] += 1

  return period

def format_and_save(period, project):

  def save(project):
    project_name = project.split("/")[1] + ".csv"

    file = open(project_name, "w+")
    file.write('\n'.join(output))

  today = "2016-09-13"

  this_year, this_month, this_day = today.split("-")
  this_week = get_week(this_month, this_day)

  od = OrderedDict(sorted(period.items()))

  first_year, first_week = od.items()[0][0].split(",")

  max_weeks = 48
  sum_period = 0

  output = []


  output.append("year,week,count,sum")

  for year in range(int(first_year), int(this_year) + 1):

    if year != int(first_year):
      first_week = 1

    if year == int(this_year):
      til_week = this_week
    else:
      til_week = max_weeks

    for week in range(int(first_week), til_week + 1):
      key = str(year) + "," + str(week)
      sum_period += period[key]
      output.append(key + "," + str(period[key]) + "," + str(sum_period))

    save(project)


projects = ["plotly/plotly.js",
            "atom/atom",
            "apple/swift",
            "facebook/hhvm",
            "apache/storm",
            "dotnet/roslyn",
            "zulip/zulip",
            "github/hubot"]


for project in projects:
  period = gather_metadata(project, "forks")
  format_and_save(period, project)
