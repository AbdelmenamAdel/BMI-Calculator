import 'package:bmi_calc/Colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class BMI_RESULT extends StatelessWidget {
  int age;
  int result;
  bool ismale;
  String? bmi;

  BMI_RESULT(
      {super.key,
      required this.age,
      required this.ismale,
      required this.result});
  @override
  Widget build(BuildContext context) {
    if (result < 18.5) {
      bmi = 'Under weight';
    } else if (result >= 18.5 && result <= 24.9) {
      bmi = 'Normal weight';
    } else if (result >= 25 && result <= 29.9) {
      bmi = 'Over weight';
    } else if (result >= 30 && result <= 34.9) {
      bmi = 'Obesity class |';
    } else if (result >= 35 && result <= 39.9) {
      bmi = 'Obesity class ||';
    } else {
      bmi = 'Obesity class |||';
    }
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios_new),
                  color: AppColor.white,
                  iconSize: 32,
                ),
                Text(
                  'Your Result:',
                  style:
                      GoogleFonts.roboto(fontSize: 36, color: AppColor.white),
                )
              ],
            ),
            const Spacer(
              flex: 1,
            ),
            Container(
              height: 500,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: AppColor.secondaryColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '$bmi',
                    style: GoogleFonts.roboto(
                        color: AppColor.caseColor, fontSize: 35),
                  ),
                  Text(
                    '$result',
                    style:
                        GoogleFonts.roboto(fontSize: 80, color: AppColor.white),
                  ),
                  Text(
                    'culees badan malihide is daji',
                    style:
                        GoogleFonts.roboto(fontSize: 20, color: AppColor.white),
                  )
                ],
              ),
            ),
            const Spacer(
              flex: 3,
            )
          ],
        ),
      ),
    );
  }
}
