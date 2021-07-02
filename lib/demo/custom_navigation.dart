import 'package:flutter/material.dart';

class CustomNavigation extends StatefulWidget {
  const CustomNavigation({Key? key}) : super(key: key);

  @override
  _CustomNavigationState createState() => _CustomNavigationState();
}

class _CustomNavigationState extends State<CustomNavigation> {
  String _title = "Home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('自定义导航'),
        elevation: 4.0,
      ),
      body: Center(
        child: Text(_title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: '长按显示',
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlue,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    _title = 'Home';
                  });
                },
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {
                  setState(() {
                    _title = 'Airplay';
                  });
                },
                icon: Icon(
                  Icons.airplay_outlined,
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }
}
