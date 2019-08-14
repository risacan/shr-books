workflow "build pdf" {
  resolves = ["commit"]
  on = "pull_request"
}

action "build" {
  uses = "docker://kauplan/review2.5"
  runs = "./scripts/build.sh"
  needs = ["Filters for GitHub Actions"]
}

action "commit" {
  uses = "docker://alpine/git:latest"
  runs = "./scripts/commit.sh"
  needs = ["build"]
  secrets = ["PERSONAL_TOKEN"]
}

action "Filters for GitHub Actions" {
  uses = "actions/bin/filter@25b7b846d5027eac3315b50a8055ea675e2abd89"
  args = "not branch master"
}
