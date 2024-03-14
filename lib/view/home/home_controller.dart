import 'dart:math';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var diceNumber = 1.obs;

  void rollDice() {
    diceNumber.value = Random().nextInt(6) + 1;
  }
}
// const SizedBox(
//   height: 30,
// ),
// CupertinoButton(
//   onPressed: () {
//     if (isPlayer1Turn) {
//       homeController.rollDice();
//       isPlayer1Turn = false;
//     }
//   },
//   color: CupertinoColors.activeBlue,
//   child: const Text(
//     "Player 1",
//     style: TextStyle(
//       color: CupertinoColors.white,
//       fontWeight: FontWeight.w500,
//       fontSize: 22,
//     ),
//   ),
// ),
// const SizedBox(height: 100),
// Obx(
//   () => ClipRRect(
//     borderRadius: BorderRadius.circular(25),
//     child: Image.asset(
//       'assets/images/dice${homeController.diceNumber.value}.png',
//       height: 120,
//     ),
//   ),
// ),
// const SizedBox(height: 100),
// CupertinoButton(
//   onPressed: () {
//     if (!isPlayer1Turn) {
//       homeController.rollDice();
//       isPlayer1Turn = true; // Switch turns
//     }
//   },
//   color: CupertinoColors.activeBlue,
//   child: const Text(
//     "Player 2",
//     style: TextStyle(
//       color: CupertinoColors.white,
//       fontWeight: FontWeight.w500,
//       fontSize: 22,
//     ),
//   ),
// ),
