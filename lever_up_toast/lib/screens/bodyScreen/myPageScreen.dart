import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPageScreen extends StatelessWidget {
  const MyPageScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions : [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Icon(Icons.notifications,color: Colors.black,),
          ),
        ],
        elevation: 0,
        title: Text('LevelUpToast',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        iconTheme: IconThemeData(
          color : Colors.black,
        ),
      ),
      body: Column(
        children: [
          Flexible(
            flex: 17,
            child: Container(),
          ),
          Flexible(
            flex: 1,
            child: Container(
              color: Colors.grey,
            ),
          ),
          Flexible(
            flex: 17,
            child: Container(),
          ),
          Flexible(
            flex: 1,
            child: Container(
              color: Colors.grey,
            ),
          ),
          Flexible(
            flex: 17,
            child: Container(),
          ),
        ],
      ),
    );
  }
}
