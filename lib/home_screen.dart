import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Variabel dinamis yang akan digunakan di terjemahan
  final String userName = "John";
  final String postStatus = "private"; // bisa 'public' atau 'private'
  final DateTime lastLogin = DateTime.now();
  final double balance = 1250000.75;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home.title'.tr()),
        actions: [
          // Tombol ganti bahasa
          DropdownButton<Locale>(
            value: context.locale,
            items: const [
              DropdownMenuItem(value: Locale('en'), child: Text('English')),
              DropdownMenuItem(value: Locale('id'), child: Text('Bahasa')),
            ],
            onChanged: (Locale? newLocale) {
              if (newLocale != null) {
                context.setLocale(newLocale);
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Contoh 1: Terjemahan sederhana
            Text('home.greeting'.tr(namedArgs: {'name': userName})),

            const SizedBox(height: 20),

            // Contoh 2: Dynamic key berdasarkan variabel
            Text('home.status.$postStatus'.tr()),

            const SizedBox(height: 20),

            // Contoh 3: Format tanggal sesuai locale
            Text(
              'home.last_login'.tr(
                args: [DateFormat.yMMMMd().format(lastLogin)],
              ),
            ),

            const SizedBox(height: 20),

            // Contoh 4: Format angka/mata uang
            Text(
              'home.balance'.tr(
                namedArgs: {
                  'amount': NumberFormat.currency(
                    locale: context.locale.toString(),
                    symbol: 'Rp',
                  ).format(balance),
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
