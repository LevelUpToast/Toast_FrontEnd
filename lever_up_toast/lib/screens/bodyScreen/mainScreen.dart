// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  List<Color> _color = [Colors.black , Colors.grey , Colors.blue];
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
      body: ListView(
          children: <Widget>[
            Container(
              height: 250,
                child: Container(
                  child: Card(
                    child: Container(
                      child: Swiper(
                        autoplay: true,
                        itemCount: 3,
                        itemBuilder: (context ,index){
                          return Container(
                            color: _color[index],
                          );
                        },
                      ),
                    ),
                  ),
                )),
            Container(
              height: 100,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 24,
                      right: 24,
                      top: 10,
                      bottom: 10,
                    ),
                    child: Card(
                      child: Row(
                        children: [
                          Flexible(
                            flex: 2,
                              child: Container(
                                child: Center(
                                  child: Text('사진'),
                                ),
                              )),
                          Flexible(
                            flex: 4,
                              child: Container()),
                          Flexible(
                            flex: 1,
                              child: Container(
                                child: IconButton(
                                  onPressed: (){
                                    print('눌림');
                                  },
                                  icon: Icon(
                                    Icons.navigate_next,
                                    color: Colors.black
                                  ),
                                  iconSize: 30,
                                ),
                              )),
                        ],
                      ),
                    ),
                ),
            ),
            Container(
                height: 250,
              //flex: 2,
                child: Container(
                  //color: Colors.lightGreen,
                  child: Column(
                    children: [
                      Flexible(
                        flex: 1,
                          child: Container(
                            child: Row(
                              children: [
                                Flexible(
                                  flex: 7,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 24),
                                      child: Container(
                                        child: Text(' 이런상품도 있어요!',
                                          style: TextStyle(
                                            fontSize: 25,
                                            color: Colors.grey
                                            ,
                                          ),),
                                      ),
                                    )),
                                Flexible(
                                  flex: 2,
                                    child: Container()),
                                Flexible(
                                  flex: 2,
                                      child: Container(
                                        child: TextButton(
                                          onPressed: (){
                                            print('클릭함');
                                          },
                                          child: Text('전체 보기',
                                            style: TextStyle(
                                                color: Colors.black
                                            ),),
                                        ),
                                      ),
                                    ),
                              ],
                            ),
                          )),
                      Flexible(
                        flex: 3,
                          child: Container(
                            padding: EdgeInsets.only(left: 20),
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                                  ),
                                  child: Container(
                                    width: 160.0,
                                    color: Colors.red,
                                  ),
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                                  ),
                                  child: Container(
                                    width: 160.0,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                                  ),
                                  child: Container(
                                    width: 160.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                )),
            SizedBox(
              height: 30,
            ),
            Container(
                //flex: 2,
                height: 250,
                child: Container(
                  //color: Colors.lightGreen,
                  child: Column(
                    children: [
                      Flexible(
                          flex: 1,
                          child: Container(
                            child: Row(
                              children: [
                                Flexible(
                                    flex: 7,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 24),
                                      child: Container(
                                        child: Text(' 이런상품은 어떠신가요?',
                                          style: TextStyle(
                                            fontSize: 25,
                                            color: Colors.grey
                                            ,
                                          ),),
                                      ),
                                    )),
                                Flexible(
                                    flex: 1,
                                    child: Container()),
                                Flexible(
                                  flex: 2,
                                  child: Container(
                                    child: TextButton(
                                      onPressed: (){
                                        print('클릭함');
                                      },
                                      child: Text('전체 보기',
                                        style: TextStyle(
                                            color: Colors.black
                                        ),),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                      Flexible(
                          flex: 3,
                          child: Container(
                            padding: EdgeInsets.only(left: 20),
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                                  ),
                                  child: Container(
                                    width: 160.0,
                                    color: Colors.red,
                                  ),
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                                  ),
                                  child: Container(
                                    width: 160.0,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                                  ),
                                  child: Container(
                                    width: 160.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                )),
          ],
        ),
    );
  }
}