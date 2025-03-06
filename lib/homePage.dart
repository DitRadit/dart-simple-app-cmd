import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'controller.dart';
import 'settingsPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final taskController = Get.put(TaskController());
    final fontSizeController = Get.put(FontSizeController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home Page",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Get.to(() => const SettingsPage()),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Obx(() => CheckboxListTile(
                  title: Text(
                    "Task Completed",
                    style: GoogleFonts.roboto(fontSize: 18),
                  ),
                  value: taskController.isCompleted.value,
                  onChanged: (value) => taskController.toggleTask(),
                )),
            const SizedBox(height: 20),
            Obx(() => Text(
                  "Adjustable Font Size",
                  style: GoogleFonts.lato(
                    fontSize: fontSizeController.fontSize.value,
                    fontWeight: FontWeight.w600,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
