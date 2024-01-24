import 'package:bloc/bloc.dart';
import 'package:finance_app/core/Database/sqflite_Database.dart';
import 'package:finance_app/core/servieces/services_locator.dart';
import 'package:finance_app/features/data/Money_Data/money_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

part 'finance_state.dart';

class FinanceCubit extends Cubit<FinanceState> {
  FinanceCubit() : super(FinanceInitial());

  List<MoneyModel> allMoneyList = [];
  List<MoneyModel> todayMoneyList = [];

  TextEditingController titleControl = TextEditingController();
  DateTime mySelectedDay = DateTime.now();
  String number = '';
  DateTime currentDate = DateTime.now();
  double myBalance = 0;
  double todayBalance = 0;

  void addData(MoneyModel moneyModel) async {
    emit(AddDataLoading());
    try {
      await getIt<SQFLiteHelper>().insertDataToDatabase(moneyModel);
      fetchData();
      emit(AddDataSuccess());
      print('data fetched');
    } on Exception catch (e) {
      emit(AddDataFailure(errorMessage: e.toString()));
    }
  }

  void deleteItem(id) async {
    try {
      emit(deleteDataLoading());
      await getIt<SQFLiteHelper>().deleteDataFromDatabase(id);
      fetchData();
      emit(deleteDataSuccess());
    } catch (e) {
      print(e.toString());
      emit(deleteDataFailure(errorMessage: e.toString()));
    }
  }

  fetchData() async {
    try {
      emit(FinanceLoading());
      await getIt<SQFLiteHelper>().getDataFromDatabase().then((value) {
        allMoneyList = value.map((e) => MoneyModel.fromJson(e)).toList();
      });
      fetchDateDate();
      myBalance = 0;
      todayBalance = 0;
      for (var element in allMoneyList) {
        myBalance += element.moneyValue;
      }
      for (var element in todayMoneyList) {
        todayBalance += element.moneyValue;
      }
      emit(FinanceSuccess());
    } catch (e) {
      print(e.toString());
      emit(FinanceFailure(errorMessage: e.toString()));
    }
    return allMoneyList;
  }

  fetchDateDate({DateTime? dateTime}) async {
    try {
      await getIt<SQFLiteHelper>().getDataFromDatabase().then((value) {
        todayMoneyList = value
            .map((e) => MoneyModel.fromJson(e))
            .toList()
            .where(
              (element) =>
          element.dateTime ==
              DateFormat.yMMMEd().format(dateTime ?? currentDate),
        )
            .toList();
      });
    }catch (e){
      print(e.toString());
    }
  }

  ///List<> dataList = [];
  ///List<> todayList = [];

  /*
  fetchData() {
    emit(FinanceLoading());
    try {
      dataList = Hive.box<HiveModel>('moneyBox').values.toList();
      fetchDateDate();
      myBalance = 0;
      todayBalance = 0 ;
      for (var element in dataList) {
        myBalance += element.value;
      }
      for (var element in todayList) {
        todayBalance += element.value;
      }
      emit(FinanceSuccess());
    } on Exception catch (e) {
      emit(FinanceFailure(errorMessage: e.toString()));
    }
    return dataList;
  }

  fetchDateDate ({DateTime? dateTime}){
    todayList = Hive.box<HiveModel>('moneyBox')
        .values
        .toList()
        .where((element) =>
    DateFormat.yMd().add_jm().format(element.date) ==
        DateFormat.yMd().add_jm().format(dateTime ?? DateTime.now()))
        .toList();

  }

*/
}
