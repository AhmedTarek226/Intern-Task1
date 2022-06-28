import 'package:country_code_picker/country_code.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String label;
  final bool secureText;
  final String hint;
  final inputType;
  final bool showCountryCode;

  const InputField({
    Key? key,
    required this.label,
    this.secureText = false,
    required this.hint,
    required this.inputType,
    this.showCountryCode = false,
  }) : super(key: key);

  String validate(String label) {
    switch (label) {
      case 'Email':
        return 'Email is empty !';
      case 'Password':
        return 'Password is empty !';
      case 'Phone Number':
        return 'Phone Number is empty !';
      case 'Text Field Label':
        return 'Text Field Label is empty !';
      default:
        return 'This field is required';
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final size = (height + width) / 2;
    final _controller = TextEditingController();

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        label,
        style: TextStyle(
          fontSize: size * 0.025,
          fontWeight: FontWeight.w400,
          color: Colors.grey[600],
        ),
      ),
      SizedBox(height: height * 0.008),
      showCountryCode
          ? Row(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Flexible(
                    child: Container(
                      height: 70,
                      width: double.infinity,
                      child: TextFormField(
                          controller: _controller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return validate(label);
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.phone,
                          obscureText: secureText,
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                            isDense: true,
                            prefixIcon: CountryCodePicker(
                              // padding: EdgeInsets.all(5),
                              onChanged: print,
                              //showFlag: false,
                              showFlagMain: false,
                              barrierColor: Colors.black54,
                              // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                              initialSelection: 'EG',
                              favorite: ['+02', 'EG'],
                              // optional. Shows only country name and flag
                              showCountryOnly: false,
                              // optional. Shows only country name and flag when popup is closed.
                              showOnlyCountryWhenClosed: false,
                              // optional. aligns the flag and the Text left
                              alignLeft: false,
                            ),
                            errorStyle: TextStyle(fontSize: size*0.016),
                            hintText: hint,
                            hintStyle: TextStyle(fontSize: size * 0.02),
                            contentPadding: EdgeInsets.all(10),
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 1),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 1.5,
                              ),
                            ),
                          )),
                    ),
                  ),
                ])
          : Container(
              height: 70,
              width: double.infinity,
              child: TextFormField(
                  controller: _controller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return validate(label);
                    } else {
                      return null;
                    }
                  },
                  keyboardType: inputType,
                  obscureText: secureText,
                  cursorColor: Colors.grey,

                  decoration: InputDecoration(
                    errorStyle: TextStyle(fontSize: size*0.016),
                    hintText: hint,
                    hintStyle: TextStyle(fontSize: size * 0.02),
                    contentPadding: EdgeInsets.all(10),
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 1.5,
                      ),
                    ),
                  )),
            ),
    ]);
  }
}
