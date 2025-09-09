import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    final horizontalPadding = width * 0.05;
    final verticalPadding = height * 0.07;
    final containerBorderRadius = width * 0.05;

    final circleAvatarRadius = width * 0.15;
    final greenCircleRadius = width * 0.1125;
    final sideCircleRadius = width * 0.0625;

    final topSideCircle = height * 0.59;
    final sideCircleOffset = -sideCircleRadius / 2;

    final svgTopPadding = height * 0.05;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: verticalPadding,
            ),
            child: Container(
              decoration: ShapeDecoration(
                color: const Color(0xffededed),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(containerBorderRadius),
                ),
              ),
            ),
          ),
          Positioned(
            top: topSideCircle,
            left: sideCircleOffset,
            child: CircleAvatar(
              radius: sideCircleRadius,
              backgroundColor: Colors.white,
            ),
          ),
          Positioned(
            top: topSideCircle,
            right: sideCircleOffset,
            child: CircleAvatar(
              radius: sideCircleRadius,
              backgroundColor: Colors.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: height * 0.05),
            child: Align(
              alignment: Alignment.topCenter,
              child: CircleAvatar(
                radius: circleAvatarRadius,
                backgroundColor: const Color(0xffededed),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height * 0.0125),
            child: Align(
              alignment: Alignment.topCenter,
              child: CircleAvatar(
                radius: greenCircleRadius,
                backgroundColor: Colors.green,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: svgTopPadding),
            child: Align(
              alignment: Alignment.topCenter,
              child: SvgPicture.asset('assets/images/trueimage.svg'),
            ),
          ),
        ],
      ),
    );
  }
}
