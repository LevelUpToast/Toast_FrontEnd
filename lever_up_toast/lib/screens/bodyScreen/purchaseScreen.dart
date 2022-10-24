import 'package:flutter/material.dart';
import 'package:lever_up_toast/API/api.dart';
import 'package:lever_up_toast/API/apiInfo.dart';
import 'package:lever_up_toast/screens/bodyScreen/productDetailScreen.dart';
import 'package:lever_up_toast/values/values.dart';
import 'package:lever_up_toast/values/purchaseData.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:lever_up_toast/values/currentPage.dart';

class purchaseScreen extends StatefulWidget {
  const purchaseScreen({Key? key}) : super(key: key);

  @override
  _purchaseScreenState createState() => _purchaseScreenState();
}

class _purchaseScreenState extends State<purchaseScreen> {
  Map<String,dynamic> data = purchaseData.getPurchaseData();
  String imagePath = ApiInfo.testUrl+ApiInfo.imageUrl;
  String shippingAddress ="Loren ipsum dolor sot amet,consetur sadipscing deikit,sed";
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //print(data);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
        color: Colors.black,
        ),
        title: Row(
          children: [
            Flexible(
              flex: 1,
              child: Container(),
            ),
            Flexible(
              flex: 4,
              child: Text('     상품 구매',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
            left:MediaQuery.of(context).size.width * 0.00,
          right:MediaQuery.of(context).size.width * 0.00,
        ),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.01,
              color: AppColors.grey,
            ),//gray
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Padding(
                padding: EdgeInsets.only(
                  left:MediaQuery.of(context).size.width * 0.04,
                  right:MediaQuery.of(context).size.width * 0.04,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex:1,
                      child: ListTile(
                        contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                        trailing: Text(data['pay'].toString()+'원',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        title: Text("상퓸정보",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: MediaQuery.of(context).size.height * 0.02
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex:3,
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Flexible(
                                  flex:1,
                                  child: Padding(
                                    padding: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.01),
                                    child: Container(
                                      child: Card(
                                        elevation: 0,
                                        child: Container(
                                          height: MediaQuery.of(context).size.height * 0.124,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
                                            child: Image(
                                              fit: BoxFit.fill,
                                              image: NetworkImage(
                                                  imagePath+data["Image"].toString()),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ),
                                Flexible(
                                  flex:2,
                                  child: Container(
                                    //color: Colors.blueGrey,
                                    height: MediaQuery.of(context).size.height * 0.124,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(data['title'],
                                        style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                        ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context).size.height * 0.012,
                                        ),
                                        Text("Loren ipsum dolor sot amet,consetur sadipscing deikit,sed"),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ),//상퓸 정보
            Container(
              height: MediaQuery.of(context).size.height * 0.01,
              color: AppColors.grey,
            ),//gray
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Padding(
                padding: EdgeInsets.only(
                  left:MediaQuery.of(context).size.width * 0.04,
                  right:MediaQuery.of(context).size.width * 0.04,
                ),
                child: Column(
                  children: [
                    Flexible(
                      flex:2,
                      child: ListTile(
                        contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                        trailing: Card(
                          color: Colors.black,
                          child: Container(
                            height: 25,
                            width: 90,
                            child: ElevatedButton(
                              onPressed: (){
                                //TODO
                                shippingAddressDialog();
                              },
                                style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(0.0),
                                  backgroundColor: MaterialStateProperty.all(Color(0xFFFFFFFF)),
                                ),
                              child: Center(
                                child: Text("배송지변경",
                                  style: TextStyle(
                                      fontSize: 13
                                  ),),
                              )
                            ),
                          ),
                        ),
                        title: Text("상퓸정보",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: MediaQuery.of(context).size.height * 0.02
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex:4,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                           SizedBox(
                             height: MediaQuery.of(context).size.height * 0.01,
                           ),
                            Text("김준범"),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Text("010-4128-8503"),
                            Text(shippingAddress),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ),//배송지
            Container(
              height: MediaQuery.of(context).size.height * 0.01,
              color: AppColors.grey,
            ),//gray
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              child: Padding(
                padding: EdgeInsets.only(
                  left:MediaQuery.of(context).size.width * 0.04,
                  right:MediaQuery.of(context).size.width * 0.04,
                ),
                child: Column(
                  children: [
                    Flexible(
                      flex:4,
                      child: Container(
                        //color: Colors.green,
                        child: Row(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height *0.1,
                            ),
                            Container(
                              child: Text("결제 정보",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: MediaQuery.of(context).size.height * 0.02
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                        flex:11,
                        child: ListView.builder(
                            scrollDirection:Axis.horizontal,
                            itemCount: 2,
                            itemBuilder: (BuildContext context, int index){
                              return Row(
                                children: [
                                  GestureDetector(
                                    onTap:(){
                                      print(index);
                                      },
                                    child: Card(
                                      color: Color(0xFF007AFF),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(13.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: MediaQuery.of(context).size.width * 0.04
                                        ),
                                        child: Container(
                                          width: MediaQuery.of(context).size.width * 0.7,
                                          height: MediaQuery.of(context).size.height * 0.24,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: MediaQuery.of(context).size.height * 0.01,
                                              ),
                                              Text("Toast Pay",
                                                style: TextStyle(
                                                    fontSize: MediaQuery.of(context).size.height * 0.02,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white
                                                ),
                                              ),
                                              SizedBox(
                                                height: MediaQuery.of(context).size.height * 0.1,
                                              ),
                                              Text("잔액 ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: MediaQuery.of(context).size.height * 0.017,
                                                    color: Colors.white
                                                ),
                                              ),
                                              SizedBox(
                                                height: MediaQuery.of(context).size.height * 0.01,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.03,
                                  ),
                                ],
                              );
                            })
                    ),
                  ],
                ),
              )
            ),//결제 정보
            Container(
              height: MediaQuery.of(context).size.height * 0.077,
            ),//공백
            Container(
              height: MediaQuery.of(context).size.height * 0.06,
              child: Padding(
                padding: EdgeInsets.only(
                  right:MediaQuery.of(context).size.width * 0.04 ,
                  left:MediaQuery.of(context).size.width * 0.04,
                ),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color(0xFF007AFF)),
                  ),
                  onPressed: () {
                    FlutterDialog();
                  },
                  child: Container(
                    child: Center(
                      child: Text(data['pay'].toString()+"원 결제하기",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * 0.018,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                      ),
                    ),
                  )
                )
              ),
            ),//결제하기
          ],
        ),
      ),
    );
  }
  void shippingAddressDialog(){
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
                new Text("배송지를 입력해주세요"),
              ],
            ),
            content: TextField(
              controller: myController,
              decoration: InputDecoration(
                hintText: '예) 한누리대로 411,국립중앙박물관, 상암동 1595',
              ),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text("확인"),
                onPressed: () {
                  setState(() {
                    if(!myController.text.isEmpty){
                      shippingAddress = myController.text;
                    }
                  });
                  print(myController.text);
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
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
                new Text("결제 완료"),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "결제가 완료되었습니다.",
                ),
              ],
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text("확인"),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
}

