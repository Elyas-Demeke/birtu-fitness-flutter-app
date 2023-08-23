import 'dart:ffi';

import 'package:flutter/material.dart';
import "dart:ui" as ui;

class BodyPart extends StatefulWidget {
  // const BodyPart({Key? key}): super(key: key);
  const BodyPart({super.key, required this.item});

  final dynamic item;

  @override
  State<BodyPart> createState() => _BodyPartState();
}

class _BodyPartState extends State<BodyPart> {
  double _borderRadius = 24;
  var  _containerColor =  Colors.white;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
        child: Stack(
          children: <Widget>[
            // background
            InkWell(
              child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 210,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(_borderRadius),
                color: _containerColor
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
              onTapDown: (details) {                
                setState(() {
                  _containerColor = const Color.fromARGB(255, 199, 201, 214);
                  _borderRadius = 0;
                });
              },
              onTapUp: ((details) async{
                await Future.delayed(const Duration(milliseconds: 100));
                setState(() {
                  _containerColor = const Color.fromARGB(255, 255, 255, 255);
                  _borderRadius = 24;
                });
              }),
              onHighlightChanged: (details) {
                setState(() {
                  _containerColor = const Color.fromARGB(255, 255, 255, 255);
                  _borderRadius = 24;
                });
              },
              onTap: () {
                setState(() {
                  _containerColor = const Color.fromARGB(255, 199, 201, 214);
                });
              },
              
              
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

            // content
            Positioned.fill(
              top: 0,
              child: Column(
                children: [
                  // title, number of excercises and working body part image
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                                  widget.item.name,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Avenir',
                                    fontWeight: FontWeight.w900,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  widget.item.category,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Avenir',
                                      fontWeight: FontWeight.w300,
                                      fontSize: 15),
                                ),
                                // SizedBox(height: 16),
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

                        // Icon
                        const Expanded(
                          flex: 1,
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/quad.jpg'),
                            radius: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // first three excercises and sets and view all button.
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // vertical three excercises list
                        Expanded(
                          flex: 4,
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                            height: 72,
                            child: const Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Squat . Barbell',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Avenir',
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: .1,
                                      fontSize: 15),
                                ),
                                Text(
                                  'Glute Ham Raise',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Avenir',
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: .1,
                                      fontSize: 15),
                                ),
                                Text(
                                  'Bulgarian Split Squat . Dumbbell',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Avenir',
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: .1,
                                      fontSize: 15),
                                ),
                                // const SizedBox(height: 16),
                                // Row(
                                //   children: <Widget>[
                                //     const Icon(
                                //       Icons.location_on,
                                //       color: Colors.black,
                                //       size: 16,
                                //     ),
                                //     const SizedBox(
                                //       width: 8,
                                //     ),
                                //     Flexible(
                                //       child: Text(
                                //         item.location,
                                //         style: const TextStyle(
                                //           color: Colors.black,
                                //           fontFamily: 'Avenir',
                                //         ),
                                //       ),
                                //     ),
                                //   ],
                                // ),
                              ],
                            ),
                          ),
                        ),

                        // sets and reps
                        const Expanded(
                          flex: 1,
                          child: SizedBox(
                            height: 72,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '3x3',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Avenir',
                                      fontWeight: FontWeight.w900,
                                      fontSize: 15),
                                ),
                                Text(
                                  '3x3',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Avenir',
                                      fontWeight: FontWeight.w900,
                                      fontSize: 15),
                                ),
                                Text(
                                  '3x3',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Avenir',
                                      fontWeight: FontWeight.w900,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 24, 0),
                    alignment: Alignment.centerRight,
                    // child: Text(
                    //   'View all',
                    //   style: const TextStyle(
                    //       color: Colors.blue,
                    //       fontFamily: 'Avenir',
                    //       fontWeight: FontWeight.w300,
                    //       fontSize: 15),
                    // ),
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'View all',
                        style: TextStyle(
                            color: Colors.blue,
                            fontFamily: 'Avenir',
                            fontWeight: FontWeight.w300,
                            fontSize: 15),
                      ),
                    ),
                  )
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

  Workout(this.name, this.startColor, this.endColor, this.rating, this.location,
      this.category /*, this.workoutName, this.numberOfExcercises, this.firstThreeExcercises, this.workingMuscleImage*/);
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
        const Offset(0, 0), Offset(size.width, size.height), [
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
        return const Icon(
          Icons.star,
          color: Colors.white,
          size: 16,
        );
      }),
    );
  }
}
