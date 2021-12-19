## Create API Token

1. Go to "**Settings -> Developer Settings -> Personal Access Tokens**"
2. Create a token with specific **scopes**. 
3. Record down the **Token**. 

You can save the **token** to bash environment (`~/.zprofile` for zsh or `~/.bash_profile` for bash). Simply add the following line to the `profile`. 

```bash
export GITHUB_TOKEN="TOKEN"
```

## Create a Repository on GitHub

Follow the document [here](https://docs.github.com/en/rest/reference/repos#create-a-repository-for-the-authenticated-user) to create a repo in GitHub using its API. A JSON of metadata about the repo will be returned after the command is executed. 

```bash
curl -X POST -u "$USERNAME:$TOKEN" \
    https://api.github.com/user/repos \
    -d '{"name":"$REPONAME", "private":true}' > repo_metadata.json
```

## Create `.gitignore` File

Create the `.gitignore` file to ignore uploading the listed files to GitHub. Simply input the filename inside the `.gitignore` will do. See more from [here](https://git-scm.com/docs/gitignore).

## First Push

```bash
git init -b BRANCH_NAME
git add .
git commit -m "$UPDATE_NAME"
git push "https://$TOKEN@github.com/$USERNAME/$REPONAME.git"
```

## Delete a Repository on GitHub

Follow the document [here](https://docs.github.com/en/rest/reference/repos#delete-a-repository) to delete a repo in GitHub using its API.

```bash
curl -X DELETE -u "$USERNAME:$TOKEN" \
    "https://api.github.com/repos/$USERNAME/$REPONAME" 
```

## Reference

- https://www.softwaretestinghelp.com/github-rest-api-tutorial/
- https://techglimpse.com/git-push-github-token-based-passwordless/
- https://git-scm.com/docs/gitignore