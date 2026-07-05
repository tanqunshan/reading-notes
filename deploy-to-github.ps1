# 上传到 GitHub 并启用 Pages
# 用法：
#   .\deploy-to-github.ps1 -Username "你的GitHub用户名" -Token "你的Personal Access Token"
# 可选：
#   -RepoName "reading-notes"   仓库名，默认 reading-notes
#   -Branch "master"            分支名，默认 master

param(
    [Parameter(Mandatory = $true)]
    [string]$Username,
    [Parameter(Mandatory = $true)]
    [string]$Token,
    [string]$RepoName = "reading-notes",
    [string]$Branch = "master"
)

$ErrorActionPreference = "Stop"
$RepoDir = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $RepoDir

$Username = $Username.Trim()
$RepoName = $RepoName.Trim()
$pushUrl = "https://${Username}:${Token}@github.com/${Username}/${RepoName}.git"
$repoUrl = "https://github.com/${Username}/${RepoName}"

if (git remote | Select-String -Quiet '^github$') {
    git remote remove github
}
git remote add github $repoUrl
git branch -M $Branch

Write-Host "正在推送到 github.com/${Username}/${RepoName} ..."
git push -u $pushUrl "${Branch}:${Branch}"

Write-Host ""
Write-Host "===== 上传成功 ====="
Write-Host ""
Write-Host "下一步开启 GitHub Pages："
Write-Host "  1. 浏览器打开: ${repoUrl}/settings/pages"
Write-Host "  2. Build and deployment -> Source: Deploy from a branch"
Write-Host "  3. Branch: ${Branch}  文件夹: / (root)"
Write-Host "  4. 点击 Save，等待 1~3 分钟"
Write-Host ""
Write-Host "访问地址（仓库名 reading-notes 时）："
Write-Host "  https://${Username}.github.io/${RepoName}/"
Write-Host ""
Write-Host "说明: index.html 为首页，打开上述链接即可看到《飘》读书札记。"
