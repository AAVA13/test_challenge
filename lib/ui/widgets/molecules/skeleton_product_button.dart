import 'package:flutter/material.dart';

class SkeletonProductButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 3, right: 10, top: 10, bottom: 10),
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(62, 0, 0, 0),
            blurRadius: 5,
            offset: Offset(0, 1), // Shadow position
          ),
        ],
      ),
      child: SafeArea(
        child: GestureDetector(
          child: Stack(
            children: [
              Center(
                  child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(101, 22, 22, 22),
                      Color.fromARGB(54, 26, 26, 26)
                    ],
                    stops: [0.2, 2],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
