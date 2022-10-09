import 'package:flutter/material.dart';

Widget entete(String title, String subtitle) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        margin: const EdgeInsets.only(right: 20),
        child: Image.asset(
          "images/3.jpg",
          width: 150,
          height: 150,
        ),
      ),
      Container(
        margin: const EdgeInsets.only(left: 20),
        width: 150,
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 30,
              color: Color.fromARGB(255, 4, 57, 101),
              fontWeight: FontWeight.bold),
        ),
      ),
      Container(
        margin: const EdgeInsets.only(left: 20),
        width: 150,
        child: Text(
          subtitle,
          style: const TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 4, 57, 101),
              fontWeight: FontWeight.bold),
        ),
      ),
    ],
  );
}
