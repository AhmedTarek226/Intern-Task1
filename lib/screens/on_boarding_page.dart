import 'package:flutter/material.dart';
import 'package:intern_task1/components/button.dart';
import 'package:intern_task1/components/onBoardingScreen/page_controller.dart';
import 'package:intern_task1/screens/register_page.dart';

class OnBoardingPage extends StatelessWidget {
  //static String routeName = '/';
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight=MediaQuery.of(context).size.height;
    final screenWidth=MediaQuery.of(context).size.width;
    final size=(screenHeight+screenWidth)/2;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: <Widget>[
                // skip button
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 30,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: MaterialButton(
                        onPressed: () {},
                        child:  Text('Skip', style: TextStyle(fontSize: size*0.02)),
                      ),
                    ),
                  ],
                ),
                MyPageView(),
                //Slider
                //button
                Button(
                  text: 'Get Started',
                  buttonColor: const Color(0xff4db6ac),
                  onpress: (){},
                ),
                SizedBox(
                  height: screenHeight*0.03,
                ),
                //signUp
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                     Text(
                      'Don\'t have an account? ',
                      style: TextStyle(fontSize: size*0.025, fontWeight: FontWeight.w600),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).pushNamed(RegisterPage.routeName);
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            color: Colors.teal[300],
                            fontSize: size*0.025,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
