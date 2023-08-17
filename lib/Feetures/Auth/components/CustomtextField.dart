import 'package:flutter/material.dart';

// components

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      this.controller,
      this.isPassword = false,
      this.onSave,
      this.onChange,
      this.onPressed,
      this.onSubmit,
      this.onTap,
      this.validator,
      this.prefix,
      this.type,
      this.hint,
      this.suffix,
      this.label});

  String? label;
  String? hint;
  IconData? prefix;
  IconData? suffix;
  TextInputType? type;
  bool isPassword = false;
  Function(String?)? onSave;
  Function(String?)? onChange;
  Function(String?)? onSubmit;
  Function()? onTap;
  Function()? onPressed;
  String? Function(String?)? validator;
  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: double.infinity,
      child: TextFormField(
        onTap: onTap,
        onSaved: onSave,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(
            prefix,
          ),
          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: onPressed,
                  icon: Icon(
                    suffix,
                  ),
                )
              : null,
          labelText: label,
          hintText: hint,
          // border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))
        ),
        obscureText: isPassword,
        onChanged: onChange,
        onFieldSubmitted: onSubmit,
        keyboardType: type,
      ),
    );
  }
}
