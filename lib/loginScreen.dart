import 'package:bmi_calc/Core/Services/Service_locator.dart';
import 'package:bmi_calc/bmi/Bmi_Calculator.dart';
import 'package:bmi_calc/Core/database/cacheHelper.dart';
import 'package:flutter/material.dart';

import 'Feetures/Auth/components/CustomtextField.dart';
import 'Feetures/Auth/components/customButton.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //const LoginScreen({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  bool isPassword = true;

  var keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginScreen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: keyForm,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  label: 'Email',
                  prefix: Icons.email_outlined,
                  type: TextInputType.emailAddress,
                  controller: _emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your email";
                    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  onSave: (value) => _emailController,
                ),
                const SizedBox(height: 20.0),
                CustomTextField(
                  isPassword: isPassword,
                  controller: _passwordController,
                  label: 'password',
                  prefix: Icons.lock,
                  onPressed: () {
                    setState(() {
                      isPassword = !isPassword;
                    });
                  },
                  suffix: isPassword ? Icons.visibility_off : Icons.visibility,
                  type: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    } else if (value.length < 8) {
                      return 'Password must be at least 8 characters long';
                    }
                    return null;
                  },
                  onSave: (value) => _emailController,
                ),
                const SizedBox(height: 20.0),
                CustomButton(
                  function: () async {
                    await sl<CacheHelper>()
                        .saveData(key: 'loged', value: true)
                        .then((value) {
                      if ((keyForm.currentState!.validate())) {
                        print(_emailController.text);
                        print(_passwordController.text);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BmiCalculator(),
                            ));
                      } else {
                        return null;
                      }
                    });
                  },
                  text: 'login',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
