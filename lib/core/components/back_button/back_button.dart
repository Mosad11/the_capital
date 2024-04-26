import 'package:flutter/material.dart';

GestureDetector backButton(context) => GestureDetector(
    onTap: () {
      Navigator.pop(context);
    },
    child: Row(
      children: const [
        SizedBox(width: 8),
        Icon(Icons.arrow_back_ios_new_outlined, color: Colors.indigo, size: 15),
        Text("Back",style: TextStyle(
          color: Colors.indigo
        ),)
      ],
    ));
