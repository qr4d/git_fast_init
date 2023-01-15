# 简介
通过shell脚本一键初始化项目并创建后续自动提交脚本

# 快速git命令
将fast_init.sh下载到项目根目录，执行一次，会生成以下文件

* update.sh，每次提交修改的时候使用，会提示填写本次修改内容和时间并自动填入ChangeLog.md
* seturl.sh，第一次设置远程仓库使用
* .gitignore，忽略提交的文件/文件夹，这是一个隐藏文件
* ChangeLog.md，更新记录文件，每次提交会自动填写更新记录和时间

相应执行脚本即可完成git命令，对于不熟悉git命令的我来说，还是非常方便的

# 权限设置
执行seturl.sh会要求提供github用户名密码，其中，密码不是登录密码，而是access tokens，可以在Settings-DeveloperSettings-PersonalAccessTokens里面生成，最长有效期90天。一般选择CommitStatuses/Contents/Issues/PullRequests等选项的Read and Write权限。
如果token过期需要更换，可以在终端执行以下命令删除旧token
```
$ git credential reject
protocol https
host github.com

```
然后重新执行seturl.sh设置。

# 感谢
[理想的彼岸](https://www.zdynb.cn/2022/kuai-su-chu-shi-hua-git-cang-ku.html)
[阿湯哥](https://blog.csdn.net/ttyy1112/article/details/107863210)


