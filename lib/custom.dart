import 'package:flutter/material.dart';
import 'custom/customPlan.dart';
import 'training/bodyPart.dart';
class Custom extends StatefulWidget {
  bool  customWorkoutPlanExists = false;

 Custom({super.key,  required this.customWorkoutPlanExists});

  @override
  State<Custom> createState() => _CustomState();
}

class _CustomState extends State<Custom> {
   bool _customWorkoutPlanExists = false;
   @override
  void initState() {
    super.initState();
    _customWorkoutPlanExists = widget.customWorkoutPlanExists;
  }
  @override
  Widget build(BuildContext context) {
    // check if user has existing custom workout plans and show two different pages based on that.
    if(!_customWorkoutPlanExists) {
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
      return ListView.builder(
        itemCount: plans.length,
        itemBuilder: (context,index)  {
          return BodyPart(item: plans[index]);
      });
    }
  }
  List plans = [
    Workout('Lower Body Workout', 7, [
      {
        "excercise": 'Squat',
        "sets": 3,
        "reps": double.infinity
      },
      {
        "excercise": 'Leg press',
        "sets": 3,
        "reps": double.infinity
      },
      {
        "excercise": 'Leg extension',
        "sets": 3,
        "reps": double.infinity
      },
      {
        "excercise": 'Hamstring curl',
        "sets": 3,
        "reps": double.infinity
      },
      ],'image/link'),
    Workout('Hamriyah Food Court', 6, [
      {
        "excercise": 'Squat',
        "sets": 3,
        "reps": double.infinity
      },
      ],'image/link'),
    Workout('Gate of Food Court', 4, [
      {
        "excercise": 'Squat',
        "sets": 3,
        "reps": double.infinity
      },
      ],'image/link'),
    Workout('Express Food Court', 5, [
      {
        "excercise": 'Squat',
        "sets": 3,
        "reps": double.infinity
      },
      ],'image/link'),
    Workout('BurJuman Food Court', 4, [
      {
        "excercise": 'Squat',
        "sets": 3,
        "reps": double.infinity
      },
      ],'image/link'),
    Workout('BurJuman Food Court', 7, [
      {
        "excercise": 'Squat',
        "sets": 3,
        "reps": double.infinity
      },
      ],'image/link'),
    Workout('BurJuman Food Court', 7, [
      {
        "excercise": 'Squat',
        "sets": 3,
        "reps": double.infinity
      },
      ],'image/link'),
    Workout('BurJuman Food Court', 6, [
      {
        "excercise": 'Squat',
        "sets": 3,
        "reps": double.infinity
      },
      ],'image/link'),
  ];
  
}



// class CustomPlanItem {
//   final String name;
//   final int numberOfExcercises;



//   CustomPlanItem(this.name);
// }