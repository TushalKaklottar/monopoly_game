import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monopoly_game/model/app_data_models.dart';
import 'package:monopoly_game/view/home/home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final HomeController homeController = Get.put(HomeController());
  bool isPlayer1Turn = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
          child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 100,
                width: 50,
                color: Colors.primaries[0].shade300, // Example color
              ),
              ...List.generate(
                  8, // Generating 8 containers as you already have the first and last
                  (index) {
                final data = dataList[index];
                return Container(
                  height: 80,
                  width: 38.5,
                  color: Colors.primaries[(index + 1) % 18].shade300,
                  child: Column(
                    children: [
                      Text(data['city'] ?? 'Unknown City'),
                      Text(data['price'] != null
                          ? '${data['price']}'
                          : 'No Price'),
                    ],
                  ),
                );
              }),
              Container(
                height: 100, // Height for the last container
                width: 50, // Width for the last container
                color: Colors.primaries[9 % 18].shade300, // Example color
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  ...List.generate(
                    9,
                    (index) => Container(
                      height: 40,
                      width: 50,
                      color: Colors.primaries[index % 18].shade300,
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  ...List.generate(
                    9,
                    (index) => Container(
                      height: 40,
                      width: 50,
                      color: Colors.primaries[index % 18].shade300,
                    ),
                  )
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100, // Height for the first container
                width: 50, // Width for the first container
                color: Colors.primaries[0].shade300, // Example color
              ),
              ...List.generate(
                8, // Generating 8 containers as you already have the first and last
                (index) => Container(
                  height: 80, // Height for the rest of the containers
                  width: 38.5, // Width for the rest of the containers
                  color: Colors
                      .primaries[(index + 1) % 18].shade300, // Example color
                ),
              ),
              Container(
                height: 100, // Height for the last container
                width: 50, // Width for the last container
                color: Colors.primaries[9 % 18].shade300, // Example color
              ),
            ],
          )
        ],
      )),
    );
  }

  Widget buildItem(int index) {
    // Generate a random color
    final randomColor =
        Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

    return Container(
      width: 31, // Adjust the width as needed
      height: 20, // Adjust the height as needed
      margin: const EdgeInsets.all(2), // Adjust the margin as needed
      color: randomColor, // Set the color to the randomly generated color
    );
  }
}
