import 'package:check_out_app/core/utils/styles.dart';
import 'package:dotted_line/dotted_line.dart';
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
          onPressed: () {
            Navigator.pop(context);
          },
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
          Padding(
            padding: EdgeInsets.only(top: height * 0.14),
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Text(
                    'Thank You!',
                    style: TextStyle(
                      fontSize: width * 0.08,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                    child: Text(
                      'Your transaction was successful.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: width * 0.045,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Date', style: Styles.style16),
                        Text('12/12/2022', style: Styles.styleBold18),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Time', style: Styles.style16),
                        Text('12:00 PM', style: Styles.styleBold18),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('To', style: Styles.style16),
                        Text('John Doe', style: Styles.styleBold18),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.12),
                    child: Divider(color: Color(0xffc7c7c7), thickness: 2),
                  ),
                  SizedBox(height: height * 0.03),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total', style: Styles.style24),
                        Text('\$50.97', style: Styles.style24),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.16),
                    child: SizedBox(
                      height: height * 0.09,
                      child: Container(
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SvgPicture.asset('assets/images/logo.svg'),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Credit Card', style: Styles.style18),
                                Text(
                                  'Mastercard **** 1234',
                                  style: Styles.style16,
                                ),
                                SizedBox(height: height * 0.005),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                    child: DottedLine(
                      dashLength: 8,
                      dashGapLength: 4,
                      lineThickness: 2,
                      dashColor: Color(0xffb8b8b8),
                    ),
                  ),
                  SizedBox(height: height * 0.05),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset('assets/images/parQ.svg'),
                        SizedBox(
                          height: height * 0.07,
                          width: width * 0.25,
                          child: Container(
                            decoration: ShapeDecoration(
                              color: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side: const BorderSide(
                                  color: Colors.green,
                                  width: 2,
                                ),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'PAID',
                                style: TextStyle(
                                  fontSize: width * 0.065,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
