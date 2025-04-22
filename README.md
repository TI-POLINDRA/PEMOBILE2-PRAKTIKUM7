# Praktikum 7 (Internationalization and Localization)

Praktikum ini bertujuan untuk mengimplementasikan Internationalization (i18n) dan Localization (l10n) dalam aplikasi Flutter dengan menggunakan library `Intl` dan `EasyLocalization`. Internationalization adalah proses merancang aplikasi agar dapat mendukung berbagai bahasa dan format lokal tanpa perubahan kode lebih lanjut. Localization, di sisi lain, adalah proses menerapkan spesifik bahasa dan format lokal ke aplikasi.

Library `Intl` digunakan untuk menangani format tanggal, angka, dan teks lainnya yang sensitif terhadap lokal. Sedangkan `EasyLocalization` memudahkan manajemen terjemahan dan pergantian bahasa dalam aplikasi.

Anda dapat memulai dengan menambahkan dependensi berikut pada `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  intl: ^0.20.2
  easy_localization: ^3.0.7+1
```

Setelah itu, buat folder `assets/translations` dan tambahkan file JSON untuk setiap bahasa yang didukung, contohnya `en.json` dan `id.json`. Setiap file JSON berisi key-value pair untuk teks yang dapat diterjemahkan.

Contoh `en.json`:
```json
{
  "title": "Welcome",
  "greeting": "Hello, how are you?"
}
```

Contoh `id.json`:
```json
{
  "title": "Selamat Datang",
  "greeting": "Halo, apa kabar?"
}
```

Kemudian, konfigurasikan aplikasi Anda untuk menggunakan `EasyLocalization` dengan menambahkan inisialisasi di `main.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('id')],
      path: 'assets/translations', // path to translation files
      fallbackLocale: Locale('en'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title').tr(),
      ),
      body: Center(
        child: Text('greeting').tr(),
      ),
    );
  }
}
```

Dengan konfigurasi ini, aplikasi Anda dapat menampilkan teks dalam berbagai bahasa sesuai dengan pengaturan lokal yang dipilih. Anda dapat dengan mudah menambahkan bahasa baru dengan membuat file JSON baru dan mengisi terjemahannya.
