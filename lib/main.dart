import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFF8AC2A),
          automaticallyImplyLeading: false,
          title: const Text(
            'Kartu Nama',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Inter Tight',
              color: Colors.white,
              fontSize: 22,
            ),
          ),
          elevation: 2,
        ),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 225,
                    height: 225,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                      'https://media.tenor.com/ZVS9i2eGYFwAAAAe/caelus-honkai-star-rail-caelus.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Adi Raditya P.',
                    style: TextStyle(
                      fontFamily: 'Inter Tight',
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Mahasiswa Telkom',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 23,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () async {
                      final Uri url = Uri.parse(
                          'https://ditradit.github.io/portofolio.github.io/?');
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url,
                            mode: LaunchMode.externalApplication);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Akses Portofolio'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
