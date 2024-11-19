import 'package:flutter/material.dart';
import 'package:roll_dice_app/dice_roller.dart';
// import 'package:roll_dice_app/styled_text.dart';

class GradiantContainer extends StatelessWidget {
  GradiantContainer(this.colorList, {super.key});
  final List<Color> colorList;

  var activeDiceImage = 'assets/images/dice-2.png';

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colorList,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: DiceRoller(),
      ),
    );
  }
}
