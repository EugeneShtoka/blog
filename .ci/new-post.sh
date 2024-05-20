postName="$1"

if [[ -n $postName ]]; then
    git switch main
    git pull

    echo "POST_NAME=\"$postName\"" > .ci/.var
    hugo new content content/post/"$postName"/index.md

    branchName=post/${postName// /-}
    branchName=$(echo "$branchName" | tr '[:upper:]' '[:lower:]')
    git checkout -b $branchName

    git add .
    comment="Create post $postName"
    git commit -m "$comment"
    git push -u origin $branchName
    gh pr create --repo EugeneShtoka/blog --base main --fill
    code content/post/"$postName"/index.md
else
    echo "Usage: $0 <post-name>"
fi
