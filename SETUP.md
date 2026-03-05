# دليل الإعداد الكامل — Claude Mobile

## الخطوة 1: تحميل Termux

⚠️ **مهم**: حمّل Termux من **F-Droid فقط** وليس Play Store
- رابط: https://f-droid.org/packages/com.termux/
- نسخة Play Store قديمة ولا تعمل بشكل صحيح

## الخطوة 2: الإعدادات الأولية في Termux

```bash
# السماح لـ Termux بالوصول للتخزين
termux-setup-storage

# تحديث الحزم
pkg update && pkg upgrade
```

## الخطوة 3: الحصول على Anthropic API Key

1. اذهب إلى https://console.anthropic.com
2. سجّل حساباً أو سجّل الدخول
3. اذهب إلى API Keys
4. أنشئ مفتاحاً جديداً واحفظه

## الخطوة 4: تشغيل bootstrap

```bash
bash bootstrap.sh
```

## الخطوة 5: إضافة API Key

```bash
export ANTHROPIC_API_KEY="sk-ant-..."
echo "export ANTHROPIC_API_KEY='sk-ant-...'" >> ~/.zshrc
```

## الخطوة 6: اختبار التثبيت

```bash
claude "قل مرحباً"
```

## نصائح للأداء الأمثل

- استخدم **WiFi** بدلاً من بيانات الهاتف
- أبقِ Termux في الخلفية بدلاً من إغلاقه
- استخدم `tmux` للحفاظ على الجلسات
