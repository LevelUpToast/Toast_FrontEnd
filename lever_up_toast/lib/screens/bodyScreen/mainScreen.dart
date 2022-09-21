// ignore_for_file: file_names

import 'dart:convert';
import 'dart:typed_data';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:lever_up_toast/API/api.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<String> items = [
    'fruit',
    'vegetable',
  ];
  String? selectedValue;

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
      body: FutureBuilder(
        future: Api().mainPageApi(),
        builder: (BuildContext? context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
          //print(snapshot.data);
          return ListView(
            children: <Widget>[
              Container(
                  height: 250,
                  child: Container(
                    child: Card(
                      child: Container(
                        child: Swiper(
                          autoplay: false,
                          itemCount: 1,
                          itemBuilder: (context ,index) {
                            return new FutureBuilder(
                              future: Api().imageApi(snapshot.data!['data']['bannerImgUrl'][0].toString()),
                                builder: (context,snapshot){
                                //print(snapshot.data);
                                return Image.memory(
                                    snapshot.data as Uint8List ,
                                  fit:BoxFit.cover,
                                );
                                }
                                );
                          },
                        ),
                      ),
                    ),
                  )),
              snapshot.data!['data']['myFundingProducts'] == null ? Container() : Container(
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
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data!['data']['recommendedProducts'].length,
                                itemBuilder: (context, int index){
                                  return GestureDetector(
                                    onTap: (){
                                      print(snapshot.data!['data']['recommendedProducts'][index]['productSeq']);
                                    },
                                    child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: const BorderRadius.all(Radius.circular(12)),
                                        ),
                                        child:Column(
                                          children: [
                                            Flexible(
                                              flex: 2,
                                              child: Container(
                                                  width: 150,
                                                  child: FutureBuilder(
                                                    future: Api().imageApi(snapshot.data!['data']['recommendedProducts'][index]['initialImgUrl'][0].toString()),
                                                    builder: (context ,snapshot){
                                                      return Image.memory(snapshot.data as Uint8List);
                                                    },
                                                  )
                                              ),
                                            ),
                                            Flexible(
                                                flex: 1,
                                                child: Column(
                                                  children: [
                                                    Flexible(
                                                        child: Container(
                                                          child: Text(snapshot.data!['data']['recommendedProducts'][index]['title'].toString()),
                                                        )),
                                                    Flexible(
                                                        child: Container()),
                                                  ],
                                                )),
                                          ],
                                        )
                                    ),
                                  );
                                },
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
                                              fontSize: 22,
                                              color: Colors.grey
                                              ,
                                            ),),
                                        ),
                                      )),
                                  Flexible(
                                      flex: 3,
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton2(
                                          hint: Text(
                                            'Select Item',
                                            style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.greenAccent
                                            ),
                                          ),
                                          items: items
                                              .map((item) =>
                                              DropdownMenuItem<String>(
                                                value: item,
                                                child: Text(
                                                  item,
                                                  style: const TextStyle(
                                                    fontSize: 11,
                                                  ),
                                                ),
                                              ))
                                              .toList(),
                                          value: selectedValue,
                                          onChanged: (value) {
                                            setState(() {
                                              selectedValue = value as String;
                                              print(selectedValue!.toLowerCase());
                                            });
                                          },
                                          buttonHeight: 70,
                                          buttonWidth: 90,
                                          itemHeight: 50,
                                        ),
                                      ),),//TODO
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
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data!['data'][selectedValue!.toLowerCase()+'Products'].length,
                                itemBuilder: (context, int index){
                                  return GestureDetector(
                                    onTap: (){
                                      print(snapshot.data!['data'][selectedValue!.toLowerCase()+'Products'][index]['productSeq']);
                                    },
                                    child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: const BorderRadius.all(Radius.circular(12)),
                                        ),
                                        child:Column(
                                          children: [
                                            Flexible(
                                              flex: 2,
                                              child: Container(
                                                  width: 150,
                                                  child: FutureBuilder(
                                                    future: Api().imageApi(snapshot.data!['data'][selectedValue!.toLowerCase()+'Products'][index]['initialImgUrl'][0].toString()),
                                                    builder: (context ,snapshot){
                                                      return Image.memory(snapshot.data as Uint8List);
                                                    },
                                                  )
                                              ),
                                            ),
                                            Flexible(
                                                flex: 1,
                                                child: Column(
                                                  children: [
                                                    Flexible(
                                                        child: Container(
                                                          child: Text(snapshot.data!['data'][selectedValue!.toLowerCase()+'Products'][index]['title'].toString()),
                                                        )),
                                                    Flexible(
                                                        child: Container()),
                                                  ],
                                                )),
                                          ],
                                        )
                                    ),
                                  );
                                },
                              ),
                            )),
                      ],
                    ),
                  )),
            ],
          );
        },
      )
    );
  }
}