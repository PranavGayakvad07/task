import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:satat_task/controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text("Quote of the day"),
                  SizedBox(height: 20),
                  Obx(() {
                    if (homeController.isLoading.value) {
                      return CircularProgressIndicator(); // Show loader
                    } else {
                      return Text(
                        '"${homeController.quote.value}" : ${homeController.auther.value}',
                      );
                    }
                  }),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: homeController.number1Controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      fillColor: Colors.transparent,
                      filled: true,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: homeController.number2Controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      fillColor: Colors.transparent,
                      filled: true,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() == true) {
                        homeController.addNumbers();
                      }
                    },
                    child: Text('Add Numbers'),
                  ),
                  SizedBox(height: 20),
                  Obx(() => Text(
                        'Result: ${homeController.result}',
                        style: TextStyle(fontSize: 24),
                      )),
                  SizedBox(height: 20),
                  Text(
                    "History",
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(height: 20),
                  Obx(() => ListView.builder(
                        shrinkWrap: true,
                        itemCount: homeController.history.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Text(
                              homeController.history[index],
                              textAlign: TextAlign.center,
                            ),
                          );
                        },
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
