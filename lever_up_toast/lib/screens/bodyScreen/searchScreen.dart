// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lever_up_toast/API/api.dart';
import 'package:lever_up_toast/API/apiInfo.dart';
import 'package:lever_up_toast/screens/bodyScreen/productDetailScreen.dart';
import 'package:lever_up_toast/values/values.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:lever_up_toast/values/currentPage.dart';

class searchScreen extends StatefulWidget {
  const searchScreen({Key? key}) : super(key: key);
  @override
  _searchScreenState createState() => _searchScreenState();
}

class _searchScreenState extends State<searchScreen> {
  @override
  final List<Map> myProducts =[
    {"name":"사과"},
    {"name":"포도"},
    {"name":"오렌지"},
    {"name":"수박"},
    {"name":"참외"},
    {"name":"고등어"},
    {"name":"맛있는거"},
    {"name":"다랑어"},
    {"name":"내얼굴"},
    {"name":"맛있는거"},
  ];
  final myController = TextEditingController();
  String imagePath = ApiInfo.testUrl+ApiInfo.imageUrl;
  Map<String,dynamic> searchResult ={};
  double  percentage(int currentAmount,int finalAmount){
    double result = 0 ;
    result = (currentAmount/finalAmount);
    return result;
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('LevelUpToast',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: Card(
              elevation: 0,
              color: AppColors.grey100,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Row(
                  children: [
                    Flexible(
                      flex: 6,
                      child: Container(
                        child: TextField(
                          onEditingComplete:() async{
                            searchResult = await Api().searchApi(myController.value.text);
                            print(searchResult);
                            if (searchResult['data'] != null){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => findPro(context,searchResult)),
                              );
                            }else if(searchResult['data'] == null){
                              FlutterDialog();
                            }
                          },
                          controller: myController,
                          decoration: InputDecoration(
                            suffixIcon:IconButton(
                              color: Colors.black,
                              icon: Icon(Icons.search),
                              onPressed: () async{
                                searchResult = await Api().searchApi(myController.value.text);
                                print(searchResult);
                                if (searchResult['data'] != null){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => findPro(context,searchResult)),
                                  );
                                }else if(searchResult['data'] == null){
                                  FlutterDialog();
                                }
                              },
                            ),
                            hintText: '검색 내용을 입력해주세요.',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: AppColors.grey100)
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
                child: Row(
                  children: [
                    Flexible(
                      flex: 2,
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.048),
                          child: Text('카테고리',
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height * 0.025,
                              fontWeight: FontWeight.w700,
                            ),),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      child: Container(),
                    ),
                  ],
                )
            ),
          ),
          Flexible(
            flex: 2,
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    child: Padding(
                      padding:EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.04,
                          right: MediaQuery.of(context).size.width * 0.03
                      ),
                      child: Center(
                        child: Container(
                          child: Card(
                            color: AppColors.thirdColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            child: Column(
                              children: [
                                Flexible(
                                  flex: 2,
                                  child: Row(
                                    children: [
                                      Flexible(
                                        flex: 2,
                                        child: Container(
                                          child: Center(
                                            child: Text("과일",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                                fontSize: MediaQuery.of(context).size.height * 0.025,
                                              ),),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 3,
                                        child: Container(),
                                      ),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  flex: 3,
                                  child: Container(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    child: Padding(
                      padding:EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.04,
                          left: MediaQuery.of(context).size.width * 0.03
                      ),
                      child: Center(
                        child: Container(
                          child: Card(
                            color: AppColors.roamSelectedNavTitle,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            child: Column(
                              children: [
                                Flexible(
                                  flex: 2,
                                  child: Row(
                                    children: [
                                      Flexible(
                                        flex: 2,
                                        child: Container(
                                          child: Center(
                                            child: Text("채소",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                                fontSize: MediaQuery.of(context).size.height * 0.025,
                                              ),),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 3,
                                        child: Container(),
                                      ),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  flex: 3,
                                  child: Container(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  flex: 1,
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
                child: Row(
                  children: [
                    Flexible(
                      flex: 2,
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.048),
                          child: Text('키워드',
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height * 0.025,
                              fontWeight: FontWeight.w700,
                            ),),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      child: Container(),
                    ),
                  ],
                )
            ),
          ),
          Flexible(
            flex: 7,
            child: Container(
              child: Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.04,
                    right: MediaQuery.of(context).size.width * 0.04,
                ),
                child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 7 / 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20),
                    itemCount: myProducts.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: AppColors.secondaryColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: ListTile(
                          title: Text(myProducts[index]["name"].toString(),
                          style: TextStyle(
                            color: Colors.white
                          ),
                          ),
                          trailing: Icon(Icons.navigate_next,
                          color: Colors.white,),
                        ),
                      );
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget findPro(BuildContext context, searchResult){
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        title: Row(
          children: [
            Flexible(
              flex: 1,
              child: Container(),
            ),
            Flexible(
              flex: 5,
              child: Text('LevelUpToast',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
      //body: Text(searchResult['data']['SearchProduct'].toString()),
      body:Column(
        children: [
          Flexible(
            flex: 2,
            child: Card(
              elevation: 0,
              color: AppColors.grey100,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Row(
                  children: [
                    Flexible(
                      flex: 6,
                      child: Container(
                        child: TextField(
                          onEditingComplete:() async{
                            searchResult = await Api().searchApi(myController.value.text);
                            print(searchResult);
                            if (searchResult['data'] != null){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => findPro(context,searchResult)),
                              );
                            }else if(searchResult['data'] == null){
                              FlutterDialog();
                            }
                          },
                          controller: myController,
                          decoration: InputDecoration(
                            suffixIcon:IconButton(
                              color: Colors.black,
                              icon: Icon(Icons.search),
                              onPressed: () async{
                                searchResult = await Api().searchApi(myController.value.text);
                                print(searchResult);
                                if (searchResult['data'] != null){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => findPro(context,searchResult)),
                                  );
                                }else if(searchResult['data'] == null){
                                  FlutterDialog();
                                }
                              },
                            ),
                            hintText: '검색 내용을 입력해주세요.',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: AppColors.grey100)
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            flex: 10,
            child: ListView.builder(
              itemCount: searchResult['data']['SearchProduct'].length,
              itemBuilder: (context, index){
                return GestureDetector(
                  onTap: () async {
                    currentPage.addPage(searchResult['data']['SearchProduct'][index]);
                    if(0 == await Api().productDetail(searchResult['data']['SearchProduct'][index]["productSeq"])){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProductDetailScreen()),
                      );
                    }
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: Padding(
                      padding:EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.03),
                      child: Card(
                        elevation: 0,
                        shadowColor: Colors.white,
                        child: Row(
                          children: [
                            Flexible(
                              flex:1,
                              child: Container(
                                height: MediaQuery.of(context).size.height * 0.2,
                                width: MediaQuery.of(context).size.height * 0.4,
                                child: Padding(
                                  padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.03),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                          imagePath+searchResult['data']['SearchProduct'][index]['initialImgUrl'][1].toString()
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              flex : 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: Container(
                                      color: Colors.white,
                                      child: Text(searchResult['data']['SearchProduct'][index]['title'],
                                        style: TextStyle(
                                            color: AppColors.grey550,
                                            fontSize: MediaQuery.of(context).size.height * 0.025
                                        ),),
                                    ),
                                  ),
                                  Flexible(
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Container(
                                            height: MediaQuery.of(context).size.height * 0.03,
                                            width: MediaQuery.of(context).size.height * 0.08,
                                            child: Card(
                                              color: AppColors.thirdColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10.0),
                                              ),
                                              child: Center(
                                                child: Text(searchResult['data']['SearchProduct'][index]['tag'],
                                                  style: TextStyle(
                                                      fontSize: MediaQuery.of(context).size.width * 0.02,
                                                      color: Colors.white),),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
                                  Flexible(
                                      child: Row(
                                        children: [
                                          Text((percentage(searchResult['data']['SearchProduct'][index]['funding']['currentAmount'],
                                              searchResult['data']['SearchProduct'][index]['funding']['finalAmount'])*100).toString()+"% 완료",
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontSize: MediaQuery.of(context).size.height * 0.018,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          SizedBox(width: MediaQuery.of(context).size.width * 0.18,),
                                          Text("종료까지 xxx남음",
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context).size.width * 0.03,
                                                color: Colors.grey
                                            ),),
                                        ],
                                      )
                                  ),
                                  Flexible(
                                    child: LinearPercentIndicator(
                                      width: MediaQuery.of(context).size.width * 0.62,
                                      lineHeight: MediaQuery.of(context).size.height * 0.018,
                                      percent: percentage(searchResult['data']['SearchProduct'][index]['funding']['currentAmount'],
                                          searchResult['data']['SearchProduct'][index]['funding']['finalAmount']),
                                      progressColor: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
          ),
        ],
      )
    );
  }

  void FlutterDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            title: Column(
              children: <Widget>[
                new Text("검색 에러"),
              ],
            ),
            //
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "검색어에대한 물품을 찾을 수 없습니다.",
                ),
              ],
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text("확인"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

}


