import 'package:bmi_calculator/utils/colors.dart';
import 'package:bmi_calculator/widgets/left_shape.dart';
import 'package:bmi_calculator/widgets/right_shape.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final weightController = TextEditingController();
  final heightController = TextEditingController();

  double resultBmi = 0;
  String resultText = 'لطفا وزن و قد خودرا وارد کنید';
  Color textColor = Colors.black45;

  double widthGood = 100.0;
  double widthBad = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text('تو چنده؟ BMI', style: TextStyle(color: black)),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 100,
                  child: TextField(
                    controller: weightController,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: blueText,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'وزن',
                      hintStyle: TextStyle(color: blueText.withOpacity(0.4)),
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  child: TextField(
                    controller: heightController,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: blueText,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'قد',
                      hintStyle: TextStyle(color: blueText.withOpacity(0.4)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40.0),
            InkWell(
              onTap: () {
                final weight = double.parse(weightController.text);
                final height = double.parse(heightController.text);

                setState(() {
                  resultBmi = weight / (height * height);
                  if (resultBmi > 25) {
                    resultText = "شما اضافه وزن دارید";
                    textColor = redbackground;
                    widthGood = 50.0;
                    widthBad = 270.0;
                  } else if (resultBmi >= 18.5 && resultBmi <= 25.0) {
                    resultText = "وزن شما نرمال است";
                    textColor = greenText;
                    widthGood = 270.0;
                    widthBad = 50.0;
                  } else {
                    resultText = "شما کمبود وزن دارید";
                    textColor = orangeText;
                    widthGood = 10.0;
                    widthBad = 10.0;
                  }
                });
              },
              child: Text(
                '!محاسبه کن',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0),
              ),
            ),
            SizedBox(height: 40.0),
            Text(
              '${resultBmi.toStringAsFixed(2)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 64.0,
                color: blueText,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              '$resultText',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: textColor,
                fontSize: 32.0,
              ),
            ),
            SizedBox(height: 40.0),
            RightShape(width: widthBad),
            SizedBox(height: 10.0),
            LeftShape(width: widthGood),
          ],
        ),
      ),
    );
  }
}
