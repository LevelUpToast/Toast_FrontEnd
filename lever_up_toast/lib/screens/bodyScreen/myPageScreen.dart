// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lever_up_toast/API/api.dart';
import 'package:lever_up_toast/screens/bodyScreen/productDetailScreen.dart';
import 'package:lever_up_toast/values/values.dart';
import 'package:lever_up_toast/values/currentPage.dart';
import 'package:lever_up_toast/API/apiInfo.dart';

class MyPageScreen extends StatelessWidget {
  const MyPageScreen({Key? key}) : super(key: key);

  String percentage(int currentAmount,int finalAmount){
    double result = 0 ;
    result = (currentAmount/finalAmount)*100;
    return result.toString()+"%";
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String,dynamic>> _currentpage = currentPage.getPage();
    String imagePath = ApiInfo.testUrl+ApiInfo.imageUrl;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
            child: Column(
              children: [
                Flexible(
                  flex:2,
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.04,
                      ),
                      Flexible(
                          flex:3,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white70, width: 1),
                              borderRadius: BorderRadius.circular(45),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(45),
                              child: Image.asset("assets/img/userImage.png",
                                fit: BoxFit.fitHeight,),
                            ),
                          )
                      ),
                      Flexible(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                flex: 1,
                                child: Text(" 반갑습니다.",
                                  style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.height * 0.037,
                                  ),
                                ),
                              ),
                              Flexible(
                                flex:1,
                                child: Text(" 김준범 님",
                                  style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.height * 0.035,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                Flexible(
                    flex:2,
                    child: Row(
                      children: [
                        Flexible(
                            child: Center(
                              child: Column(
                                children: [
                                  Flexible(
                                    child: Container(
                                      child: GestureDetector(
                                        onTap: (){
                                          print("asd");
                                        },
                                        child: SvgPicture.asset("assets/img/펀딩한 상품.svg"),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height *0.01,),
                                  Flexible(
                                    child: Text(
                                      "펀딩한 상품",
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context).size.height * 0.017,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                        ),
                        Flexible(
                            child: Center(
                              child: Column(
                                children: [
                                  Flexible(
                                    child: Container(
                                      child: GestureDetector(
                                        onTap: (){
                                          Navigator.pushReplacementNamed(context, '/pay');
                                        },
                                        child: SvgPicture.asset("assets/img/toastpay.svg"),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height:  MediaQuery.of(context).size.height *0.01,),
                                  Flexible(
                                      child: Text(
                                        "ToastPay",
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context).size.height * 0.017,
                                            fontWeight: FontWeight.bold
                                        ),
                                      )),
                                ],
                              ),
                            )
                        ),
                        Flexible(
                            child: Center(
                              child: Column(
                                children: [
                                  Flexible(
                                    child: Container(
                                      child: GestureDetector(
                                        onTap: (){
                                          print("asd");
                                        },
                                        child: SvgPicture.asset("assets/img/고객센터.svg"),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height:  MediaQuery.of(context).size.height *0.01,),
                                  Flexible(
                                      child: Text(
                                        "고객센터",
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context).size.height * 0.017,
                                            fontWeight: FontWeight.bold
                                        ),
                                      )),
                                ],
                              ),
                            )
                        ),
                      ],
                    )),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              color: AppColors.grey,
            ),
          ),
          Flexible(
            flex: 19,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Flexible(
                  flex:1,
                  child: Row(
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width * 0.04,),
                      Container(
                        child: Text("최근 본 제품",
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height * 0.026,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Flexible(
                  flex: 5,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _currentpage.length,
                    itemBuilder: (context, index){
                      return GestureDetector(
                        onTap: () async {
                          print(_currentpage[index]);
                          currentPage.addPage(_currentpage[index]);
                          if(0 == await Api().productDetail(_currentpage[index]["productSeq"])){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ProductDetailScreen()),
                            );
                          }
                        },
                        child: Card(
                            elevation: 0,
                            child:Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  flex: 2,
                                  child: Container(
                                      height: MediaQuery.of(context).size.height*0.3,
                                      width: MediaQuery.of(context).size.width*0.35,
                                      child: Padding(
                                        padding:EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(20),
                                          child: Image(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                                imagePath+_currentpage[index]['initialImgUrl'][1].toString()
                                            ),
                                          ),
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
                                          flex:3,
                                          child: Container(
                                              height: MediaQuery.of(context).size.height*0.2,
                                              width: MediaQuery.of(context).size.width*0.35,
                                              child: Padding(
                                                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02),
                                                child: Text(_currentpage[index]['title'].toString(),
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: MediaQuery.of(context).size.width*0.03,
                                                  ),
                                                ),
                                              )
                                          ),
                                        ),
                                        Flexible(
                                          flex:1,
                                          child: Container(
                                              child: Padding(
                                                padding:EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02),
                                                child:  Text(
                                                  percentage(_currentpage[index]['funding']['currentAmount'],
                                                      _currentpage[index]['funding']['finalAmount']),
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: MediaQuery.of(context).size.height*0.018,
                                                      color:Colors.green),
                                                ),
                                              )
                                          ),
                                        ),
                                      ],
                                    )),
                              ],
                            )
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              color: AppColors.grey,
            ),
          ),
          Flexible(
            flex: 17,
            child: Container(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Row(
                      children: [
                        SizedBox(width: MediaQuery.of(context).size.width * 0.04,),
                        Text(" 공지사항",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * 0.021,
                            fontWeight: FontWeight.bold,
                          ),),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.66),
                        IconButton(
                          onPressed: (){},
                          color:Colors.black,
                          icon: Icon(
                            Icons.navigate_next,
                            size:MediaQuery.of(context).size.height * 0.03 ,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Row(
                      children: [
                        SizedBox(width: MediaQuery.of(context).size.width * 0.04,),
                        Text(" 이용안내",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * 0.021,
                            fontWeight: FontWeight.bold,
                          ),),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.66),
                        IconButton(
                          onPressed: (){},
                          color:Colors.black,
                          icon: Icon(
                            Icons.navigate_next,
                            size:MediaQuery.of(context).size.height * 0.03 ,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Row(
                      children: [
                        SizedBox(width: MediaQuery.of(context).size.width * 0.04,),
                        Text(" LevelUpToast안내",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * 0.021,
                            fontWeight: FontWeight.bold,
                          ),),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.44),
                        IconButton(
                          onPressed: (){},
                          color:Colors.black,
                          icon: Icon(
                            Icons.navigate_next,
                            size:MediaQuery.of(context).size.height * 0.03 ,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Row(
                      children: [
                        SizedBox(width: MediaQuery.of(context).size.width * 0.04,),
                        Text(" 로그아웃",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: MediaQuery.of(context).size.height * 0.021,
                            fontWeight: FontWeight.bold,
                          ),),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.66),
                        IconButton(
                          onPressed: (){},
                          color:Colors.black,
                          icon: Icon(
                            Icons.navigate_next,
                            size:MediaQuery.of(context).size.height * 0.03 ,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}