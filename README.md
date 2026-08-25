# 轻舟 · 债务是山，轻舟已过

> 两岸猿声啼不住，轻舟已过万重山。

文艺而有力量的债务管理 APP — 每一笔还款，都是驶向岸的一程。

## 📱 项目结构

```
debt-app/
├── index.html        # 主应用（含数据大屏、债务管理、还款记录、规划）
├── manifest.json     # PWA 配置（支持手机"添加到主屏幕"安装）
├── sw.js             # Service Worker（离线缓存）
├── icon-192.png      # 应用图标 192x192（轻舟主题）
├── icon-512.png      # 应用图标 512x512（轻舟主题）
└── README.md         # 本文件
```

---

## 🚀 三种安装方式（推荐程度由高到低）

### 方式一：PWA 直接安装（最简单，推荐）

> 无需生成 APK，手机浏览器直接安装为独立应用

**步骤：**

1. **部署到任意 Web 服务器**（需 HTTPS）：
   - **GitHub Pages**（免费）：将 `debt-app` 目录推送到 GitHub 仓库，开启 Pages
   - **Vercel / Netlify**（免费）：直接拖拽 `debt-app` 文件夹上传
   - **本地测试**：使用 VS Code Live Server 或 `python -m http.server 8080`

2. **手机安装**：
   - Android：用 Chrome 打开网址 → 点右上角菜单 → "安装应用"或"添加到主屏幕"
   - iOS：用 Safari 打开 → 点分享按钮 → "添加到主屏幕"

3. 安装后像原生 APP 一样使用，独立全屏运行，有图标入口。

---

### 方式二：PWABuilder 生成 APK（推荐）

> 微软官方工具，一键将 PWA 打包成真正的 APK

**步骤：**

1. 先将应用部署到 HTTPS 网址（参考方式一）

2. 打开 **https://www.pwabuilder.com/**

3. 输入你的应用网址，点击 Start

4. 检测通过后，点击 **Package For Stores** → **Android**

5. 下载生成的 APK 文件

6. 传输到手机，打开安装即可

**优势**：生成的 APK 体积小（<5MB），兼容性好，可上架 Google Play

---

### 方式三：Capacitor 本地打包（开发者方案）

> 适合有 Android Studio 环境的开发者

**前置条件：**
- Node.js 18+
- Android Studio
- JDK 17+

**步骤：**

```bash
# 1. 安装 Capacitor
cd debt-app
npm init -y
npm install @capacitor/core @capacitor/cli
npx cap init "轻舟" "com.debt.app" --web-dir .

# 2. 添加 Android 平台
npm install @capacitor/android
npx cap add android

# 3. 同步 Web 资源到 Android 项目
npx cap sync android

# 4. 打开 Android Studio
npx cap open android
```

在 Android Studio 中：
- 等待 Gradle 同步完成
- 选择 Build → Build Bundle(s)/APK(s) → Build APK
- APK 输出位置：`android/app/build/outputs/apk/debug/app-debug.apk`

---

## 📋 功能清单

| 功能模块 | 说明 |
|---------|------|
| 📊 数据大屏 | 总负债/已还款/本月还款/待还金额统计，分类占比饼图，还款趋势柱状图，各类别进度条，近期还款提醒 |
| 💰 债务管理 | 添加/编辑/删除债务，支持6大分类（亲友/信用卡/网贷/房贷/车贷/其他），按分类筛选，还款进度可视化 |
| 📝 还款记录 | 记录每笔还款，按月份筛选，完整日期标记，关联对应债务 |
| 📅 还款规划 | 创建还款计划，优先级标记（高/中/低），到期提醒，逾期标红，完成状态追踪 |
| 💾 数据持久化 | 全部数据存储在浏览器 localStorage，换设备需手动导出 |

---

## ⚠️ 注意事项

1. **数据安全**：数据存储在浏览器本地，清除浏览器数据会丢失，建议定期截图备份
2. **跨设备**：如需多设备同步，建议部署后使用同一浏览器登录，或后续接入云存储
3. **HTTPS 必须**：PWA 安装和 Service Worker 要求 HTTPS 环境
4. **离线使用**：首次加载后，应用支持离线使用（Service Worker 缓存）

---

## 🎨 分类说明

| 分类 | 图标 | 适用场景 |
|-----|------|---------|
| 亲友 | 🤝 | 向家人朋友借的款项 |
| 信用卡 | 💳 | 各银行信用卡欠款 |
| 网贷 | 📱 | 花呗、借呗、微粒贷、京东白条等 |
| 房贷 | 🏠 | 住房按揭贷款 |
| 车贷 | 🚗 | 汽车分期贷款 |
| 其他 | 📦 | 不属于以上分类的债务 |
