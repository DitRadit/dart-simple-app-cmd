import 'package:get/get.dart';

/// Manages font size state
class FontSizeController extends GetxController {
  var fontSize = 16.0.obs;

  void setFontSize(double newSize) {
    fontSize.value = newSize;
  }
}

/// Manages task completion state
class TaskController extends GetxController {
  var isCompleted = false.obs;

  void toggleTask() {
    isCompleted.value = !isCompleted.value;
  }
}
