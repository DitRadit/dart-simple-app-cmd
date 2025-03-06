import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'controller.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final fontSizeController = Get.find<FontSizeController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Adjust Font Size",
              style:
                  GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            Obx(() => Slider(
                  value: fontSizeController.fontSize.value,
                  min: 12,
                  max: 32,
                  divisions: 10,
                  label: fontSizeController.fontSize.value.toString(),
                  onChanged: (newSize) =>
                      fontSizeController.setFontSize(newSize),
                )),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: "Enter text",
                labelStyle: GoogleFonts.lato(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
