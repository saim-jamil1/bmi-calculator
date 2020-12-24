import 'package:bmi_calculator/Screens/resultpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Components/reuseable_card.dart';
import '../Components/genderWidget.dart';
import '../constants.dart';
import '../Components/bottombutton.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender {
  Male,
  Female,
}
Gender selectGender;

class InputPage extends StatefulWidget {


  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectGender;
  int height =180;
  int weight = 60;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children:[
                  Expanded(
                      child: ReuseableCard(
                        onPress: (){
                          setState(() {
                            selectGender = Gender.Male;
                          });
                        },
                        color: selectGender == Gender.Male ? KActiveCardColor: KInactiveCardColor,
                        cardChild:GenderWidget(
                          gender: 'MALE',
                          icon: FontAwesomeIcons.mars,
                        ),
                      ),
                    ),//Male
                  Expanded(
                      child: ReuseableCard(
                        onPress: (){
                          setState(() {
                            selectGender = Gender.Female;
                          });
                        },
                        color: selectGender == Gender.Female ? KActiveCardColor: KInactiveCardColor,
                        cardChild:GenderWidget(
                          gender: 'FEMALE',
                          icon: FontAwesomeIcons.venus,
                        ),
                      ),
                    ),//female
  ],
              ),
            ),
            Expanded(
              child: ReuseableCard(
                color: KActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('HEIGHT',
                      style: KLabelText,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      // textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style:KNumberStyle,
                        ),
                        Text('cm',
                          style:KLabelText,
                        ),
                      ],
                    ),
                    Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        activeColor: KButtonColor,
                        inactiveColor: Color(0xFF8D8E98),
                        onChanged: (double newValue) {
                                    setState(() {
                                      height = newValue.round();
                                    });
                            },
                    ),


                  ],
                ),

              ),
            ),//height
            Expanded(
              child: Row(

                  children:[
                    Expanded(
                      child: ReuseableCard(
                        color: KActiveCardColor,
                        cardChild: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'WEIGHT',
                              style: KLabelText,
                            ),
                            Text(
                                weight.toString(),
                              style: KNumberStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },

                                ),
                                SizedBox(
                                  width: 10.0,
                                ),

                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child:ReuseableCard(
                        color: KActiveCardColor,
                        cardChild: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "AGE",
                              style: KLabelText,
                            ),
                            Text(
                              age.toString(),
                              style: KNumberStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                    ),

                  ]
              ),
            ),
            BottomButton(
              ontap: (){
                CalculatorBrain calc = CalculatorBrain(height: height,weight: weight);
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: calc.CalculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),);

              },
              ButtonText: 'Calculate',
            ),
            
          ],
        ),
      ),
    );
  }
}







class RoundIconButton extends StatelessWidget {

  RoundIconButton({this.icon, this.onPressed});
  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6.0,
      child: Icon(icon),
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4f5E),
    );
  }
}



