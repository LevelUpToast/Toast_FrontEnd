// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lever_up_toast/API/api.dart';

class ToastPayScreen extends StatefulWidget {
  const ToastPayScreen({Key? key}) : super(key: key);

  @override
  _ToastPayScreenState createState() => _ToastPayScreenState();
}

class _ToastPayScreenState extends State<ToastPayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions :  [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              child: const Icon(Icons.home,color: Colors.black,),
              onTap: () => Navigator.pushReplacementNamed(context, '/home'),
            ),
          ),
        ],
        elevation: 0,
        title: const Text('LevelUpToast',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        iconTheme: const IconThemeData(
          color : Colors.black,
        ),
      ),
        body: FutureBuilder(
          future: Api().payGet(),
          builder: (BuildContext? context, AsyncSnapshot<Map<String, dynamic>?> snapshot) {
            print(snapshot.data);
            if(snapshot.hasData){
              return ListView(
                children: <Widget>[

                ],
              );
            }
            return Center(child: CupertinoActivityIndicator());
          },
        )
    );
  }
}
