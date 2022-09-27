// ignore_for_file: file_names

import 'dart:convert';
import 'dart:typed_data';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:lever_up_toast/API/api.dart';
import 'package:lever_up_toast/API/apiInfo.dart';
import 'package:lever_up_toast/values/currentPage.dart';


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
  String? selectedValue = 'fruit';
  String percentage(int currentAmount,int finalAmount){
    double result = 0 ;
    result = (currentAmount/finalAmount)*100;
    return result.toString()+"%";
  }

  @override
  String imagePath = ApiInfo.testUrl+ApiInfo.imageUrl;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
        builder: (BuildContext? context, AsyncSnapshot<Map<String, dynamic>?> snapshot) {
          //print(snapshot.data!);
          if(snapshot.hasData){
            return ListView(
              children: <Widget>[
                Container(
                    height: 250,
                    child: Container(
                      child: Card(
                        child: Container(
                          child: Swiper(
                            autoplay: true,
                            itemCount: snapshot.data!['data']["bannerImgUrl"][0].length,
                            itemBuilder: (context ,index) {
                              return Image(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    imagePath+snapshot.data!['data']["bannerImgUrl"][0].toString()),
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
                      elevation: 1,
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
                    height: MediaQuery.of(context!).size.height *0.3,
                    child: Container(
                      child: Column(
                        children: [
                          Flexible(
                              flex: 1,
                              child: Container(
                                width: MediaQuery.of(context!).size.width,
                                child: Row(
                                  children: [
                                    Flexible(
                                        flex: 6,
                                        child: Padding(
                                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05),
                                          child: Container(
                                            child: Text(' 이런상품도 있어요!',
                                              style: TextStyle(
                                                fontSize: MediaQuery.of(context).size.height * 0.025,
                                                color: Colors.grey
                                                ,
                                              ),),
                                          ),
                                        )),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.27,
                                    ),
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
                                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05),
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data!['data']['recommendedProducts'].length,
                                  itemBuilder: (context, int index){
                                    return GestureDetector(
                                      onTap: (){
                                        currentPage.addPage(snapshot.data!['data']['recommendedProducts'][index]);
                                        print(snapshot.data!['data']['recommendedProducts'][index]);
                                      },
                                      child: Padding(
                                        padding:EdgeInsets.only(left: 10),
                                        child:Card(
                                            elevation: 0,
                                            child:Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Flexible(
                                                    flex: 2,
                                                    child: Container(
                                                      height: MediaQuery.of(context).size.height*0.2,
                                                      width: MediaQuery.of(context).size.width*0.35,
                                                      child: ClipRRect(
                                                        borderRadius: BorderRadius.circular(20),
                                                        child: Image(
                                                          fit: BoxFit.fill ,
                                                          image: NetworkImage(
                                                              imagePath+snapshot.data!['data']['recommendedProducts'][index]['initialImgUrl'][1].toString()
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                ),
                                                Flexible(
                                                    flex: 1,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Flexible(
                                                            child: Container(
                                                              child: Center(
                                                                child: Text(snapshot.data!['data']['recommendedProducts'][index]['title'].toString(),
                                                                  style: TextStyle(
                                                                    fontSize: MediaQuery.of(context).size.height*0.025,
                                                                    color: Colors.grey
                                                                  ),),
                                                              ),
                                                            )),
                                                        // SizedBox(
                                                        //   height: 30,
                                                        // ),
                                                        Flexible(
                                                          child: Container(
                                                            child: Text(
                                                              percentage(snapshot.data!['data']['recommendedProducts'][index]['funding']['currentAmount'],
                                                                  snapshot.data!['data']['recommendedProducts'][index]['funding']['finalAmount']),
                                                              style: TextStyle(
                                                                  fontWeight: FontWeight.w500,
                                                                  fontSize: MediaQuery.of(context).size.height * 0.018,
                                                                  color:Colors.green),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    )),
                                              ],
                                            )
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                          ),
                        ],
                      ),
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                  //flex: 2,
                    height: MediaQuery.of(context).size.height *0.3,
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
                                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05),
                                          child: Container(
                                            child: Text(' 이런상품은 어떠신가요?',
                                              style: TextStyle(
                                                fontSize: MediaQuery.of(context).size.height * 0.025,
                                                color: Colors.grey,
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
                                                fontSize: MediaQuery.of(context).size.height * 0.002,
                                                color: Colors.black
                                            ),
                                          ),
                                          items: items
                                              .map((item) =>
                                              DropdownMenuItem<String>(
                                                value: item,
                                                child: Text(
                                                  item,
                                                  style: TextStyle(
                                                    fontSize: MediaQuery.of(context).size.height * 0.015,
                                                  ),
                                                ),
                                              ))
                                              .toList(),
                                          value: selectedValue,
                                          onChanged: (value) {
                                            setState(() {
                                              selectedValue = value as String;
                                              print(selectedValue);
                                            });
                                          },
                                          buttonHeight: MediaQuery.of(context).size.height * 0.03,
                                          buttonWidth: MediaQuery.of(context).size.width * 0.3,
                                          itemHeight: MediaQuery.of(context).size.height * 0.03,
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
                                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05),
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 1,
                                  itemBuilder: (context, int index){
                                    return GestureDetector(
                                      onTap: (){
                                        currentPage.addPage(snapshot.data!['data'][selectedValue.toString()+'Products'][index]);
                                        print(snapshot.data!['data'][selectedValue.toString()+'Products'][index]);
                                      },
                                      child: Padding(
                                        padding:EdgeInsets.only(left: 10),
                                        child: Card(
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: const BorderRadius.all(Radius.circular(12)),
                                            ),
                                            child:Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Flexible(
                                                  flex: 2,
                                                  child: Container(
                                                      height: 150,
                                                      width: 150,
                                                      child: ClipRRect(
                                                        borderRadius: BorderRadius.circular(20),
                                                        child: Image(
                                                          fit: BoxFit.fill,
                                                          image: NetworkImage(
                                                              imagePath+snapshot.data!['data'][selectedValue.toString()+'Products'][index]['initialImgUrl'][1]),
                                                        ),
                                                      )
                                                  ),
                                                ),
                                                Flexible(
                                                    flex: 1,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Flexible(
                                                            child: Container(
                                                              child: Text(snapshot.data!['data'][selectedValue!+'Products'][index]['title'].toString(),
                                                                style: TextStyle(
                                                                  color: Colors.grey,
                                                                  fontSize: 20,
                                                                ),),
                                                            )),
                                                        // SizedBox(
                                                        //   height: 30,
                                                        // ),
                                                        Flexible(
                                                          child: Container(
                                                            child: Text(
                                                              percentage(snapshot.data!['data'][selectedValue!+"Products"][index]['funding']['currentAmount'],
                                                                  snapshot.data!['data'][selectedValue!+"Products"][index]['funding']['finalAmount']),
                                                              style: TextStyle(
                                                                  fontWeight: FontWeight.w500,
                                                                  fontSize: 15,
                                                                  color:Colors.green),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    )),
                                              ],
                                            )
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                          ),
                        ],
                      ),
                    )),
              ],
            );
          }
          return Center(child: CupertinoActivityIndicator());
        },
      )
    );
  }
}