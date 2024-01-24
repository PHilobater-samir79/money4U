import 'dart:ui';

import 'package:finance_app/core/App_Colors.dart';
import 'package:finance_app/features/data/Money_Data/money_model.dart';
import 'package:finance_app/features/data/finance_cubit.dart';
import 'package:finance_app/features/home/minus.dart';
import 'package:finance_app/features/home/plus.dart';
import 'package:finance_app/features/home/see_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'homeScreen';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xffF3F7FA),
      body: BlocBuilder<FinanceCubit, FinanceState>(
        builder: (context, state) {
          BlocProvider.of<FinanceCubit>(context).fetchData();
          return Padding(
            padding: const EdgeInsets.all(20),
            child: SafeArea(
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome Back !',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'We have been waiting for you',
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Icon(
                        Icons.waving_hand_outlined,
                        color: Colors.black,
                        size: 35,
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * .03,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: height * .16,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                              )),
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'My Balance',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )),
                                SizedBox(
                                  height: 20,
                                ),
                                Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      '${BlocProvider.of<FinanceCubit>(context).myBalance} EG',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: height * .16,
                        width: width * .2,
                        decoration: BoxDecoration(
                            color: AppColors.teal,
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(10))),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: height * .16,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                              )),
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Today Balance',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )),
                                SizedBox(
                                  height: 20,
                                ),
                                Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      '${BlocProvider.of<FinanceCubit>(context).myBalance} EG',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: height * .16,
                        width: width * .2,
                        decoration: BoxDecoration(
                            color: AppColors.lightRed,
                            borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(10))),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * .03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: height * .07,
                        width: width * .4,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(Plus.routeName);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.teal,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                ' +  Plus',
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
                              Navigator.of(context).pushNamed(Minus.routeName);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.lightRed,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                ' -  Minus',
                                style: TextStyle(
                                    color: AppColors.Black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * .03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Activity',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, SeeAll.routeName);
                        },
                        child: Text(
                          'See All',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 23,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      separatorBuilder: (context, index) {
                        return Divider(
                          color: Colors.grey[300],
                        );
                      },
                      itemCount: BlocProvider.of<FinanceCubit>(context)
                          .todayMoneyList
                          .length,
                      itemBuilder: (context, index) {
                        List<MoneyModel> myList =
                            BlocProvider.of<FinanceCubit>(context)
                                .todayMoneyList
                                .reversed
                                .toList();
                        return InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  height: height * .4,
                                  width: width,
                                  decoration: BoxDecoration(
                                    color: Color(0xfffefefe),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20)),
                                      ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 20.0, left: 20),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          'assets/images/warn.png',
                                          height: height * .2,
                                          width: width * .5,
                                        ),
                                        Text(
                                          'Are you sure you want to delete the item ?',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17),
                                        ),
                                        SizedBox(
                                          height: height*.05,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              height: height * .07,
                                              width: width * .4,
                                              child: ElevatedButton(
                                                  onPressed: () {
                                                    try {
                                                      BlocProvider.of<
                                                                  FinanceCubit>(
                                                              context)
                                                          .deleteItem(
                                                              myList[index].id);
                                                      print('data delete');
                                                      Navigator.pop(context);
                                                      BlocProvider.of<
                                                                  FinanceCubit>(
                                                              context)
                                                          .fetchData();
                                                    } catch (e) {
                                                      print(e.toString());
                                                    }
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                      backgroundColor:
                                                          AppColors.teal,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15))),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            15.0),
                                                    child: Text(
                                                      'Sure',
                                                      style: TextStyle(
                                                          color:
                                                              AppColors.Black,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  )),
                                            ),
                                            SizedBox(
                                              height: height * .07,
                                              width: width * .4,
                                              child: ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                      backgroundColor:
                                                          AppColors.lightRed,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15))),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            15.0),
                                                    child: Text(
                                                      'Cancel',
                                                      style: TextStyle(
                                                          color:
                                                              AppColors.Black,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${myList[index].title}',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    myList[index].dateTime,
                                    style: TextStyle(
                                        color: Colors.grey[800],
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  Text(
                                    '${myList[index].moneyValue}',
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    ' EG',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
