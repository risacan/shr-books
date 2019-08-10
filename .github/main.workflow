workflow "build pdf" {
  on = "push"
  resolves = ["docker://alpine/git:latest"]
}

action "kauplan/review2.5" {
  uses = "kauplan/review2.5"
  runs = "./scripts/build.sh"
}

action "docker://alpine/git:latest" {
  uses = "docker://alpine/git:latest"
  needs = ["kauplan/review2.5"]
  runs = "./scripts/commit.sh"
  secrets = ["GITHUB_TOKEN"]
}
