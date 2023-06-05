import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart ';
import 'package:genielogiciel/utils/theme.dart';

class SpashScreen extends StatefulWidget {
  const SpashScreen({super.key});

  @override
  State<SpashScreen> createState() => _SpashScreenState();
}

class _SpashScreenState extends State<SpashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _animation = CurvedAnimation(
        parent: _animationController,
        curve: Curves.bounceOut,
        reverseCurve: Curves.bounceInOut);
    _animationController.forward();

    // Timer(
    //     Duration(milliseconds: 2500),
    //     () => Navigator.pushReplacement(
    //         context, MaterialPageRoute(builder: (_) => LoginScreen())));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return Scaffold(
      backgroundColor: MyTheme.splash,
      body: Container(
        child: Center(
          child: ScaleTransition(
            scale: _animation,
            child: SvgPicture.asset(
              "assets/icons/splash_icon.svg",
              height: 60.0,
            ),
          ),
        ),
      ),
    );
  }
}
