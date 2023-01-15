#!/bin/bash
touch .gitignore
file=".gitignore"
cat >>"$file" <<EOF
# Logs
logs
*.log
npm-debug.log*
yarn-debug.log*
yarn-error.log*
pnpm-debug.log*
lerna-debug.log*

node_modules
.DS_Store
dist
dist-ssr
coverage
*.local
/cypress/videos/
/cypress/screenshots/
# Editor directories and files
.vscode/*
!.vscode/extensions.json
.idea
*.suo
*.ntvs*
*.njsproj
*.sln
*.sw?
# 自定义
.sass-cache/
*.css.map
*.js.map
*sass.cache
*.sass.map
*.scss.map
Thumbs.db
db.json
node_modules/
.deploy*/%
.vuepress/dist
.yarn/
.webpack/
.pnp.*
.vscode/
.history/
*.vsix
.ionide
.history
.gitignore
fast_init.sh
seturl.sh
update.sh
ChangeLog.md
EOF


touch ChangeLog.md
ChangeLog="ChangeLog.md"
cat >>"$ChangeLog" <<EOF
### ChangeLog
#### $(date '+%Y-%m-%d %H:%M:%S %A')
创建仓库
EOF

touch update.sh && chmod +x update.sh
update="update.sh"
cat >"$update" <<EOF
#!/bin/bash
echo 请输入更新内容:
read -r m
echo 更新日志中...
System=\$(uname -s)
if [ "\$System" == "Darwin" ];then
    echo "Use MacOS"
    sed -i '' "1a\\\\
    ####  \`date '+%Y-%m-%d %H:%M:%S %A'\` \\\\
    \$m
    " ChangeLog.md
elif [ "\$System" == "Linux" ];then
    echo "Use Linux"
    sed -i "2 i #### \$(date '+%Y-%m-%d %H:%M:%S %A') \n \$m" Readme.md
else
    echo "Other OS: \$System"
fi
gitRemote=\$(git remote)
# 获取当前分支名
branchName=$(git symbolic-ref --short -q HEAD)
echo "\$branchName"
git add .
git commit -m "\$m"
# 兼容处理
for i in \$gitRemote; do
    # echo "\$i"
    # 如果i等于origin则跳过,否则推送
    if [ "\$i" == "origin" ]; then
        echo "不推送origin"
    else
        echo "推送\$i"
        git push "\$i" "\$branchName"
    fi
done
EOF

touch seturl.sh && chmod +x seturl.sh
seturl="seturl.sh"
cat >"$seturl" <<EOF
#!/bin/bash
echo 请输入远程仓库名
read -r name
echo 请输入远程仓库URL
read -r url
git remote add \$name \$url
git branch -M main
git push \$name main
EOF
git init
git add .
git commit -m "创建仓库"
