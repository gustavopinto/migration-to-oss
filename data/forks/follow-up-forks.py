import json, requests, sys, os
from collections import defaultdict, OrderedDict

root = "https://api.github.com/repos/"

class NoMorePagesAvailable(Exception):
  pass

def read_data(repo):
  token = "access_token=8c2bc79c047f26f92f1a46ed52d6b1b47b9565c5"

  url = "%s%s&%s" % (root, repo, token)

  print url

  resp = requests.get(url)

  if len(resp.text) == 2:
    print("No more pages. We are done!")
    raise NoMorePagesAvailable()
  else:
    forks = json.loads(resp.text)
    return forks

def made_contributions(login, project):

    url = "https://github.com/%s/%s/commits/master?author=%s" % (login, project.split("/")[1], login)
    resp = requests.get(url)

    if resp.text.find("Commits on") != -1:
        return True
    return False

    #https://github.com/evelynmitchell/plotly.js/commits/master?author=evelynmitchell

def gather_metadata(project, type):
  max_pages = 10000000 # limite de paginas da api do github
  period = defaultdict(int)

  for page in range(80, max_pages):
    print "Page: " + str(page)
    repo = "%s/%s?page=%s" % (project, type, page)

    forks = []

    try:
      forks = read_data(repo)

      for fork in forks:
        output = []
        login = fork['owner']['login']
        name = fork['name']
        full_name = fork['full_name']

        if made_contributions(login, project):
            contribs = "https://github.com/%s/commits/master?author=%s" % (full_name, login)
            output.append(contribs)

        save (name, full_name, output)

    except NoMorePagesAvailable:
      return output

  return output

def save(dir, project, output):
    project = project.replace("/", "_")
    project = dir + "/" + project + "_contribs.csv"

    if len(output) > 0:
        if not os.path.exists(dir):
            os.makedirs(dir)

        file = open(project, "w+")
        file.write('\n'.join(output))


gather_metadata("atom/atom", "forks")
