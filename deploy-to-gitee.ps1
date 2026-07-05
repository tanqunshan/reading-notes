# 上传到 Gitee 并发布 Pages
# 用法：
#   .\deploy-to-gitee.ps1 -RepoUrl "https://gitee.com/你的用户名/你的仓库名" -Token "你的私人令牌"

param(
    [Parameter(Mandatory = $true)]
    [string]$RepoUrl,
    [Parameter(Mandatory = $true)]
    [string]$Token
)

$ErrorActionPreference = "Stop"
$RepoDir = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $RepoDir

$RepoUrl = $RepoUrl.Trim().TrimEnd('/')
if ($RepoUrl.EndsWith('.git')) { $RepoUrl = $RepoUrl.Substring(0, $RepoUrl.Length - 4) }

if ($RepoUrl -notmatch '^https://gitee\.com/([^/]+)/([^/]+)$') {
    Write-Error "请使用格式: https://gitee.com/用户名/仓库名"
}

$username = $Matches[1]
$repoName = $Matches[2]
$pushUrl = "https://${username}:${Token}@gitee.com/${username}/${repoName}.git"

if (git remote | Select-String -Quiet '^origin$') {
    git remote remove origin
}
git remote add origin "https://gitee.com/${username}/${repoName}.git"
git branch -M master

Write-Host "正在推送到 gitee.com/${username}/${repoName} ..."
git push -u $pushUrl master

Write-Host ""
Write-Host "===== 上传成功 ====="
Write-Host "下一步开启网页（Gitee Pages）："
Write-Host "  1. 浏览器打开: https://gitee.com/${username}/${repoName}"
Write-Host "  2. 点击「服务」->「Gitee Pages」"
Write-Host "  3. 分支: master  部署目录: / （根目录）"
Write-Host "  4. 点击「启动」或「更新」"
Write-Host "  5. 等待 1~2 分钟，用 Pages 提供的链接访问（即 index.html）"
Write-Host ""
Write-Host "说明: 已使用 index.html 作为首页，打开 Pages 链接即可直接看到《飘》读书札记。"
