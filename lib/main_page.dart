import 'package:flutter/material.dart';
import 'package:mysecond/constants.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int height = 100;
  int weight = 50;

  late double bmi = calculateBMI(height: height, weight: weight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 200,
                    width: 175,
                    decoration: BoxDecoration(color: Colors.black12),
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: const [
                        Icon(Icons.male, size: 150),
                        Text("Male"),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: 200,
                    width: 175,
                    decoration: BoxDecoration(color: Colors.black12),
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: const [
                        Icon(Icons.female, size: 150),
                        Text("Female"),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 50),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text("Height"),
                        Text("$height", style: kInputLabelColor),
                        Row(
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (height >= 50) height--;
                                  bmi = calculateBMI(
                                      height: height, weight: weight);
                                });

                                print(height);
                              },
                              child: Icon(
                                Icons.remove,
                                size: 40,
                              ),
                            ),
                            const SizedBox(width: 20),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (height < 200) height++;
                                  bmi = calculateBMI(
                                      height: height, weight: weight);
                                });

                                print(height);
                              },
                              child: Icon(
                                Icons.add,
                                size: 40,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text("Weight"),
                        Text("$weight", style: kInputLabelColor),
                        Row(
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (weight >= 20) weight--;
                                  bmi = calculateBMI(
                                      height: height, weight: weight);
                                });

                                print(weight);
                              },
                              child: Icon(
                                Icons.remove,
                                size: 40,
                              ),
                            ),
                            const SizedBox(width: 20),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (weight < 150) weight++;
                                  bmi = calculateBMI(
                                      height: height, weight: weight);
                                });

                                print(weight);
                              },
                              child: Icon(
                                Icons.add,
                                size: 40,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Column(
                children: [
                  Text("BMI"),
                  Text(
                    "${bmi.toStringAsFixed(2)}",
                    style: kInputLabelColor.copyWith(
                        color: kOutputTextColor, fontSize: 60),
                  ),
                  Text(getResult(bmi))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  double calculateBMI({required int height, required int weight}) {
    return (weight / (height * height)) * 10000;
  }

  String getResult(bmiValue) {
    if (bmiValue >= 25) {
      return "Overweight";
    } else if (bmiValue > 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }
}
