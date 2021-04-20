import 'package:flutter/material.dart';
import 'package:sorting_visualizer/bubbleSort.dart';
import 'package:sorting_visualizer/selectionSort.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}




class _MainPageState extends State<MainPage> {
  int currentIndex;
  PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();

  }
  @override
  void dispose() {
    /// TODO: implement dispose
    _pageController.dispose();
    super.dispose();

  }


  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Sorting Visualizer"),
        backgroundColor: Colors.redAccent,
      ),

      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            children: [
              TextButton(
                child: Text(
                    "Visualize Bubble Sort",
                  style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context) => BubbleSort())),
              ),
              TextButton(
                child: Text(
                  "Visualize Selection Sort",
                  style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context) => SelectionSort())),
              ),
              Text("Here Bubble Sort will Come"),
              Text("Here Selection Sort will Come"),
              Text("Here Insertion Sort will Come"),
              Text("Here Quick Sort will Come"),
            ],
          ),
        ),
      // ),
      // body: Stack(
      //   children: [
      //     Positioned(
      //       bottom: 0,
      //       left: 0,
      //       child: Container(
      //         width: size.width,
      //         height: 80,
      //         // color: Colors.white,
      //         child: Stack(
      //           children: [
      //             CustomPaint(
      //               size: Size(size.width, 80),
      //               painter: Painter(),
      //
      //             ),
      //             Center(
      //               heightFactor: 0.6,
      //               child: FloatingActionButton(onPressed: (){},
      //               backgroundColor: Colors.orange,
      //               child: Icon(Icons.shopping_bag),elevation: 0.1)
      //
      //             ),
      //             Container(
      //               width: size.width,
      //               height: 80,
      //               child: Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                 children: [
      //                   IconButton(onPressed: (){}, icon: Icon(Icons.home, semanticLabel: 'Home',), ),
      //                   // IconButton(onPressed: (){}, icon: Icon(Icons.restaurant_menu)),
      //                   // Container(width: size.width*0.20,),
      //                   // IconButton(onPressed: (){}, icon: Icon(Icons.bookmark)),
      //                   IconButton(onPressed: (){}, icon: Icon(Icons.notifications)),
      //                 ],
      //               ),
      //             )
      //           ],
      //         ),
      //       ),
      //     )
      //   ],
      // ),
      // body: Container(),
      // bottomNavigationBar: BottomNavyBar(
      //   selectedIndex: currentIndex,
      //   onItemSelected: (index){
      //     setState(() {
      //       currentIndex = index;
      //     });
      //   },
      //   items: <BottomNavyBarItem>[
      //
      //     BottomNavyBarItem(
      //       icon: Icon(Icons.sort),
      //       title: Text("Sorting Visualizer"),
      //       activeColor: Colors.redAccent,
      //       inactiveColor: Colors.black,
      //
      //     ),
      //     BottomNavyBarItem(
      //         icon: Icon(Icons.search),
      //         title: Text("Searching Visualizer"),
      //         activeColor: Colors.purpleAccent,
      //         inactiveColor: Colors.black
      //     ),
      //   ],
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){},
      //   child: Icon(Icons.add),
      //   backgroundColor: Colors.redAccent,
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      //

      // bottomNavigationBar: BubbleBottomBar(
      //   opacity: 0.2,
      //   backgroundColor: Colors.white,
      //   borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      //   currentIndex: currentIndex,
      //   hasInk: true,
      //   inkColor: Colors.black12,
      //   hasNotch: true,
      //   fabLocation: BubbleBottomBarFabLocation.end,
      //   items: <BubbleBottomBarItem>[
      //     BubbleBottomBarItem(
      //       backgroundColor: Colors.red,
      //       icon: Icon(Icons.sort, color: Colors.black12,),
      //       activeIcon: Icon(Icons.sort, color: Colors.redAccent),
      //       title: Text('Sorting Visualizer')
      //     ),
      //     BubbleBottomBarItem(
      //         backgroundColor: Colors.red,
      //         icon: Icon(Icons.sort, color: Colors.black12,),
      //         activeIcon: Icon(Icons.sort, color: Colors.redAccent),
      //         title: Text('Sorting Visualizer')
      //     ),
      //   ],
      //
      // ),

    ),
    );

  }
}

class Painter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.white..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 20);
    path.quadraticBezierTo(size.width*0.20, 0, size.width*0.35, 0);
    path.quadraticBezierTo(size.width*0.40, 0, size.width*0.40, 20);
    path.arcToPoint(Offset(size.width*0.60,20), radius: Radius.circular(10.0),clockwise: false);
    path.quadraticBezierTo(size.width*0.60, 0, size.width*0.65, 0);
    path.quadraticBezierTo(size.width*0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }

}
