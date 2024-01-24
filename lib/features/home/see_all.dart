import 'package:finance_app/core/App_Colors.dart';
import 'package:finance_app/features/data/Money_Data/money_model.dart';
import 'package:finance_app/features/data/finance_cubit.dart';
import 'package:finance_app/features/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

class SeeAll extends StatefulWidget {
  static const String routeName = 'seeAll';

  @override
  State<SeeAll> createState() => _SeeAllState();
}

class _SeeAllState extends State<SeeAll> {
  CalendarFormat calendarFormat = CalendarFormat.week;
  DateTime mySelectedDay = DateTime.now();
  DateTime myFocusedDay = DateTime.now();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<FinanceCubit>(context).fetchDateDate(dateTime: mySelectedDay);
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
          'All Activities',
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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: BlocBuilder<FinanceCubit, FinanceState>(
          builder: (context, state) {
            return Column(
              children: [
                TableCalendar(
                  headerStyle: HeaderStyle(
                    titleTextStyle: TextStyle(color: Colors.black),
                    formatButtonTextStyle: TextStyle(color: Colors.black)
                  ),
                  daysOfWeekStyle: DaysOfWeekStyle(
                    weekdayStyle: TextStyle(
                      color: Colors.black
                    )
                  ),
                  calendarStyle: CalendarStyle(

                    todayTextStyle: TextStyle(
                      color: Colors.black
                    ),
                      selectedTextStyle: TextStyle(color: Colors.black),
                      holidayTextStyle: TextStyle(color: Colors.black),
                      defaultTextStyle: TextStyle(color: Colors.black)),
                  firstDay: DateTime(2023),
                  lastDay: DateTime.now(),
                  focusedDay: myFocusedDay,
                  calendarFormat: calendarFormat,
                  onFormatChanged: (format) {
                    setState(() {
                      calendarFormat = format;
                    });
                  },
                  currentDay: mySelectedDay,
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      mySelectedDay = selectedDay;
                      myFocusedDay = focusedDay;
                      BlocProvider.of<FinanceCubit>(context).currentDate =
                          selectedDay;
                    });
                    BlocProvider.of<FinanceCubit>(context).fetchDateDate(dateTime: mySelectedDay);
                  },
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
                                  "${myList[index].dateTime}",
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
            );
          },
        ),
      ),
    );
  }
}
