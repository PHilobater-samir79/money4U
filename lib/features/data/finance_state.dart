part of 'finance_cubit.dart';


@immutable
abstract class FinanceState {}

class FinanceInitial extends FinanceState {}
class FinanceLoading extends FinanceState {}
class FinanceSuccess extends FinanceState {}
class FinanceFailure extends FinanceState {
  final String errorMessage ;
  FinanceFailure({required this.errorMessage});
}

class DateTimeLoading extends FinanceState {}
class DateTimeSuccess extends FinanceState {}
class DateTimeFailure extends FinanceState {
  final String errorMessage ;
  DateTimeFailure({required this.errorMessage});
}

class AddDataInitial extends FinanceState {}
class AddDataLoading extends FinanceState {}
class AddDataSuccess extends FinanceState {}
class AddDataFailure extends FinanceState {
  String errorMessage ;
  AddDataFailure({required this.errorMessage});
}

class updateDataInitial extends FinanceState {}
class updateDataLoading extends FinanceState {}
class updateDataSuccess extends FinanceState {}
class updateDataFailure extends FinanceState {
  String errorMessage ;
  updateDataFailure({required this.errorMessage});
}

class deleteDataInitial extends FinanceState {}
class deleteDataLoading extends FinanceState {}
class deleteDataSuccess extends FinanceState {}
class deleteDataFailure extends FinanceState {
  String errorMessage ;
  deleteDataFailure({required this.errorMessage});
}
