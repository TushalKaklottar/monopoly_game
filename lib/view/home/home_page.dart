import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:monopoly_game/view/home/home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key});

  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              CupertinoButton(
                onPressed: () {
                  homeController.rollDice();
                },
                color: CupertinoColors.activeBlue,
                child: const Text(
                  "Player 1",
                  style: TextStyle(
                    color: CupertinoColors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                  ),
                ),
              ),
              const SizedBox(height: 100),
              GetBuilder<HomeController>(
                builder: (controller) => ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(
                    'assets/images/dice${controller.diceNumber.value}.png',
                  ),
                ),
              ),
              const SizedBox(height: 100),
              CupertinoButton(
                onPressed: () {
                  homeController.rollDice();
                },
                color: CupertinoColors.activeBlue,
                child: const Text(
                  "Player 2",
                  style: TextStyle(
                    color: CupertinoColors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
