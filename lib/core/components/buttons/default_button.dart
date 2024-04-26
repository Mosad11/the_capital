import 'package:flutter/material.dart';

Widget defaultButton({
  double width = double.infinity,
  bool isUpperCase = true,
  double radius = 10.0,
  required Function function,
  required String text,
}) =>
    Container(
      width: width,
      height: 60.0,
      decoration: BoxDecoration(
          color: const Color(0xff00BCD4),
          borderRadius: BorderRadius.circular(radius),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 3.0,
            ),
          ]),
      child: MaterialButton(
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 19),
        ),
        onPressed: () {
          function();
        },
      ),
    );
