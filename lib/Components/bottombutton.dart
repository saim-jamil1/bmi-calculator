import 'package:flutter/material.dart';
import '../constants.dart';



class BottomButton extends StatelessWidget {
  const BottomButton({@required this.ontap, @required this.ButtonText});
  final Function ontap;
  final String ButtonText;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(

        child: Center(child: Text(ButtonText,style: KButtonCalculateSTyle,),),
        color: KButtonColor,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        height: 80.9,
        width: double.infinity,
      ),
    );
  }
}