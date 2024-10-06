import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

final randomizer = Random();

class DiceRoller extends StatefulWidget{
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  
  var diceroll = 2;
  Timer? rollTimer;


  void rollDice(){
    const duration = Duration(milliseconds: 100);
    int rollCount = 0;

    rollTimer?.cancel();
    rollTimer = Timer.periodic(duration, (Timer timer){
      setState(() {
        diceroll = randomizer.nextInt(6) + 1;
      });
      rollCount++;
      if(rollCount >= 15){
        timer.cancel();
        setState(() {
        diceroll = randomizer.nextInt(6) + 1;
      });
    }
    }); 
    
    
  }

  @override
  Widget build(context) {
    return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'asset/images/dice-$diceroll.png', 
                  width: 200
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: rollDice, 
                  style: TextButton.styleFrom(
                    // padding: EdgeInsets.only(
                    //   top: 20, 
                    // ),
                    foregroundColor: Colors.yellowAccent, 
                    textStyle: const TextStyle(fontSize: 28)),
                  child: const Text("Roll Dice")
                 )
                ],
              );
  }
}