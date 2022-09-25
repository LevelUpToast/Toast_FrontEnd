import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                          width: 30,
                        ),
                        Flexible(
                            flex:3,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: const BorderRadius.all( Radius.circular(60.0))
                              ),
                              child: Container(
                                width: 90,
                              ),
                            ),
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
                                    fontSize: 30,
                                  ),
                                  ),
                                ),
                                Flexible(
                                  flex:1,
                                  child: Text(" 김준범 님",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                ),
                SizedBox(height: 25),
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
                                      child: IconButton(
                                        onPressed: (){},
                                        color: Colors.green,
                                        icon: Icon(
                                          Icons.add_shopping_cart,
                                          size: 40,
                                        ),
                                      ),
                                    )),
                                SizedBox(height: 10,),
                                Flexible(
                                    child: Text(
                                      "펀딩한 상품",
                                      style: TextStyle(
                                        fontSize: 15,
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
                                        child: IconButton(
                                          onPressed: (){},
                                          color: Colors.green,
                                          icon: Icon(
                                              Icons.monetization_on,
                                            size: 40,
                                          ),
                                        ),
                                      )),
                                  SizedBox(height: 10,),
                                  Flexible(
                                      child: Text(
                                          "ToastPay",
                                        style: TextStyle(
                                            fontSize: 15,
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
                                        child: IconButton(
                                          onPressed: (){},
                                          color: Colors.green,
                                          icon: Icon(
                                              Icons.people,
                                            size: 40,
                                          ),
                                        ),
                                      )),
                                  SizedBox(height: 10,),
                                  Flexible(
                                      child: Text(
                                          "고객센터",
                                        style: TextStyle(
                                          fontSize: 15,
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
                  height: 10,
                ),
                Flexible(
                  flex:1,
                    child: Row(
                      children: [
                        SizedBox(width: 15,),
                        Container(
                          child: Text("최근 본 제품",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w600
                            ),),
                        )
                      ],
                    )),
                Flexible(
                  flex: 3,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _currentpage.length,
                        itemBuilder: (context, index){
                          return GestureDetector(
                            onTap: (){
                              //currentPage.addPage(currentPage.page);
                              //print(currentPage.page);
                            },
                            child: Card(
                                elevation: 0,
                                // shape: RoundedRectangleBorder(
                                //   borderRadius: const BorderRadius.all(Radius.circular(23)),
                                // ),
                                child:Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      flex: 2,
                                      child: Container(
                                        height: 150,
                                        width: 150,
                                        child: Card(
                                          elevation: 1,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: const BorderRadius.all( Radius.circular(23.0))
                                          ),
                                          child: Image(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                                imagePath+_currentpage[index]['initialImgUrl'][1].toString()
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Flexible(
                                                child: Container(
                                                  child: Center(
                                                    child: Text(_currentpage[index]['title'].toString()),
                                                  ),
                                                )),
                                            SizedBox(
                                              height: 30,
                                            ),
                                            Flexible(
                                              child: Container(
                                                child: Text(
                                                  percentage(_currentpage[index]['funding']['currentAmount'],
                                                      _currentpage[index]['funding']['finalAmount']),
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
                     height: 50,
                     child: Row(
                       children: [
                         SizedBox(width: 30,),
                         Text(" 공지사항",
                         style: TextStyle(
                           fontSize: 20,
                           fontWeight: FontWeight.bold,
                         ),),
                         SizedBox(width: 270),
                         IconButton(
                             onPressed: (){},
                            color:Colors.black,
                             icon: Icon(
                               Icons.navigate_next,
                               size:30 ,
                             ),
                         ),
                       ],
                     ),
                   ),
                   Container(
                     height: 50,
                     child: Row(
                       children: [
                         SizedBox(width: 30,),
                         Text(" 이용안내",
                           style: TextStyle(
                             fontSize: 20,
                             fontWeight: FontWeight.bold,
                           ),),
                         SizedBox(width: 270),
                         IconButton(
                           onPressed: (){},
                           color:Colors.black,
                           icon: Icon(
                             Icons.navigate_next,
                             size:30 ,
                           ),
                         ),
                       ],
                     ),
                   ),
                   Container(
                     height: 50,
                     child: Row(
                       children: [
                         SizedBox(width: 30,),
                         Text(" LevelUpToast안내",
                           style: TextStyle(
                             fontSize: 20,
                             fontWeight: FontWeight.bold,
                           ),),
                         SizedBox(width: 170),
                         IconButton(
                           onPressed: (){},
                           color:Colors.black,
                           icon: Icon(
                             Icons.navigate_next,
                             size:30 ,
                           ),
                         ),
                       ],
                     ),
                   ),
                   Container(
                     height: 50,
                     child: Row(
                       children: [
                         SizedBox(width: 30,),
                         Text(" 로그아웃",
                           style: TextStyle(
                             color: Colors.red,
                             fontSize: 20,
                             fontWeight: FontWeight.bold,
                           ),),
                         SizedBox(width: 270),
                         IconButton(
                           onPressed: (){},
                           color:Colors.black,
                           icon: Icon(
                             Icons.navigate_next,
                             size:30 ,
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
