import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:monopoly_game/utils/color.dart';
import 'package:monopoly_game/view/home/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.linear);

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(seconds: 1), () {
          Get.off(HomePage());
        });
      }
    });
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: customBackgroundColor.color,
      child: Center(
        child: ScaleTransition(
          scale: _animation,
          child: Image.asset(
            "assets/images/monopoly.png",
            height: 100,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
