import 'package:flutter/material.dart';

class NumbersWidget extends StatelessWidget {
  final String numbers;
  final Function() onTap;
  const NumbersWidget({super.key, required this.numbers, required this.onTap});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                height: height * .08,
                width: width * .25,
                decoration: BoxDecoration(
                   color: Colors.grey[500],
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text(
                  numbers,
                  style:  TextStyle(
                     /// color:!darkMode?  Colors.white: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ),
          );

  }
}
