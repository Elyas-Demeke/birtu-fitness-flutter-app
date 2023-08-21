import 'dart:ffi';

import 'package:flutter/material.dart';
import "dart:ui" as ui;

class BodyPart extends StatelessWidget {
  // const BodyPart({Key? key}): super(key: key);
  const BodyPart({super.key,  required this.item});

  final dynamic item;
  final double _borderRadius = 24;
  
  @override
  Widget build(BuildContext context) {
    return Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
              child: Stack(
                children: <Widget>[
                  // background
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(_borderRadius),
                      color: const Color.fromARGB(255, 255, 255, 255),
                      // gradient: LinearGradient(colors: [
                      //   item.startColor,
                      //   item.endColor
                      // ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: item.endColor,
                      //     blurRadius: 12,
                      //     offset: Offset(0, 6),
                      //   ),
                      // ],
                    ),
                  ),
                  
                  // background right side shadder
                  // Positioned(
                  //   right: 0,
                  //   bottom: 0,
                  //   top: 0,
                  //   child: CustomPaint(
                  //     size: const ui.Size(100, 150),
                  //     painter: CustomCardShapePainter(_borderRadius,
                  //         item.startColor, item.endColor),
                  //   ),
                  // ),
                  
                  Positioned.fill(
                    child: Row(
                      children: <Widget>[                        
                        Expanded(
                          flex: 4,
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  item.name,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Avenir',
                                      fontWeight: FontWeight.w900,
                                      fontSize: 20
                                      ),
                                ),
                                Text(
                                  item.category,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Avenir',
                                  ),
                                ),
                                SizedBox(height: 16),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.black,
                                      size: 16,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Flexible(
                                      child: Text(
                                        item.location,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Avenir',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Expanded(
                        //   flex: 2,
                        //   child: Column(
                        //     mainAxisSize: MainAxisSize.min,
                        //     children: <Widget>[
                        //       Text(
                        //         item.rating.toString(),
                        //         style: const TextStyle(
                        //             color: Colors.black,
                        //             fontFamily: 'Avenir',
                        //             fontSize: 18,
                        //             fontWeight: FontWeight.w700),
                        //       ),
                        //       RatingBar(key:const Key('a'), rating: item.rating),
                        //     ],
                        //   ),
                        // ),
                        Expanded(
                          child: Image.asset(
                            'assets/birtu-dark-logo.png',
                            height: 64,
                            width: 64,
                          ),
                          flex: 2,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}

class Workout {
  final String name;
  final String category;
  final String location;
  final double rating;
  final Color startColor;
  final Color endColor;

  /* Main app fields
  final String workoutName;
  final double numberOfExcercises;
  final Array firstThreeExcercises; // elements will be objects with excercise and sets and reps as key value pairs
  final String workingMuscleImage;

  */

  Workout(this.name, this.startColor, this.endColor, this.rating,
      this.location, this.category/*, this.workoutName, this.numberOfExcercises, this.firstThreeExcercises, this.workingMuscleImage*/ );
}

class CustomCardShapePainter extends CustomPainter {
  final double radius;
  final Color startColor;
  final Color endColor;

  CustomCardShapePainter(this.radius, this.startColor, this.endColor);

  @override
  void paint(Canvas canvas, ui.Size size) {
    var radius = 24.0;

    var paint = Paint();
    paint.shader = ui.Gradient.linear(
        Offset(0, 0), Offset(size.width, size.height), [
      HSLColor.fromColor(startColor).withLightness(0.8).toColor(),
      endColor
    ]);

    var path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width - radius, size.height)
      ..quadraticBezierTo(
          size.width, size.height, size.width, size.height - radius)
      ..lineTo(size.width, radius)
      ..quadraticBezierTo(size.width, 0, size.width - radius, 0)
      ..lineTo(size.width - 1.5 * radius, 0)
      ..quadraticBezierTo(-radius, 2 * radius, 0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class RatingBar extends StatelessWidget {
  final double rating;

  const RatingBar({required Key key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(rating.floor(), (index) {
        return Icon(
          Icons.star,
          color: Colors.white,
          size: 16,
        );
      }),
    );
  }
}
