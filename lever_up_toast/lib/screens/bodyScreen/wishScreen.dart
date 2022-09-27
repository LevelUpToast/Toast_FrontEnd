// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lever_up_toast/values/currentPage.dart';
import 'package:lever_up_toast/API/apiInfo.dart';
import 'package:lever_up_toast/values/values.dart';
import 'package:percent_indicator/percent_indicator.dart';

class WishScreen extends StatefulWidget {
  const WishScreen({Key? key}) : super(key: key);
  @override
  _WishScreenState createState() => _WishScreenState();

}


class _WishScreenState extends State<WishScreen> with PreferredSizeWidget{
  double  percentage(int currentAmount,int finalAmount){
    double result = 0 ;
    result = (currentAmount/finalAmount);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    String imagePath = ApiInfo.testUrl+ApiInfo.imageUrl;
    List<Map<String,dynamic>> _currentpage = currentPage.getPage();
    return DefaultTabController(
      length: 2,
      child: MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: Container(
                alignment: Alignment.topLeft,
                child: TabBar(
                  indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.black,
                      ),
                      insets: EdgeInsets.only(
                          left: 0,
                          right: 8,
                          bottom: 4)
                  ),
                  isScrollable: true,
                  unselectedLabelColor: Colors.black,
                  unselectedLabelStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                  indicatorWeight: 3.0,
                  indicatorColor: Colors.black,
                  labelColor: Colors.black,
                  labelStyle:TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 20
                  ),
                  onTap: (index) {
                    // Tab index when user select it, it start from zero
                  },
                  tabs: [
                    Tab(
                      text: "찜목록",
                    ),
                    Tab(
                      text: "최근 본 상품",
                    ),
                  ],
                ),
              )
            ),
            title: Text('LevelUpToast',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          body: TabBarView(
            children: [
              ListView.builder(
                  itemCount: 0,
                  itemBuilder: (context, index){
                    return Container(
                      height: 150,
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
                                          imagePath+_currentpage[index]['initialImgUrl'][0].toString()
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
                                      child: Text(_currentpage[index]['title'],
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
                                                child: Text(_currentpage[index]['tag'],
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
                                        Text((percentage(_currentpage[index]['funding']['currentAmount'],
                                            _currentpage[index]['funding']['finalAmount'])*100).toString()+"% 완료",
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
                                      width: 280.0,
                                      lineHeight: 15.0,
                                      percent: percentage(_currentpage[index]['funding']['currentAmount'],
                                          _currentpage[index]['funding']['finalAmount']),
                                      progressColor: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
              ListView.builder(
                  itemCount: _currentpage.length,
                  itemBuilder: (context, index){
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: Padding(
                        padding:EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.025),
                        child: Card(
                          elevation: 0,
                          shadowColor: Colors.white,
                          child: Row(
                            children: [
                              Flexible(
                                flex:1,
                                child: Container(
                                  height: MediaQuery.of(context).size.height * 0.2,
                                  width: MediaQuery.of(context).size.width * 0.5,
                                  child: Padding(
                                    padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.025),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                            imagePath+_currentpage[index]['initialImgUrl'][1].toString()
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
                                        child: Text(_currentpage[index]['title'],
                                          style: TextStyle(
                                              color: AppColors.grey550,
                                              fontSize: MediaQuery.of(context).size.height * 0.023
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
                                                  child: Text(_currentpage[index]['tag'],
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
                                            Text((percentage(_currentpage[index]['funding']['currentAmount'],
                                                _currentpage[index]['funding']['finalAmount'])*100).toString()+"% 완료",
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
                                        percent: percentage(_currentpage[index]['funding']['currentAmount'],
                                            _currentpage[index]['funding']['finalAmount']),
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
            ],
          ),
        ),
      ),
    );
  }

  @override
  Element createElement() {
    // TODO: implement createElement
    throw UnimplementedError();
  }

  @override
  List<DiagnosticsNode> debugDescribeChildren() {
    // TODO: implement debugDescribeChildren
    throw UnimplementedError();
  }

  @override
  // TODO: implement key
  Key? get key => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();

  @override
  String toStringDeep({String prefixLineOne = '', String? prefixOtherLines, DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
    // TODO: implement toStringDeep
    throw UnimplementedError();
  }

  @override
  String toStringShallow({String joiner = ', ', DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
    // TODO: implement toStringShallow
    throw UnimplementedError();
  }
}
