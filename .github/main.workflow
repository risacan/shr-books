workflow "build pdf" {
  on = "push"
  resolves = ["docker://alpine/git:latest"]
}

action "kauplan/review2.5" {
  uses = "docker://kauplan/review2.5"
  runs = "./scripts/build.sh"
}

action "docker://alpine/git:latest" {
  uses = "docker://alpine/git:latest"
  runs = "./scripts/commit.sh"
  needs = ["kauplan/review2.5"]
  secrets = ["PERSONAL_TOKEN"]
}
