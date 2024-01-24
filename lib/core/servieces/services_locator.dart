import 'package:finance_app/core/Database/catch_helper.dart';
import 'package:finance_app/core/Database/sqflite_Database.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setup() {
  getIt.registerLazySingleton<CacheHelper>(() => CacheHelper());
  getIt.registerLazySingleton<SQFLiteHelper>(() => SQFLiteHelper());
}
