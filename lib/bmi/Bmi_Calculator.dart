import 'dart:math';

import 'package:bmi_calc/Colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bmi_result/Bmi_Result.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  bool isMale = true;
  double height = 120;
  int age = 20;
  int weight = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: AppColor.secondaryColor,
        title: const Center(
            child: Text(
          'BMI calculator',
          style: TextStyle(fontSize: 26),
        )),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: !isMale
                              ? AppColor.calcColor
                              : AppColor.secondaryColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.female,
                              size: 100,
                              color: AppColor.white,
                            ),
                            const SizedBox(height: 15),
                            Text(
                              'FEMALE',
                              style: GoogleFonts.roboto(
                                fontSize: 24,
                                color: AppColor.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isMale
                              ? AppColor.calcColor
                              : AppColor.secondaryColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.male,
                              size: 100,
                              color: AppColor.white,
                            ),
                            const SizedBox(height: 15),
                            Text(
                              'MALE',
                              style: GoogleFonts.roboto(
                                fontSize: 24,
                                color: AppColor.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: AppColor.secondaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      color: AppColor.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '${height.round()}',
                        style: GoogleFonts.roboto(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColor.white,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text('CM',
                          style: GoogleFonts.roboto(
                            fontSize: 10,
                            color: AppColor.white,
                          )),
                    ],
                  ),
                  Slider(
                    thumbColor: AppColor.calcColor,
                    inactiveColor: AppColor.white,
                    activeColor: AppColor.calcColor,
                    min: 80.0,
                    max: 220.0,
                    value: height,
                    onChanged: (value) {
                      setState(() {
                        height = value;
                        print(value.round());
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColor.secondaryColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: GoogleFonts.roboto(
                              fontSize: 24,
                              color: AppColor.white,
                            ),
                          ),
                          Text(
                            '$weight',
                            style: GoogleFonts.roboto(
                              fontSize: 24,
                              color: AppColor.white,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                heroTag: 'Weight--',
                                mini: true,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                backgroundColor: AppColor.white,
                                foregroundColor: Colors.black,
                                child: const Icon(Icons.remove),
                              ),
                              const SizedBox(width: 5),
                              FloatingActionButton(
                                heroTag: 'Weight++',
                                mini: true,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                backgroundColor: AppColor.white,
                                foregroundColor: Colors.black,
                                child: const Icon(Icons.add),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColor.secondaryColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: GoogleFonts.roboto(
                              fontSize: 24,
                              color: AppColor.white,
                            ),
                          ),
                          Text(
                            '$age',
                            style: GoogleFonts.roboto(
                              fontSize: 24,
                              color: AppColor.white,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                heroTag: 'Age--',
                                mini: true,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                backgroundColor: AppColor.white,
                                foregroundColor: Colors.black,
                                child: const Icon(Icons.remove),
                              ),
                              const SizedBox(width: 5),
                              FloatingActionButton(
                                heroTag: 'Age++',
                                mini: true,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                backgroundColor: AppColor.white,
                                foregroundColor: Colors.black,
                                child: const Icon(Icons.add),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 70,
            child: ElevatedButton(
              onPressed: () {
                double result = weight / pow(height / 100, 2);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BMI_RESULT(
                      age: age,
                      ismale: isMale,
                      result: result.round(),
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.calcColor,
              ),
              child: Text(
                'CALCULATE',
                style: GoogleFonts.roboto(
                  fontSize: 24,
                  color: AppColor.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
