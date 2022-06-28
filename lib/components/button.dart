import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final double height;
  final double width;
  Color buttonColor;
  final Color textColor;
  final Color borderColor;
  final bool googleIcon;
  final VoidCallback onpress;

  Button(
      {Key? key,
      required this.text,
      this.height = 50,
      this.width = double.infinity,
      required this.buttonColor,
      this.textColor = Colors.white,
      this.borderColor = Colors.transparent,
      this.googleIcon=false,
       required this.onpress,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight=MediaQuery.of(context).size.height;
    final screenWidth=MediaQuery.of(context).size.width;
    final size=(screenHeight+screenWidth)/2;

    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        color: buttonColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: MaterialButton(
        onPressed: () {
          onpress();
        },
        child:
        googleIcon? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/google.png',fit: BoxFit.fill,width: 25,height: 25,),
            SizedBox(width:5),
            Text(
              text,
              style: TextStyle(
                  color: textColor, fontSize: size*0.025, fontWeight: FontWeight.w600),
            ),
          ],
        ):
        Text(
          text,
          style: TextStyle(
              color: textColor, fontSize: size*0.025, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

