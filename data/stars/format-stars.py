import json, requests, sys, time
from collections import defaultdict, OrderedDict

class NoMorePagesAvailable(Exception):
  pass

def get_week(month, day):
  return (int(month) - 1) * 4 + (int(day) / 7) + 1

def read_data(repo):

  token = "access_token=8c2bc79c047f26f92f1a46ed52d6b1b47b9565c5"
  root = "https://api.github.com/repos/"

  url = "%s%s&%s" % (root, repo, token)
  print url
  headers = {'Accept': 'application/vnd.github.v3.star+json'}

  resp = requests.get(url=url, headers=headers)
  print resp

  if len(resp.text) == 2:
    print("No more pages. We are done!")
    raise NoMorePagesAvailable()
  else:
    return json.loads(resp.text)

def gather_metadata(project, type):

  max_pages = 10000000 # limite de paginas da api do github
  period = defaultdict(int)

  for page in range(1, max_pages):
    print "Page: " + str(page)
    repo = "%s/%s?page=%s" % (project, type, page)
    stars = []

    try:
      stars = read_data(repo)
      time.sleep(1)
    except NoMorePagesAvailable:
      return period
    else:
      for star in stars:
        try:
          year, month, day = star['starred_at'][:10].split("-")
          print star['starred_at'] + " - " + star['user']['login']
          
          week = get_week(month, day)
          key = year + "," + str(week)

          period[key] += 1
        except TypeError, e:
          print star
          print "\n\n"

  return period

def format_and_save(period, project):

  def save(project):
    project_name = project.split("/")[0]+"-"+project.split("/")[1] + ".csv"

    file = open(project_name, "w+")
    file.write('\n'.join(output))

  today = "2017-05-13"

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


projects = [            "apple/swift",
 				"plotly/plotly.js",
 				"nathanmarz/storm",
            "apache/storm",
            "dotnet/roslyn",
            "zulip/zulip",
            "github/hubot"]

#"facebook/hhvm",
#				"atom/atom",

for project in projects:
  period = gather_metadata(project, "stargazers")
  format_and_save(period, project)
