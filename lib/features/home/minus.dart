import 'package:finance_app/core/App_Colors.dart';
import 'package:finance_app/features/data/Money_Data/money_model.dart';
import 'package:finance_app/features/data/finance_cubit.dart';
import 'package:finance_app/features/home/home_screen.dart';
import 'package:finance_app/features/home/widget/numbers_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class Minus extends StatefulWidget {
  static const String routeName = 'Minus';
  MoneyModel? moneyModel ;
  Minus({this.moneyModel});

@override
  State<Minus> createState() => _MinusState();
}



class _MinusState extends State<Minus> {

  @override
  void initState() {
    super.initState();
    if (widget.moneyModel != null){
      BlocProvider.of<FinanceCubit>(context).titleControl.text = widget.moneyModel!.title;
      BlocProvider.of<FinanceCubit>(context).number = widget.moneyModel!.moneyValue.toString();
    }
  }


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xffF3F7FA),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Minus',
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.black87,
            )),
      ),
      body: BlocProvider(
          create: (context) => FinanceCubit(),
          child: BlocBuilder<FinanceCubit, FinanceState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextField(
                      style: TextStyle(color: Colors.black),
                      controller:
                          BlocProvider.of<FinanceCubit>(context).titleControl,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: AppColors.teal)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: AppColors.teal)),
                          hintText: 'Details Here......',
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          filled: true,
                          fillColor: AppColors.teal,
                          suffixIcon: Icon(
                            Icons.pending_actions,
                            color: Colors.black,
                          )),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: height * .08,
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.lightRed,
                      ),
                      child: BlocProvider.of<FinanceCubit>(context).number == ""
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.remove,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '0.0  EG',
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.black),
                                ),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.remove,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '${BlocProvider.of<FinanceCubit>(context).number} EG',
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.black),
                                ),
                              ],
                            ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        NumbersWidget(
                            numbers: '1',
                            onTap: () {
                              setState(() {
                                BlocProvider.of<FinanceCubit>(context).number =
                                    BlocProvider.of<FinanceCubit>(context)
                                            .number +
                                        "1";
                              });
                            }),
                        NumbersWidget(
                            numbers: '2',
                            onTap: () {
                              setState(() {
                                BlocProvider.of<FinanceCubit>(context).number =
                                    BlocProvider.of<FinanceCubit>(context)
                                            .number +
                                        "2";
                              });
                            }),
                        NumbersWidget(
                            numbers: '3',
                            onTap: () {
                              setState(() {
                                BlocProvider.of<FinanceCubit>(context).number =
                                    BlocProvider.of<FinanceCubit>(context)
                                            .number +
                                        "3";
                              });
                            }),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        NumbersWidget(
                            numbers: '4',
                            onTap: () {
                              setState(() {
                                BlocProvider.of<FinanceCubit>(context).number =
                                    BlocProvider.of<FinanceCubit>(context)
                                            .number +
                                        "4";
                              });
                            }),
                        NumbersWidget(
                            numbers: '5',
                            onTap: () {
                              setState(() {
                                BlocProvider.of<FinanceCubit>(context).number =
                                    BlocProvider.of<FinanceCubit>(context)
                                            .number +
                                        "5";
                              });
                            }),
                        NumbersWidget(
                            numbers: '6',
                            onTap: () {
                              setState(() {
                                BlocProvider.of<FinanceCubit>(context).number =
                                    BlocProvider.of<FinanceCubit>(context)
                                            .number +
                                        "6";
                              });
                            }),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        NumbersWidget(
                            numbers: '7',
                            onTap: () {
                              setState(() {
                                BlocProvider.of<FinanceCubit>(context).number =
                                    BlocProvider.of<FinanceCubit>(context)
                                            .number +
                                        "7";
                              });
                            }),
                        NumbersWidget(
                            numbers: '8',
                            onTap: () {
                              setState(() {
                                BlocProvider.of<FinanceCubit>(context).number =
                                    BlocProvider.of<FinanceCubit>(context)
                                            .number +
                                        "8";
                              });
                            }),
                        NumbersWidget(
                            numbers: '9',
                            onTap: () {
                              setState(() {
                                BlocProvider.of<FinanceCubit>(context).number =
                                    BlocProvider.of<FinanceCubit>(context)
                                            .number +
                                        "9";
                              });
                            }),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        NumbersWidget(
                            numbers: '.',
                            onTap: () {
                              setState(() {
                                BlocProvider.of<FinanceCubit>(context)
                                        .number
                                        .contains('.')
                                    ? null
                                    : BlocProvider.of<FinanceCubit>(context)
                                            .number =
                                        BlocProvider.of<FinanceCubit>(context)
                                                .number +
                                            ".";
                              });
                            }),
                        NumbersWidget(
                            numbers: '0',
                            onTap: () {
                              setState(() {
                                BlocProvider.of<FinanceCubit>(context).number =
                                    BlocProvider.of<FinanceCubit>(context)
                                            .number +
                                        "0";
                              });
                            }),
                        NumbersWidget(
                            numbers: "Delete",
                            onTap: () {
                              setState(() {
                                BlocProvider.of<FinanceCubit>(context).number ==
                                        ""
                                    ? null
                                    : BlocProvider.of<FinanceCubit>(context)
                                            .number =
                                        BlocProvider.of<FinanceCubit>(context)
                                            .number
                                            .substring(
                                                0,
                                                BlocProvider.of<FinanceCubit>(
                                                            context)
                                                        .number
                                                        .length -
                                                    1);
                              });
                            })
                      ],
                    ),
                    SizedBox(
                      height: height * .09,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: height * .07,
                          width: width * .4,
                          child: ElevatedButton(
                              onPressed: () {
                                try {
                                  BlocProvider.of<FinanceCubit>(context)
                                      .addData(MoneyModel(
                                          dateTime: DateFormat.yMMMEd().format(
                                              BlocProvider.of<FinanceCubit>(
                                                      context)
                                                  .currentDate),
                                          title: BlocProvider.of<FinanceCubit>(
                                                  context)
                                              .titleControl
                                              .text,
                                          moneyValue: double.parse(BlocProvider.of<FinanceCubit>(context).number) * - 1
                                  ));
                                  print('data added');
                                  BlocProvider.of<FinanceCubit>(context).fetchData();
                                  BlocProvider.of<FinanceCubit>(context).fetchDateDate(dateTime: BlocProvider.of<FinanceCubit>(context).mySelectedDay);

                                  Navigator.of(context).pop();
                                } catch (e) {
                                  print(e.toString());
                                }
                              },
                              /*
                                    onPressed: () {
                                      try {
                                        if (widget.hiveModel != null) {
                                          widget.hiveModel!.title =
                                              details.text;
                                          widget.hiveModel!.value =
                                              double.parse(number) < 0
                                                  ? double.parse(number)
                                                  : double.parse(number) * -1;
                                          widget.hiveModel!.save();
                                        } else {
                                          BlocProvider.of<AddDataCubit>(context)
                                              .addData(HiveModel(
                                            title: details.text,
                                            value: double.parse(number) * -1,
                                            date: DateTime.now(),
                                          ));
                                        }
                                        BlocProvider.of<FinanceCubit>(context)
                                            .fetchData();
                                        BlocProvider.of<FinanceCubit>(context).fetchDateDate(dateTime: BlocProvider.of<FinanceCubit>(context).dateTimeSelected);
                                        Navigator.of(context).pop();
                                      } on Exception catch (e) {
                                        print(e.toString());
                                      }
                                    },
                                    */
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.teal,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(
                                  ' Done ',
                                  style: TextStyle(
                                      color: AppColors.Black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                        ),
                        SizedBox(
                          height: height * .07,
                          width: width * .4,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(HomeScreen.routeName);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.lightRed,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(
                                      color: AppColors.Black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          )),
    );
  }
}
