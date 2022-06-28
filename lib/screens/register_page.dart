import 'package:flutter/material.dart';
import 'package:intern_task1/components/title_bar.dart';
import 'package:intern_task1/components/button.dart';
import 'package:intern_task1/components/input_field.dart';
import 'package:intern_task1/screens/signin_page.dart';

class RegisterPage extends StatefulWidget {
  static String routeName = '/Register';

  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final size = (height + width) / 2;

    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                    Container(
                        height: height * 0.18,
                        width: double.infinity,
                        child: Image.asset(
                          'assets/images/pattern.png',
                          fit: BoxFit.cover,
                        )),
                    Positioned(
                      height: 33,
                      width: 33,
                      left: width*0.03,
                      top: height * 0.075,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blueGrey[700],
                            borderRadius: BorderRadius.circular(30)),
                        child: IconButton(
                            iconSize: 20,
                            highlightColor: Colors.black,
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            )),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleBar(
                        size: size,
                        title: 'Register',
                        screenHeight: height,
                      ),
                      SizedBox(height: height * 0.02),
                      const InputField(
                        label: 'Email',
                        hint: 'Eg. example@email.com',
                        inputType: TextInputType.emailAddress,
                      ),
                      const InputField(
                          label: 'Phone Number',
                          showCountryCode: true,
                          hint: 'Eg. 1340987901',
                          inputType: TextInputType.phone),
                      const InputField(
                          label: 'Password',
                          secureText: true,
                          hint: 'Password',
                          inputType: TextInputType.text),
                      SizedBox(height: height * 0.02),
                      Button(text: 'Sign Up', buttonColor: Colors.blue, onpress: () {
                        try{
                          _formKey.currentState!.validate();
                        }catch(e){
                          print('Error ×××××××');
                        }
                      },),
                      SizedBox(height: height * 0.015),
                      Center(
                          child: Text(
                        'Or',
                        style: TextStyle(color: Colors.grey[600]),
                      )),
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
                          Text(
                            'Have any account? ',
                            style: TextStyle(
                                fontSize: size * 0.023,
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w600),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(SignInPage.routeName);
                            },
                            child: Text(
                              'Sign in here',
                              style: TextStyle(
                                  fontSize: size * 0.023,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: height * 0.02),
                      Center(
                          child: Text(
                        'By resgistering your account, you are agree to our ',
                        style: TextStyle(
                            fontSize: size * 0.02, color: Colors.grey[600]),
                      )),
                      SizedBox(height: height * 0.01),
                      Center(
                          child: GestureDetector(
                        child: Text(
                          'terms and condition',
                          style: TextStyle(
                              fontSize: size * 0.02, color: Colors.blue),
                        ),
                      )),
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
