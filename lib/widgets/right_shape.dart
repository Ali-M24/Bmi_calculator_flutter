import 'package:bmi_calculator/utils/colors.dart';
import 'package:flutter/material.dart';

class RightShape extends StatelessWidget {
  final double height;
  final double width;

  const RightShape({super.key, required this.width, this.height = 40});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'شاخص منفی',
          style: TextStyle(color: redbackground, fontSize: 16.0),
        ),
        SizedBox(width: 10),
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
            ),
            color: redbackground,
          ),
        ),
      ],
    );
  }
}
