import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/components/round_iconbtn.dart';
import 'package:bmi_calculator/components/bottom_btn.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender { male, female }

class inputPage extends StatefulWidget {
  const inputPage({super.key});

  @override
  State<inputPage> createState() => _inputPageState();
}

class _inputPageState extends State<inputPage> {
  Gender? selectedGender;
  int weight = 50;
  int height = 100;
  int age = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('BMI CALCULATOR')),
          backgroundColor: inactiveCardColor,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: ReusableColumnWidget(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  cardChild: IconCardWidget(
                    icon: FontAwesomeIcons.mars,
                    label: 'MALE',
                  ),
                  colour: selectedGender == Gender.male
                      ? activeCardColor
                      : inactiveCardColor,
                )),
                Expanded(
                    child: ReusableColumnWidget(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  cardChild: IconCardWidget(
                    icon: FontAwesomeIcons.venus,
                    label: 'FEMALE',
                  ),
                  colour: selectedGender == Gender.female
                      ? activeCardColor
                      : inactiveCardColor,
                ))
              ],
            )),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: ReusableColumnWidget(
                  colour: inactiveCardColor,
                  cardChild: Column(
                    children: [
                      Text(
                        'HEIGHT',
                        style: labeStyling,
                      ),
                      Row(
                        textBaseline: TextBaseline.alphabetic,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        children: [
                          Text(
                            height.toString(),
                            style: kNumberStyling,
                          ),
                          Text(
                            'cm',
                            style: labeStyling,
                          )
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Color(0xFF8D8E98),
                            thumbColor: Color(0xFFEB1555),
                            overlayColor: Color(0x29EB1555),
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 25.0)),
                        child: Slider(
                            max: 220,
                            min: 100,
                            value: height.toDouble(),
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            }),
                      )
                    ],
                  ),
                ))
              ],
            )),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: ReusableColumnWidget(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WEIGHT',
                        style: labeStyling,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberStyling,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundActionButton(
                            icon: FontAwesomeIcons.minus,
                            onTap: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundActionButton(
                            icon: FontAwesomeIcons.plus,
                            onTap: () {
                              setState(() {
                                weight++;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                  colour: inactiveCardColor,
                )),
                Expanded(
                  child: ReusableColumnWidget(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: labeStyling,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberStyling,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundActionButton(
                              icon: FontAwesomeIcons.minus,
                              onTap: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundActionButton(
                              icon: FontAwesomeIcons.plus,
                              onTap: () {
                                setState(() {
                                  age++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                    colour: inactiveCardColor,
                  ),
                ),
              ],
            )),
            BottomButton(
              btnTitle: 'CALCULATE',
              push: (() {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => Result(bmiResult: calc.getResult(),bmiResultText: calc.getResultText(), bmiResultTextInterpretation: calc.getResultInterpretation(),))));
              }),
            )
          ],
        ));
  }
}
