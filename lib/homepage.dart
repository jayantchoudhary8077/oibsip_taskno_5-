import 'dart:async';

import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  late Stopwatch stopwatch;
  late Timer d;
  void handlestartstop() {
    if(stopwatch.isRunning){
      stopwatch.stop();
    }
    else{
      stopwatch.start();
    }
  }
  String  returnFormattedText(){
    var miliseconds=stopwatch.elapsed.inMilliseconds;
    String mili=(miliseconds%1000).toString().padLeft(3,"0");
    String second=((miliseconds~/1000) %60).toString().padLeft(2,"0");
    String  minutes=((miliseconds ~/1000)~/60).toString().padLeft(2,"0");
    return "$minutes:$second:$mili";
  }

  @override
  void initState() {
    super.initState();
    stopwatch=Stopwatch();
    d=Timer.periodic(Duration(milliseconds: 30 ), (timer) {
      setState(() {});
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Stopwatch",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 250,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 4,
                    color: Colors.cyan,
                  ),
                ),

                child: Text(
                  returnFormattedText(),
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: (){
                      stopwatch.reset();
                    },
                    child: Text(
                      "Reset",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 200,
                  ),
                  ElevatedButton(
                    onPressed: (){
                      handlestartstop();
                    },
                    child: Text(
                      "Start/Stop",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),

                ],
              )
            ],
          )
        ),
      ),
    );
  }
}
