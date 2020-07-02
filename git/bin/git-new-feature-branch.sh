#################################################################################################
# Checkout master, pull from master, checkout new branch from master, push new branch to origin
################################################################################################

git checkout master 
git pull 
git checkout -b feature/$1
git push --set-upstream origin feature/$1