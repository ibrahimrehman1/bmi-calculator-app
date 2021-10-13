import "package:flutter/material.dart";
import "dart:math" as math;

class BMI extends StatefulWidget {
  const BMI({Key? key}) : super(key: key);

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();
  bool isMetric = true;
  bool isImperial = false;
  late List<bool> _selections;
  double bmi = 0.0;

  @override
  void initState() {
    _selections = [isMetric, isImperial];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String heightTxt = "Height in ${isImperial == true ? 'Inches' : 'meters'}";
    String weightTxt =
        "Weight in ${isImperial == true ? 'Pounds' : 'Kilograms'}";
    return Scaffold(
        appBar: AppBar(title: const Text("BMI Calculator")),
        body: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ToggleButtons(
                children: const [
                  Padding(padding: EdgeInsets.all(5.0), child: Text("Metric")),
                  Padding(
                      padding: EdgeInsets.all(5.0), child: Text("Imperial")),
                ],
                isSelected: _selections,
                onPressed: (int index) {
                  if (index == 0) {
                    isMetric = true;
                    isImperial = false;
                  } else {
                    isMetric = false;
                    isImperial = true;
                  }

                  setState(() {
                    _selections = [isMetric, isImperial];
                  });
                },
              ),
              Container(margin: const EdgeInsets.only(top: 40.0)),
              SizedBox(
                width: 300,
                child: TextField(
                    controller: height,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(label: Text(heightTxt))),
              ),
              SizedBox(
                width: 300,
                child: TextField(
                    controller: weight,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(label: Text(weightTxt))),
              ),
              Container(
                margin: const EdgeInsets.only(top: 40.0),
                child: ElevatedButton(
                    child: const Text("Calculate BMI"),
                    onPressed: () {
                      setState(() {
                        if (isMetric == true) {
                          bmi = num.parse(weight.text) /
                              math.pow(num.parse(height.text), 2);
                        } else {
                          bmi = (num.parse(weight.text) /
                                  math.pow(num.parse(height.text), 2)) *
                              703;
                        }
                      });
                    }),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 40.0),
                  child: Text("Your BMI is ${bmi.toStringAsFixed(3)}"))
            ],
          ),
        ));
  }
}
