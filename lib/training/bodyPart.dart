
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
  var _item;
  @override
  void initState() {
    super.initState();
    _item = widget.item;
  }

  List<Widget> _makeExcercises(excercises) {
    List<Widget> widgets = [];
    const maxItem = 3;
    for (var i = 0; i < excercises.length; i++) {
      if (i < maxItem) {
        widgets.add(Text(
          excercises[i]['excercise'],
          style: const TextStyle(
              color: Colors.black,
              fontFamily: 'Avenir',
              fontWeight: FontWeight.w300,
              letterSpacing: .1,
              fontSize: 15),
        ));
      }
    }
    return widgets;
  }

  List<Widget> _makeSets(excercises) {
    List<Widget> widgets = [];
    const maxItem = 3;
    for (var i = 0; i < excercises.length; i++) {
      if (i < maxItem) {
        widgets.add(Text(
          '${excercises[i]['sets']}x${excercises[i]['reps'] == double.infinity ? 'failure': excercises[i]['reps'] }',
          style: const TextStyle(
              color: Colors.black,
              fontFamily: 'Avenir',
              fontWeight: FontWeight.w900,
              fontSize: 15),
        ));
      }
    }
    return widgets;
  }

  double _getHeight(excercises) {
    double length = double.parse('${excercises.length}') > 3 ? 3 : double.parse('${excercises.length}'); 
    return 24 * length;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
        child: Stack(
          children: <Widget>[
            // background
            InkWell(
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
              child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 210 - double.parse('${3-(_item.excercises.length > 3 ? 3 : _item.excercises.length)}')*24,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(_borderRadius),
                color: _containerColor
              ),
            ),
              
              
            ),

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
                                  _item.workoutName,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Avenir',
                                    fontWeight: FontWeight.w900,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(                                  
                                  "${_item.excercises.length} excercises",
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
                            height: _getHeight(_item.excercises),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: _makeExcercises(_item.excercises),
                            ),
                          ),
                        ),

                        // sets and reps
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            height: _getHeight(_item.excercises),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: _makeSets(_item.excercises),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 24, 0),
                    alignment: Alignment.centerRight,
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
  final String workoutName;
  final double numberOfExcercises;
  final List<dynamic> excercises; // elements will be objects with excercise and sets and reps as key value pairs
  final String workingMuscleImage;

  Workout(this.workoutName, this.numberOfExcercises, this.excercises, this.workingMuscleImage);
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
