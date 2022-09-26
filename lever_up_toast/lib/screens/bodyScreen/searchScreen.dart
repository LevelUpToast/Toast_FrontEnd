// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lever_up_toast/API/api.dart';
import 'package:lever_up_toast/API/apiInfo.dart';
import 'package:lever_up_toast/values/values.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:percent_indicator/percent_indicator.dart';

class searchScreen extends StatefulWidget {
  const searchScreen({Key? key}) : super(key: key);
  @override
  _searchScreenState createState() => _searchScreenState();
}

class _searchScreenState extends State<searchScreen> {
  @override
  final List<Map> myProducts =
  List.generate(20, (index) => {"id": index, "name": "Product $index"})
      .toList();
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
            flex: 1,
            child: Card(
              color: Colors.white54,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Container(
                width: 350,
                child: Row(
                  children: [
                    Flexible(
                      flex: 6,
                      child: Container(
                        child: TextField(
                          controller: myController,
                          decoration: InputDecoration(
                            prefixIcon: IconButton(
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
                            hintText: '원하는 물품을 입력하시오',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(color: Colors.white54)
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
                          padding: EdgeInsets.only(left: 20),
                          child: Text('카테고리',
                            style: TextStyle(
                              fontSize: 20.0,
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
                  child: Container(
                    child: Center(
                      child: Container(
                        child: Card(
                          color: AppColors.thirdColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13.0),
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
                                              fontSize: 20,
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
                  flex: 1,
                ),
                Flexible(
                  child: Container(
                    child: Center(
                      child: Container(
                        child: Card(
                          color: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13.0),
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
                                              fontSize: 20,
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
                          padding: EdgeInsets.only(left: 20),
                          child: Text('키워드',
                            style: TextStyle(
                              fontSize: 20.0,
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
            flex: 6,
            child: Container(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 8 / 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20),
                    itemCount: myProducts.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(15)),
                        child: Text(myProducts[index]["name"]),
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
      body:ListView.builder(
          itemCount: searchResult['data']['SearchProduct'].length,
          itemBuilder: (context, index){
            return Container(
              height: 150,
              child: Padding(
                padding:EdgeInsets.only(left: 10),
                child: Card(
                  elevation: 0,
                  shadowColor: Colors.white,
                  child: Row(
                    children: [
                      Flexible(
                        flex:1,
                        child: Container(
                          height: 120,
                          width: 150,
                          child: Padding(
                            padding: EdgeInsets.only(right: 10),
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
                                      fontSize: 20
                                  ),),
                              ),
                            ),
                            Flexible(
                              child: Container(
                                child: Row(
                                  children: [
                                    Container(
                                      height: 70,
                                      width: 70,
                                      child: Card(
                                        color: AppColors.thirdColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        child: Center(
                                          child: Text(searchResult['data']['SearchProduct'][index]['tag'],
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.white),),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 35,),
                            Flexible(
                                child: Row(
                                  children: [
                                    Text((percentage(searchResult['data']['SearchProduct'][index]['funding']['currentAmount'],
                                        searchResult['data']['SearchProduct'][index]['funding']['finalAmount'])*100).toString()+"% 완료",
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    SizedBox(width: 90,),
                                    Text("종료까지 xxx남음",
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey
                                      ),),
                                  ],
                                )
                            ),
                            Flexible(
                              child: LinearPercentIndicator(
                                width: 270.0,
                                lineHeight: 15.0,
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
            );
          }),
    );
  }

  void FlutterDialog() {
    showDialog(
        context: context,
        //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            //Dialog Main Title
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


