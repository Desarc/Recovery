#################################################################################################
# Stage all changes, amend commit, rewrite remote branch
################################################################################################

git add --all
git commit --amend --no-edit
git push --force-with-lease