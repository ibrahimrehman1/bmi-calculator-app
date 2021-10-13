import 'package:bmicalculator/screens/bmi_screen.dart';
import "package:flutter/material.dart";

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Home")),
        body: Center(
            child: ElevatedButton(
                child: const Text("BMI Calculator"),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const BMI();
                  }));
                })));
  }
}
