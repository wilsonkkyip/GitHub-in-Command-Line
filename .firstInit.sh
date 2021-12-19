## Variable Specification
REPONAME="GitHub in Command Line"

## Variable Preparation
REPOURL=$(echo $REPONAME | tr " " "-")

## Create GitHub Repo
curl -X POST -u "$GITHUB_USER:$GITHUB_TOKEN" \
    https://api.github.com/user/repos \
    -d '{"name":"'"$REPONAME"'", "private":false}' > repo_metadata.json

## Commit
git init
git add .
git commit -m "First Commit"

## Push
git push "https://$GITHUB_TOKEN@github.com/$GITHUB_USER/$REPOURL" master

## Delete
# curl -X DELETE -u "$GITHUB_USER:$GITHUB_TOKEN" \
#     "https://api.github.com/repos/$GITHUB_USER/$REPOURL" 
