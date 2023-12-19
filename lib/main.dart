import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyFirstWidget());
}

class MyFirstWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyFirstWidgetState();
  }
}

class _MyFirstWidgetState extends State<MyFirstWidget> {
  late bool _loading;
  late double _progressValue;
  @override
  void initState() {
    // TODO: implement initState
    _loading = false;
    _progressValue = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("First App"),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
              padding: EdgeInsets.all(10.0),
              child: _loading
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        LinearProgressIndicator(
                          value: _progressValue,
                        ),
                        Text(
                          "${(_progressValue * 100).round()}%",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    )
                  : const Text(
                      "press button to download",
                      style: TextStyle(fontSize: 20),
                    )),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _loading = !_loading;
              _updateProgress();
            });
          },
          child: Icon(Icons.cloud_download),
        ),
      ),
    );
  }

  void _updateProgress() {
    const oneSec = const Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer t) {
      setState(() {
        _progressValue += 0.2;
        // ignore: unrelated_type_equality_checks
        if (_progressValue.toStringAsFixed(1) == '1.0') {
          _loading = false;
          t.cancel();
          _progressValue = 0.0;
          return;
        }
      });
    });
  }
}
