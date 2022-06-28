import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intern_task1/components/title_bar.dart';
import 'package:intern_task1/components/button.dart';
import 'package:intern_task1/components/input_field.dart';
import 'package:intern_task1/screens/register_page.dart';

class SignInPage extends StatefulWidget {
  static String routeName = '/Sign-In';

  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery
        .of(context)
        .size
        .height;
    final width = MediaQuery
        .of(context)
        .size
        .width;
    final size = (height + width) / 2;

    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    height: height * 0.27,
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/pattern.png',
                      fit: BoxFit.cover,
                    )),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleBar(
                        size: size, title: 'Sign In', screenHeight: height,),
                      SizedBox(height: height * 0.02),
                      const InputField(
                          label: 'Text Field Label',
                          showCountryCode: true,
                          hint: 'Eg. 1340987901',
                          inputType: TextInputType.phone),
                      SizedBox(height: height * 0.02),
                      Button(text: 'Sign In', buttonColor: Colors.blue,
                        onpress: () {
                        print('pressed');
                        try{
                          _formKey.currentState!.validate();
                        }catch(e){
                          print('Error ×××××××');
                        }
                        },),
                      SizedBox(height: height * 0.015),
                      Center(child: Text('Or', style: TextStyle(color: Colors
                          .grey[600]),)),
                      SizedBox(height: height * 0.015),
                      Button(
                        text: 'Sign with by google',
                        googleIcon: true,
                        buttonColor: Colors.white,
                        textColor: Colors.blue,
                        borderColor: Colors.blue,
                        onpress: () {},
                      ),
                      SizedBox(height: height * 0.017),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Doesn\'t has any account? ', style: TextStyle(
                              fontSize: size * 0.023,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w600),),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                  RegisterPage.routeName);
                            },
                            child: Text('Register here', style: TextStyle(
                                fontSize: size * 0.023,
                                color: Colors.blue,
                                fontWeight: FontWeight.w600),),)
                        ],
                      ),
                      SizedBox(height: height * 0.02),
                      Center(child: Text(
                        'Use the application according to policy rules. Any kinds of violations will be subject to sanctions ',
                        style: TextStyle(fontSize: size * 0.02,
                            color: Colors.grey[600]),)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
