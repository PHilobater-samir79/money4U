import 'package:finance_app/My_App.dart';
import 'package:finance_app/core/Database/catch_helper.dart';
import 'package:finance_app/core/Database/sqflite_Database.dart';
import 'package:finance_app/core/servieces/services_locator.dart';
import 'package:finance_app/features/data/finance_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  await getIt<CacheHelper>().cacheInit();
  getIt<SQFLiteHelper>().initDatabase();

  runApp(FinanceApp());
}
