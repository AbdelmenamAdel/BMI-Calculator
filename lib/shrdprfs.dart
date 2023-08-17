import 'package:bmi_calc/Feetures/Auth/components/CustomtextField.dart';
import 'package:bmi_calc/Core/database/cacheHelper.dart';
import 'package:flutter/material.dart';

import 'Core/Services/Service_locator.dart';
import 'Feetures/Auth/components/customButton.dart';

class SharedPref extends StatefulWidget {
  const SharedPref({super.key});

  @override
  State<SharedPref> createState() => _SharedPrefState();
}

class _SharedPrefState extends State<SharedPref> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController ageController = TextEditingController();

  final TextEditingController locationController = TextEditingController();
  var name;
  var age;
  var location;
  var keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Save Object in SharedPreferences'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: keyForm,
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              const SizedBox(
                height: 30,
              ),
              CustomTextField(
                type: TextInputType.name,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'must not be empty';
                  }
                  return null;
                },
                hint: 'Name',
                controller: nameController,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                type: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'must not be empty';
                  }
                  return null;
                },
                hint: 'Age',
                controller: ageController,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                type: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'must not be empty';
                  }
                  return null;
                },
                hint: 'Location',
                controller: locationController,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(
                      function: () async {
                        if ((keyForm.currentState!.validate())) {
                          await sl<CacheHelper>().saveData(
                              key: 'name', value: nameController.text);
                          await sl<CacheHelper>()
                              .saveData(key: 'age', value: ageController.text);
                          await sl<CacheHelper>().saveData(
                              key: 'location', value: locationController.text);

                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Saved'),
                          ));
                        }
                      },
                      text: 'Save'),
                  CustomButton(
                      function: () async {
                        if ((keyForm.currentState!.validate())) {
                          name = await sl<CacheHelper>().getData(key: 'name') ??
                              '';
                          age =
                              await sl<CacheHelper>().getData(key: 'age') ?? '';
                          location = await sl<CacheHelper>()
                                  .getData(key: 'location') ??
                              '';
                          setState(() {});

                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Loaded'),
                          ));
                        }
                      },
                      text: 'Load'),
                  CustomButton(
                    function: () async {
                      sl<CacheHelper>().clearData();
                      nameController.clear();
                      ageController.clear();
                      locationController.clear();
                      setState(() {
                        name = '';
                        age = '';
                        location = '';
                      });
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Cleared'),
                      ));
                    },
                    text: 'Clear',
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Text('Name:${name ?? ' '}'),
              const SizedBox(
                height: 20,
              ),
              Text('Age:${age ?? ' '}'),
              const SizedBox(
                height: 20,
              ),
              Text('Location:${location ?? ' '}')
            ]),
          ),
        ),
      ),
    );
  }
}
