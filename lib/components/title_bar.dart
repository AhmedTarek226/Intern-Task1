import 'package:flutter/material.dart';

class TitleBar extends StatelessWidget {
  final double size;
  final String title;
  final double screenHeight;
  const TitleBar({required this.screenHeight,required this.title,required this.size,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome to fashion daily',
          style: TextStyle(
              fontSize: size*0.025,
              fontWeight: FontWeight.w400,
              color: Colors.grey[600]),
        ),
        SizedBox(height: screenHeight*0.015),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: size*0.04,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                'Help ?',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: size*0.023,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
