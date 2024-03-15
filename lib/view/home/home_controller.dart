import 'dart:math';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var diceNumber = 1.obs;
  var tokenImages = 'assets/images/token.1png';

  void rollDice() {
    diceNumber.value = Random().nextInt(6) + 1;
  }
}
