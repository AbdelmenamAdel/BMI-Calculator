// ignore: must_be_immutable
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.function,
    required this.text,
    this.width,
  });
  double? width = double.infinity;
  Color background = Colors.blue;
  bool isUpperCase = true;
  double radius = 10.0;
  @required
  final Function() function;
  @required
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      //  width: width,
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
