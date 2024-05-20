source .ci/.var
postName=$POST_NAME
rm .ci/.var
$SCRIPTS_PATH/git-push-commit.sh "Finalize post $POST_NAME" 

if [[ -n $POST_NAME ]]; then
    gh pr merge -dst "Publish post $POST_NAME";
    git switch main;
fi
