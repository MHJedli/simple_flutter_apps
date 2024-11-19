import 'package:flutter/material.dart';
import 'dart:math';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  var activeDiceImage = 'assets/images/dice-1.png';
  final randomizer=Random();
  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          activeDiceImage,
          width: 250,
        ),
        const SizedBox(
          height: 20,
        ),
        TextButton(
          onPressed: () {
            var diceRoll = randomizer.nextInt(6)+1;
            setState(() {
              activeDiceImage = 'assets/images/dice-$diceRoll.png';
            });
          },
          style: TextButton.styleFrom(
            // padding: const EdgeInsets.only(top: 20,),
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
              fontSize: 28,
            ),
          ),
          child: Text('Roll Dice'),
        )
      ],
    );
  }
}
