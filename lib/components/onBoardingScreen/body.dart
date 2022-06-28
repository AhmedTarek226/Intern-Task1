import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const Body({Key? key,
    required this.image,
    required this.title,
    required this.description
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //image
        Container(
          width: double.infinity,
          height: 250,
          child: Image.asset('assets/images/$image'),
        ),
        //title
         Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
        //description
        Padding(
          padding:
          const EdgeInsets.symmetric(vertical: 17, horizontal: 17),
          child: Text(
           description,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
