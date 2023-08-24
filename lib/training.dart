import "package:birtu_fitness/training/bodyPart.dart";
import "package:flutter/material.dart";

class Training extends StatefulWidget {
  const Training({Key? key}) : super(key: key);

  @override
  State<Training> createState() => _TrainingState();
}

class _TrainingState extends State<Training> {

  var items = [
    Workout('Lower Body Workout', 7, [{"test": '"test"'}],'image/link'),
    Workout('Hamriyah Food Court', 6, [{"test": '"test"'}],'image/link'),
    Workout('Gate of Food Court', 4, [{"test": '"test"'}],'image/link'),
    Workout('Express Food Court', 5, [{"test": '"test"'}],'image/link'),
    Workout('BurJuman Food Court', 4, [{"test": '"test"'}],'image/link'),
    Workout('BurJuman Food Court', 6, [{"test": '"test"'}],'image/link'),
    Workout('BurJuman Food Court', 7, [{"test": '"test"'}],'image/link'),
    Workout('BurJuman Food Court', 6, [{"test": '"test"'}],'image/link'),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return BodyPart(item: items[index]);
         },
      );
  }
}
