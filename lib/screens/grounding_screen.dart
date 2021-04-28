/**
 * This screen is meant to provide a time box of one minute 
 * for the user to do a grounding meditation, this includes 
 * while breathing intentionally, noticing eveyrything one can see, 
 * then graduating to evertything one can hear and then what one feels
 * 
 * Possible future features 
 * sound for end of meditation
 */

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:three_things_flutter/models/viewModels/calendar_day_view_model.dart';

class GroundingScreen extends StatefulWidget {
  @override
  _GroundingScreenState createState() => _GroundingScreenState();
}

class _GroundingScreenState extends State<GroundingScreen> {
  final interval = const Duration(seconds: 1);

  final int timerMaxSeconds = 60;

  int currentSeconds = 0;
  bool startPause = true;
  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';
  double get timerDouble {
    double timer = currentSeconds.toDouble() / timerMaxSeconds.toDouble();
    return timer;
  }

  String get meditationButtonText {
    String text = '';
    setState(() {
      if (startPause == false) {
        text = 'Restart Meditation';
      } else {
        text = 'Start Meditation';
      }
    });
    return text;
  }

  Icon get getIcon {
    Icon icon = Icon(Icons.play_arrow);
    setState(() {
      if (startPause == false) {
        icon = Icon(Icons.replay_rounded);
      } else {
        icon = Icon(Icons.play_arrow);
      }
    });
    return icon;
  }

  startTimeout([int milliseconds = 100]) {
    var duration = interval;
    startPause = !startPause;
    print('pause $startPause');
    Timer.periodic(duration, (timer) {
      setState(() {
        if (startPause == false) {
          // print(timer.tick);
          currentSeconds = timer.tick;
          if (timer.tick >= timerMaxSeconds) timer.cancel();
        } else {
          currentSeconds = 0;
          timer.cancel();
        }
      });
    });
  }

  // void updateMeditationDone() {
  //   setState(() {
  //     if (timerMaxSeconds == currentSeconds) {
  //       Provider.of<CalendarDayViewModel>(context, listen: false)
  //           .meditationCompletedToday;
  //     }
  //     // or
  //     if (timerText == '00: 00') {
  //       Provider.of<CalendarDayViewModel>(context, listen: false)
  //           .meditationCompletedToday;
  //     }
  //   });
  // }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grounding Meditation'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 16.0, left: 64.0, right: 64.0, bottom: 32.0),
                child: Text(
                  'Describe your surroundings, everything you see during the meditation.',
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 200.0,
                width: 200.0,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.orange,
                  //valueColor: Colors.orange,
                  value: timerDouble,
                  semanticsLabel: timerText,
                ),
              ),
              SizedBox(
                height: 32.0,
              ),
              Text(
                timerText,
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey),
              ),
              SizedBox(
                height: 16.0,
              ),
              ClipOval(
                child: Material(
                  color: Colors.orange, // button color
                  child: InkWell(
                    splashColor: Colors.yellow, // inkwell color
                    child: SizedBox(width: 80.0, height: 80.0, child: getIcon),
                    onTap: () {
                      startTimeout();
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //TODO: FIX updating the calendar day that a meditation has been completed today
          Provider.of<CalendarDayViewModel>(context, listen: false)
              .meditationCompletedToday;
          Navigator.pop(context);
        },
        tooltip: 'Done',
        child: const Icon(Icons.check),
      ),
    );
  }
}
