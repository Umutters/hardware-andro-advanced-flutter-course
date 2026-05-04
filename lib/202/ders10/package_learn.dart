import 'package:flutter/material.dart';
import 'package:hwa_learn/202/ders10/package/launcher_manager.dart';
import 'package:hwa_learn/202/ders10/package/loading_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class PackageLearnView extends StatefulWidget {
  const PackageLearnView({super.key});

  @override
  State<PackageLearnView> createState() => _PackageLearnViewState();
}

class _PackageLearnViewState extends State<PackageLearnView> with LaunchMixin {
  final Uri _url = Uri.parse('https://flutter.dev');

  // SMS için URI - telefon numarası ve mesaj ile
  final Uri _smsUri = Uri.parse(
    'sms:+905551234567?body=Merhaba bu bir test mesajı',
  );

  // Telefon araması için URI
  final Uri _phoneUri = Uri.parse('tel:+905551234567');

  // Email için URI
  final Uri _emailUri = Uri.parse(
    'mailto:test@example.com?subject=Konu&body=Mesaj içeriği',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('URL Launcher Examples')),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        onPressed: () => launchUrl_(_url),
        child: const Icon(Icons.web),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () => launchUrl_(_url),
              icon: const Icon(Icons.web),
              label: const Text('Web Sitesi Aç'),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () => launchSms(_smsUri),
              icon: const Icon(Icons.sms),
              label: const Text('SMS Gönder'),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () => launchPhone(_phoneUri),
              icon: const Icon(Icons.phone),
              label: const Text('Telefon Et'),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () => launchEmail(_emailUri),
              icon: const Icon(Icons.email),
              label: const Text('Email Gönder'),
            ),
            const SizedBox(height: 32),
            const LoadingBar(),
          ],
        ),
      ),
    );
  }
}
