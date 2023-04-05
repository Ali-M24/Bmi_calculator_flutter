import 'package:bmi_calculator/utils/colors.dart';
import 'package:flutter/material.dart';

class LeftShape extends StatelessWidget {
  final double width;
  final double height;

  const LeftShape({super.key, required this.width, this.height = 40});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
            ),
            color: greenText,
          ),
        ),
        SizedBox(width: 10),
        Text(
          'شاخص مثبت',
          style: TextStyle(color: greenText, fontSize: 16.0),
        )
      ],
    );
  }
}
