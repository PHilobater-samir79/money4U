import 'package:finance_app/features/data/finance_cubit.dart';
import 'package:finance_app/features/home/home_screen.dart';
import 'package:finance_app/features/home/minus.dart';
import 'package:finance_app/features/home/plus.dart';
import 'package:finance_app/features/home/see_all.dart';
import 'package:finance_app/features/splash/presentation/onBoarding.dart';
import 'package:finance_app/features/splash/presentation/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FinanceApp extends StatelessWidget {
  const FinanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FinanceCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.dark(useMaterial3: true),
        theme: ThemeData(useMaterial3: true),
        initialRoute: SplashScreen.routeName,
        routes: {
          SplashScreen.routeName: (context) => SplashScreen(),
          HomeScreen.routeName: (context) => HomeScreen(),
          OnBoardingScreen.routeName: (context) => OnBoardingScreen(),
          Plus.routeName: (context) => Plus(),
          Minus.routeName: (context) => Minus(),
          SeeAll.routeName: (context) => SeeAll(),
        },
      ),
    );
  }
}
