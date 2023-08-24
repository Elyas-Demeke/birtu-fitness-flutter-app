import 'package:flutter/material.dart';

class Custom extends StatefulWidget {
  bool  customWorkoutPlanExists = true;

 Custom({super.key,  required this.customWorkoutPlanExists});

  @override
  State<Custom> createState() => _CustomState();
}

class _CustomState extends State<Custom> {
  List workoutPlans = [];
  @override
  Widget build(BuildContext context) {
    // check if user has existing custom workout plans and show two different pages based on that.
    if(widget.customWorkoutPlanExists) {
      return Container(
        margin: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                color: Colors.white,                  
                  ),
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      foregroundImage: AssetImage('assets/images/custom.jpg'),
                      backgroundColor: Colors.white,
                      radius: 90,
                    ),
                    const SizedBox(
                      width: 250,
                      child: Text('የራስዎን የመጀመሪያውን ፕሮግራም ይፍጠሩ',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w900
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 24),
                    const SizedBox(
                      width: 250,
                      child: Text('ራስዎ የሚፈልጉትን አይነት አሰራር ያዘጋጁ',
                        style: TextStyle(
                          fontSize: 16,
                          // fontWeight: FontWeight.w900
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(                      
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(110, 7, 110, 7),
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        textStyle: const TextStyle(color: Colors.white),
                        elevation: 0
                      ),
                      onPressed: () {
                        // Do something when the button is pressed.
                      },                      
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '+',
                            style: TextStyle(
                              fontSize: 26
                            )
                          ),
                          SizedBox(width: 5),
                          Text(
                            'ጀምር',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700
                            )
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    } else {
      return Text('list of custom workout plans');
    }
  }
}