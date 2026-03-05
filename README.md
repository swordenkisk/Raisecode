# 📱 Claude Mobile
### Claude Code على هاتف Android — خفيف، سريع، بدون نماذج محلية

<div align="center">

![Version](https://img.shields.io/badge/version-1.0.0-blue)
![Platform](https://img.shields.io/badge/platform-Android-green)
![Size](https://img.shields.io/badge/size-~230MB-orange)
![License](https://img.shields.io/badge/license-MIT-purple)

</div>

---

## 💡 الفكرة

بدلاً من تشغيل نموذج AI ضخم على الهاتف (يحتاج عشرات الجيجابايتات)، يستخدم **Claude Mobile** نهجاً أذكى:

```
هاتفك  →  Client خفيف (~230MB)  →  Anthropic API  →  Claude
```

هاتفك يعمل كـ **terminal ذكي** يتصل مباشرة بخوادم Anthropic — لا نماذج محلية، لا استهلاك RAM، فقط قوة Claude الكاملة!

---

## ⚡ متطلبات

- هاتف Android (5.0+)
- تطبيق **Termux** (من F-Droid)
- اتصال إنترنت
- **Anthropic API Key** (من console.anthropic.com)
- مساحة: ~230MB فقط ✅

---

## 🚀 التثبيت السريع

### 1. تثبيت Termux
```
حمّل Termux من F-Droid (ليس Play Store)
https://f-droid.org/packages/com.termux/
```

### 2. تشغيل Bootstrap
افتح Termux وانسخ هذا الأمر:
```bash
curl -sL https://raw.githubusercontent.com/YOUR_USERNAME/claude-mobile/main/termux/bootstrap.sh | bash
```

### 3. إعداد API Key
```bash
claude config set apiKey YOUR_API_KEY
```

### 4. ابدأ البرمجة! 🎉
```bash
claude "ساعدني في بناء تطبيق Python"
```

---

## 📂 هيكل المشروع

```
claude-mobile/
├── 📄 README.md
├── 📁 termux/
│   └── bootstrap.sh      # سكريبت التثبيت الرئيسي
├── 📁 scripts/
│   ├── server.sh          # وضع الـ Server المحلي
│   └── new_project.sh     # إنشاء مشروع جديد
├── 📁 config/
│   └── .claude-mobile.yml # إعدادات افتراضية
└── 📁 docs/
    ├── SETUP.md
    └── TROUBLESHOOT.md
```

---

## 🛠️ الأوامر المتاحة

| الأمر | الوظيفة |
|-------|---------|
| `claude "سؤال"` | سؤال مباشر لـ Claude |
| `claude .` | فتح Claude Code في المجلد الحالي |
| `newproject` | إنشاء مشروع جديد |
| `bash server.sh` | تشغيل وضع الـ Server |
| `projects` | الانتقال لمجلد المشاريع |

---

## 🌐 وضع الـ Server

يمكنك تشغيل Claude Mobile كـ **server محلي** يمكن الوصول إليه من أي جهاز على نفس الشبكة:

```bash
bash ~/claude-mobile/scripts/server.sh
```

ثم من أي جهاز آخر:
```bash
curl -X POST http://IP_هاتفك:8765/ask \
  -H "Content-Type: application/json" \
  -d '{"prompt": "مرحباً Claude!"}'
```

---

## 📦 ما يُثبَّت (المساحة الكاملة)

| المكون | الحجم |
|--------|------|
| Termux + base | ~80 MB |
| Node.js | ~55 MB |
| Claude Code CLI | ~35 MB |
| Git + أدوات | ~45 MB |
| Python (للـ server) | ~15 MB |
| **المجموع** | **~230 MB** ✅ |

---

## 🔧 استكشاف الأخطاء

**مشكلة: `claude: command not found`**
```bash
npm install -g @anthropic-ai/claude-code
```

**مشكلة: خطأ في API Key**
```bash
export ANTHROPIC_API_KEY="your-key-here"
```

**مشكلة: بطء الاتصال**
- تأكد من اتصال WiFi قوي
- جرب شبكة مختلفة

---

## 🤝 المساهمة

هذا المشروع مفتوح للجميع! 
- افتح Issue لأي مشكلة
- أرسل Pull Request لتحسين الكود
- شارك الفكرة مع المطورين العرب 🌍

---

## 📄 الرخصة

MIT License — استخدم، عدّل، وشارك بحرية.

---

<div align="center">
  Made with ❤️ for Arab Developers
  
  **"البرمجة في جيبك"** 📱
</div>
