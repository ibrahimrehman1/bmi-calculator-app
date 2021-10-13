import "package:flutter/material.dart";
import "dart:math" as math;

class BMI extends StatefulWidget {
  double bmi = 0.0;
  bool metric = true;
  List<bool> selections = [true, false];

  BMI({Key? key}) : super(key: key);

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  @override
  Widget build(BuildContext context) {
    TextEditingController height = TextEditingController();
    TextEditingController weight = TextEditingController();

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
                isSelected: widget.selections,
                onPressed: (int index) {
                  setState(() {
                    if (index == 0) {
                      widget.selections[0] = true;
                      widget.selections[1] = false;
                      widget.metric = true;
                    } else {
                      widget.selections[0] = false;
                      widget.selections[1] = true;
                      widget.metric = false;
                    }
                  });
                },
              ),
              Container(margin: const EdgeInsets.only(top: 40.0)),
              SizedBox(
                width: 300,
                child: TextField(
                    controller: height,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        label: Text(
                            "Height in ${widget.metric == false ? 'Inches' : 'meters'}"))),
              ),
              SizedBox(
                width: 300,
                child: TextField(
                    controller: weight,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        label: Text(
                            "Weight in ${widget.metric == false ? 'Pounds' : 'Kilograms'}"))),
              ),
              Container(
                margin: const EdgeInsets.only(top: 40.0),
                child: ElevatedButton(
                    child: const Text("Calculate BMI"),
                    onPressed: () {
                      setState(() {
                        if (widget.metric == true) {
                          widget.bmi = num.parse(weight.text) /
                              math.pow(num.parse(height.text), 2);
                        } else {
                          widget.bmi = (num.parse(weight.text) /
                                  math.pow(num.parse(height.text), 2)) *
                              703;
                        }
                      });
                    }),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 40.0),
                  child: Text("Your BMI is ${widget.bmi.toStringAsFixed(3)}"))
            ],
          ),
        ));
  }
}
