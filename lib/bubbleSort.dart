import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class BubbleSort extends StatefulWidget {
  @override
  _BubbleSortState createState() => _BubbleSortState();
}

class _BubbleSortState extends State<BubbleSort> {

  List<int> _numbers = [];
  int _max = 350;

  StreamController<List<int>> _streamController;
  Stream<List<int>> _stream;


  _randomize(){
    _numbers = [];
    for(int i=0; i < _max; i++){
      _numbers.add(Random().nextInt(_max));
    }
    _streamController.add(_numbers);
  }
  _sort() async{
    int temp;
    // bool swapped;
    int n = _numbers.length;
    for (int i = 0; i < n; i++)
    {
      for (int j = 0; j < n - i - 1; j++)
      {
        if (_numbers[j] > _numbers[j + 1])
        {
          temp = _numbers[j];
          _numbers[j] = _numbers[j + 1];
          _numbers[j + 1] = temp;
        }
        await Future.delayed(Duration(microseconds: 500));
        _streamController.add(_numbers);
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _streamController = StreamController<List<int>>();
    _stream = _streamController.stream;
    _randomize();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Bubble Sort Visualizer"),
        backgroundColor: Color(0xFF39A96B),
      ),
      body: Container(
        child: StreamBuilder<Object>(
          stream: _stream,
          builder: (context, snapshot) {
            int counter = 0;
            return Row(
              children: _numbers.map((int number) {
                counter++;
                return CustomPaint(
                 painter: BarPainter(
                   width: MediaQuery.of(context).size.width/_max,
                   value: number,
                   index: counter,
                 ),
                );
              }).toList(),
            );
          }
        ),
      ),
      bottomNavigationBar: Row(
        children: <Widget>[
          Expanded(
            child: TextButton(
              child: Text("Randomize",
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.deepPurpleAccent)
              ),
              onPressed: _randomize,

            ),
          ),
          Expanded(
            child: TextButton(
              child: Text("Sort",
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.deepPurpleAccent),
              ),

              onPressed: _sort,
            ),
          ),
        ],
      ),
    );
  }
}

class BarPainter extends CustomPainter{
  final double width;
  final int value;
  final int index;

  BarPainter({this.width, this.value, this.index});
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint paint = Paint();

    if (this.value < 500 * .10) {
      paint.color = Color(0xFFDEEDCF);
    } else if (this.value < 500 * .20) {
      paint.color = Color(0xFFBFE1B0);
    } else if (this.value < 500 * .30) {
      paint.color = Color(0xFF99D492);
    } else if (this.value < 500 * .40) {
      paint.color = Color(0xFF74C67A);
    } else if (this.value < 500 * .50) {
      paint.color = Color(0xFF56B870);
    } else if (this.value < 500 * .60) {
      paint.color = Color(0xFF39A96B);
    } else if (this.value < 500 * .70) {
      paint.color = Color(0xFF1D9A6C);
    } else if (this.value < 500 * .80) {
      paint.color = Color(0xFF188977);
    } else if (this.value < 500 * .90) {
      paint.color = Color(0xFF137177);
    } else {
      paint.color = Color(0xFF0E4D64);
    }
    paint.strokeWidth = 3.0;
    paint.strokeCap = StrokeCap.round;

    canvas.drawLine(Offset(index * width, 0), Offset(index*width, value.ceilToDouble()), paint);
    // canvas.drawLine(Offset(index * width, value.ceilToDouble()), Offset(index*width, 0), paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}
