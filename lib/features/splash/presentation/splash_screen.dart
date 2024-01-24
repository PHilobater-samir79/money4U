import 'package:finance_app/core/App_Colors.dart';
import 'package:finance_app/core/App_Strings.dart';
import 'package:finance_app/core/Database/catch_helper.dart';
import 'package:finance_app/core/servieces/services_locator.dart';
import 'package:finance_app/features/home/home_screen.dart';
import 'package:finance_app/features/splash/presentation/onBoarding.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String routeName = 'splashScreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    navigator();
  }

  void navigator() {
    bool isVisited =
        getIt<CacheHelper>().getData(key: AppStrings.onBoardingVisit) ?? false;
    Future.delayed(Duration(seconds: 5), () {
      isVisited
          ? Navigator.pushReplacementNamed(context, HomeScreen.routeName)
          : Navigator.pushReplacementNamed(context, OnBoardingScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xffF3F7FA),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/images/splash.png',
                height: height*.5,
                width: width*.8,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0,top: 10),
              child: Text('Money 4U',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold)),
            )
          ],
        ),
      ),
    );
  }
}
