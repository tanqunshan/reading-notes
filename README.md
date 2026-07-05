# 读书笔记

个人读书笔记静态站点，通过 **GitHub Pages** 发布。

| 文件 | 说明 |
|------|------|
| `index.html` | 《飘》读书札记（首页） |
| `deploy-to-github.ps1` | 一键推送到 GitHub |

## 首次发布（约 10 分钟）

### 1. 注册 GitHub

打开 https://github.com/signup 注册账号（建议用户名与 Gitee 一致，如 `tanqunshan`）。

### 2. 新建仓库

1. 打开 https://github.com/new  
2. Repository name 填 **`reading-notes`**  
3. 选 **Public**（公开）  
4. **不要**勾选 "Add a README"（本地已有内容）  
5. 点 **Create repository**

### 3. 创建访问令牌（Token）

1. 打开 https://github.com/settings/tokens  
2. **Generate new token** → **Generate new token (classic)**  
3. Note 填 `reading-notes-deploy`  
4. 勾选 **`repo`**（完整仓库权限）  
5. 生成后 **复制令牌**（只显示一次，请保存）

### 4. 推送到 GitHub

在 PowerShell 中执行（把用户名和令牌换成你的）：

```powershell
cd D:\读书\gitee-piao-pages
.\deploy-to-github.ps1 -Username "你的GitHub用户名" -Token "ghp_xxxxxxxx"
```

### 5. 开启 GitHub Pages

1. 打开 `https://github.com/你的用户名/reading-notes/settings/pages`  
2. **Source** 选 **Deploy from a branch**  
3. **Branch** 选 `master`，文件夹选 **`/ (root)`**  
4. 点 **Save**  
5. 等 1～3 分钟，页面顶部会出现绿色提示和网址  

**你的网站地址：**

```
https://你的GitHub用户名.github.io/reading-notes/
```

---

## 以后更新笔记

1. 修改或新增 HTML 文件（如 `huozhe.html`）  
2. 若新增文章，在 `index.html` 或新建目录页加入链接  
3. 提交并推送：

```powershell
cd D:\读书\gitee-piao-pages
git add .
git commit -m "新增《活着》读书笔记"
.\deploy-to-github.ps1 -Username "你的GitHub用户名" -Token "ghp_xxxxxxxx"
```

---

## 多篇文章建议结构

```
reading-notes/
├── index.html          # 目录页（列出所有笔记）
├── piao.html           # 《飘》（当前内容可改名为 piao.html）
├── huozhe.html         # 《活着》
└── README.md
```

把现有 `index.html` 改成目录页后，各篇笔记用独立 HTML 即可。
