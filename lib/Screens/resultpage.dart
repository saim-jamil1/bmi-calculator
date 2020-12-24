import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../Components/reuseable_card.dart';
import '../Components/bottombutton.dart';
import 'Input_page.dart';

class ResultPage extends StatelessWidget {
  ResultPage({@required this.bmiResult,@required this.resultText,@required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child:Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your Result',
                  style:KResulTitle ,
                ),
              ),
          ),
          Expanded(
            flex:2,
              child: ReuseableCard(
                color: KActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultText.toUpperCase(),
                      style: KResultext,
                    ),
                    Text(
                     bmiResult,
                      style: KBmiValueStyle,
                    ),
                    Text(

                      interpretation,
                      textAlign: TextAlign.center,
                      style: KbmiInterpretStyle,
                    ),
                  ],
                ),

              ),
          ),
          BottomButton(
            ontap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => InputPage(),
              ),);

            },
            ButtonText: 'Re-Calculate',
          ),
        ],
      ),
    );
  }
}
