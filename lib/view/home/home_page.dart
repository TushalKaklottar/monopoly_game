import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monopoly_game/model/app_data_models.dart';
import 'package:monopoly_game/view/home/home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final HomeController homeController = Get.put(HomeController());
  bool isPlayer1Turn = true;
  final List<Color> colorList = [
    Colors.red.shade400,
    Colors.green.shade300,
    Colors.yellow.shade300,
  ];
  final List<Color> colorList2 = [
    Colors.pink.shade300,
    Colors.purple.shade300,
    Colors.blue.shade300,
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
        child: Padding(
          padding: const EdgeInsets.all(1),
          child: Column(
            children: [
              Row(
                children: [
                  ...List.generate(10, (index) {
                    final colorIndex = index % colorList.length;
                    final data = dataList[index + 20];
                    return Container(
                      height: 105, // Height for the rest of the containers
                      width: 35.8,
                      color: colorList[colorIndex],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            data['city'] ?? 'Unknown City',
                            style: const TextStyle(fontSize: 12),
                          ),
                          Text(
                            data['price'] != null
                                ? '${data['price']}'
                                : 'No Price',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      ...List.generate(
                        10,
                        (index) {
                          final colorIndex = index % colorList2.length;
                          final data = dataList[index + 10];
                          return Container(
                            height: 50,
                            width: 60,
                            color: colorList2[colorIndex],
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  data['city'] ?? 'Unknown City',
                                  style: const TextStyle(fontSize: 12),
                                ),
                                Text(
                                  data['price'] != null
                                      ? '${data['price']}'
                                      : 'No Price',
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      CupertinoButton(
                        onPressed: () {
                          if (isPlayer1Turn) {
                            homeController.rollDice();
                            isPlayer1Turn = false;
                          }
                        },
                        color: CupertinoColors.activeBlue,
                        child: const Text(
                          "Player 1",
                          style: TextStyle(
                            color: CupertinoColors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Obx(
                        () => ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/images/dice${homeController.diceNumber.value}.png',
                            height: 80,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      CupertinoButton(
                        onPressed: () {
                          if (!isPlayer1Turn) {
                            homeController.rollDice();
                            isPlayer1Turn = true; // Switch turns
                          }
                        },
                        color: CupertinoColors.activeBlue,
                        child: const Text(
                          "Player 2",
                          style: TextStyle(
                            color: CupertinoColors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      ...List.generate(
                        10,
                        (index) {
                          final data = dataList[index + 30];
                          final colorIndex = index % colorList2.length;
                          return Container(
                            height: 50,
                            width: 60,
                            color: colorList2[colorIndex],
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  data['city'] ?? 'Unknown City',
                                  style: const TextStyle(fontSize: 12),
                                ),
                                Text(
                                  data['price'] != null
                                      ? '${data['price']}'
                                      : 'No Price',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    10, // Generating 8 containers as you already have the first and last
                    (index) {
                      final colorIndex = index % colorList.length;
                      final data = dataList[index];
                      return Container(
                        height: 105, // Height for the rest of the containers
                        width: 35.8, // Width for the rest of the containers
                        color: colorList[colorIndex],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              data['city'] ?? 'Unknown City',
                              style: const TextStyle(fontSize: 12),
                            ),
                            Text(
                              data['price'] != null
                                  ? '${data['price']}'
                                  : 'No Price',
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
