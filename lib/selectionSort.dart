import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class SelectionSort extends StatefulWidget {
  @override
  _SelectionSortState createState() => _SelectionSortState();
}

class _SelectionSortState extends State<SelectionSort> {

  List<int> _numbers = [];
  int n;
  int _max = 300;

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

    for (int i = 0; i < n-1; i++)
    {
      int _minIdx = i;
      for (int j = i+1; j < n; j++)
        if (_numbers[j] < _numbers[_minIdx])
          _minIdx = j;
      temp = _numbers[_minIdx];
      _numbers[_minIdx] = _numbers[i];
      _numbers[i] = temp;
      await Future.delayed(Duration(microseconds: 500));
      _streamController.add(_numbers);
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
        title: Text("Selection Sort Visualizer"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Container(
        child: StreamBuilder<Object>(
            stream: _stream,
            builder: (context, snapshot) {
              int counter = 0;
              return Column(
                children: [
                  // Text("Enter the number of elements"),
                  Row(
                    children: _numbers.map((int number) {
                      counter++;
                      return CustomPaint(
                        painter: BarPainter(
                          width: MediaQuery.of(context).size.width/_max,
                          //width: 5.0,
                          value: number,
                          index: counter,
                        ),
                      );
                    }).toList(),
                  ),
                ],
              );
            }
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.whatshot),
      //   onPressed: (){},
      // ),
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
      paint.color = Color(0xFFE1BEE7);
    } else if (this.value < 500 * .20) {
      paint.color = Color(0xFFCE93D8);
    } else if (this.value < 500 * .30) {
      paint.color = Color(0xFFBA68C8);
    } else if (this.value < 500 * .40) {
      paint.color = Color(0xFFAB47BC);
    } else if (this.value < 500 * .50) {
      paint.color = Color(0xFF9C27B0);
    } else if (this.value < 500 * .60) {
      paint.color = Color(0xFF8E24AA);
    } else if (this.value < 500 * .70) {
      paint.color = Color(0xFF7B1FA2);
    } else if (this.value < 500 * .80) {
      paint.color = Color(0xFFAA00FF);
    } else if (this.value < 500 * .90) {
      paint.color = Color(0xFF4A148C);
    } else {
      paint.color = Color(0xFF311B92);
    }
    paint.strokeWidth = width;
    paint.strokeCap = StrokeCap.round;

    canvas.drawLine(Offset(index * width, 0), Offset(index*width, value.ceilToDouble()), paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}
