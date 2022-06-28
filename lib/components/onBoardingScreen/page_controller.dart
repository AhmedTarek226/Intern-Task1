import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:intern_task1/components/onBoardingScreen/body.dart';

class MyPageView extends StatefulWidget {
  const MyPageView({Key? key}) : super(key: key);

  @override
  State<MyPageView> createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 480,
      width: double.infinity,
      child: PageView(
        controller: _pageController,
        children: <Widget>[
          Column(
            children: [
              const Body(
                title: 'Get food delivery to your doorstep asap',
                description:
                    'We have young and professional delivery team that will bring your food as soon as possible to your doorstep',
                image: 'sammy-delivery-1.png',
              ),
              dotIndicator(pageController: _pageController,currentPosition: 0,animateTo: 1,),
            ],
          ),
          Column(
            children: <Widget>[
              const Body(
                title: 'Buy Any Food from your favorite restaurant',
                description:
                'We are constantly adding your favorite restaurant throughout the territory and arround your area carefully selected',
                image: 'sammy-done.png',
              ),
              dotIndicator(pageController: _pageController,currentPosition: 1,animateTo: 0,),
            ],
          )
        ],
      ),
    );
  }
}

class dotIndicator extends StatelessWidget {
  final int animateTo;
  final double currentPosition;
  const dotIndicator({
    Key? key,
    required this.animateTo,
    required this.currentPosition,
    required PageController pageController,
  }) : _pageController = pageController, super(key: key);

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        onPressed: () {
          if (_pageController.hasClients) {
            _pageController.animateToPage(
              animateTo,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            );
          }
        },
        child: DotsIndicator(
          dotsCount: 2,
          position: currentPosition,
          decorator: DotsDecorator(
            activeColor: Colors.amber,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
      ),
    );
  }
}
