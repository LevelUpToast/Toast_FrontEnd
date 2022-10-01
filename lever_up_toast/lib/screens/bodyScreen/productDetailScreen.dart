// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:lever_up_toast/API/apiInfo.dart';
import 'package:lever_up_toast/values/values.dart';
import 'package:lever_up_toast/values/currentPage.dart';
import 'package:lever_up_toast/API/api.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

class ProductDetailScreen extends StatefulWidget {
  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {

  double  percentage(int currentAmount,int finalAmount){
    double result = 0 ;
    result = (currentAmount/finalAmount);
    return result;
  }
  String pop(images){
    return images;
  }
  String imagePath = ApiInfo.testUrl+ApiInfo.imageUrl;
  Map<String,dynamic> Data = Api.productData;
  var images = Api.productData['data']['Product']['productInfo']['productImgUrl'];
  //List<String> image = images.toString().substring(1,images.toString().length -1).split(",");
  List<Map<String,dynamic>> _currentpage = currentPage.getPage();
  List<String> parse = Api.productData['data']['Product']['productInfo']['text'].toString().trim().split("\n");
  @override
  Widget build(BuildContext context) {
    int wish = 0;
    int imageCount = 0;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            child: Swiper(
              duration: 1200,
              pagination: new SwiperPagination(
                alignment: Alignment.bottomCenter,
                builder: new DotSwiperPaginationBuilder(
                    color: Colors.grey, activeColor: Colors.black),
              ),
                control: new SwiperControl(
                  color: Colors.grey,
                ),
              autoplay: true,
              itemCount: Data['data']["Product"]['initialImgUrl'].length,
              itemBuilder: (context ,index) {
                return Image(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      imagePath+Data['data']["Product"]['initialImgUrl'][index].toString()),
                );
              },
            ),
          ), // 배너
          Container(
            //color: Colors.grey,
            height: MediaQuery.of(context).size.height * 0.2,
            child: Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width *0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Container(
                      width:MediaQuery.of(context).size.width* 0.2,
                      child: Card(
                        color: AppColors.thirdColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                          child: Text(Data['data']['Product']['tag'],
                            style: TextStyle(
                                fontSize: MediaQuery.of(context).size.width *0.03,
                                color: Colors.white),),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      child: Text(Data['data']["Product"]['title'],
                        style:TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.08,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.01,
                              right: MediaQuery.of(context).size.width * 0.01,
                            ),
                            child:Container(
                              child: Row(
                                children: [
                                  Text(Data['data']['Product']['funding']['currentAmount'].toString()+"원",
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: MediaQuery.of(context).size.width * 0.05,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.56,
                                  ),
                                  //Data['data']['Product']['funding']['deadline']
                                  //Text(DateFormat('yyyy-MM-dd').format(DateTime.now())+"-" +Data['data']['Product']['funding']['deadline']),
                                  Text("종료까지"+((DateTime.now().difference(DateTime.parse(Data['data']['Product']['funding']['deadline'])).inDays) * -1).toString()+"일",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Container(
                              child: LinearPercentIndicator(
                                backgroundColor: AppColors.grey300,
                                width: MediaQuery.of(context).size.width * 0.95,
                                lineHeight: MediaQuery.of(context).size.height * 0.02,
                                percent: percentage(Data['data']['Product']['funding']['currentAmount'],
                                    Data['data']['Product']['funding']['finalAmount']),
                                progressColor: AppColors.thirdColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        color: AppColors.secondaryColor,
                        elevation: 1,
                        child: Container(
                          child: Row(
                            children: [
                              SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.03),
                              Text("목표금액",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: MediaQuery.of(context).size.height * 0.018
                                ),),
                              SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.6),
                              Text(Data['data']['Product']['funding']['finalAmount'].toString()+"원",
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height * 0.018,
                                  fontWeight: FontWeight.bold,
                                ),),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ), //제목,퍼센트,종료일시,테그
          Container(
            color: AppColors.grey,
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            child: Row(
              children: [
                Flexible(
                  flex:2,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 5,
                          top: 5,
                        bottom: 5,
                      ),
                      child: Container(
                        color: Colors.white,
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: Card(
                          elevation: 0,
                          color: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(150.0),
                          ),
                        ),
                      ),
                    )
                ),
                Flexible(
                  flex: 4,
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Flexible(
                              child: Container(),
                          ),
                          Flexible(
                            child: Container(),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ), //제공자 정보
          Container(
            color: AppColors.grey,
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.8,
            child: ListView.builder(
              itemCount: parse.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index){
                List<String> image = images.toString().substring(1,images.toString().length -1).split(",");
                  return Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.02,
                        right: MediaQuery.of(context).size.width * 0.02,
                      ),
                    child: Container(
                      //height: MediaQuery.of(context).size.height * 0.1,
                        child:(parse[index].contains("<img"))?
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image(
                            height: MediaQuery.of(context).size.height * 0.2,
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                imagePath+image[imageCount++].trim()
                            ),
                          ),
                        ):
                        Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.032,
                          ),
                          child: Container(
                            child:Text(parse[index],
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: MediaQuery.of(context).size.height * 0.02
                              ),),
                          ),
                        )
                    ),
                  );
                }),
          ), //본문 내용
          Container(
            color: AppColors.grey,
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            child: Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height *0.01,
                left: MediaQuery.of(context).size.width * 0.07,
                right: MediaQuery.of(context).size.width * 0.07,
                bottom: MediaQuery.of(context).size.height *0.01,
              ),
              child: Card(
                color: AppColors.grey100,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    Container(
                      width:MediaQuery.of(context).size.width * 0.4,
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          Text("3.5/5",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.height * 0.034
                          ),
                          ),
                          Text("판매자 리뷰",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                          Container(
                            //height: MediaQuery.of(context).size.height * 0.2,
                            // child:  RatingBar(
                            //   itemSize: MediaQuery.of(context).size.height * 0.025,
                            //     initialRating: 0,
                            //     direction: Axis.horizontal,
                            //     allowHalfRating: true,
                            //     itemCount: 5,
                            //     ratingWidget: RatingWidget(
                            //         full:  Icon(Icons.star, color: Colors.orange),
                            //         half:  Icon(
                            //           Icons.star_half,
                            //           color: Colors.orange,
                            //         ),
                            //         empty:  Icon(
                            //           Icons.star_outline,
                            //           color: Colors.orange,
                            //         )),
                            //     onRatingUpdate: (value) {
                            //       setState(() {
                            //         //_ratingValue = value;
                            //       });
                            //     }),
                            child:RatingBarIndicator(
                              rating: 3.5,
                              itemBuilder: (context, index) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              itemCount: 5,
                              itemSize: MediaQuery.of(context).size.height * 0.025,
                              direction: Axis.horizontal,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width:MediaQuery.of(context).size.width * 0.4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.015,
                          ),
                          Container(
                            child: Row(
                              children: [
                                Text("5점",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.grey550,
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.02,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Container(
                                    child: LinearPercentIndicator(
                                      backgroundColor: AppColors.white,
                                      width: MediaQuery.of(context).size.width * 0.29,
                                      lineHeight: MediaQuery.of(context).size.height * 0.02,
                                      percent: percentage(Data['data']['Product']['funding']['currentAmount'],
                                          Data['data']['Product']['funding']['finalAmount']),
                                      progressColor: AppColors.dropAppLogo,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Container(
                            child: Row(
                              children: [
                                Text("4점",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.grey550,
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.02,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Container(
                                    child: LinearPercentIndicator(
                                      backgroundColor: AppColors.white,
                                      width: MediaQuery.of(context).size.width * 0.29,
                                      lineHeight: MediaQuery.of(context).size.height * 0.02,
                                      percent: percentage(Data['data']['Product']['funding']['currentAmount'],
                                          Data['data']['Product']['funding']['finalAmount']),
                                      progressColor: AppColors.dropAppLogo,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Container(
                            child: Row(
                              children: [
                                Text("3점",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.grey550,
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.02,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Container(
                                    child: LinearPercentIndicator(
                                      backgroundColor: AppColors.white,
                                      width: MediaQuery.of(context).size.width * 0.29,
                                      lineHeight: MediaQuery.of(context).size.height * 0.02,
                                      percent: percentage(Data['data']['Product']['funding']['currentAmount'],
                                          Data['data']['Product']['funding']['finalAmount']),
                                      progressColor: AppColors.dropAppLogo,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Container(
                            child: Row(
                              children: [
                                Text("2점",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.grey550,
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.02,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Container(
                                    child: LinearPercentIndicator(
                                      backgroundColor: AppColors.white,
                                      width: MediaQuery.of(context).size.width * 0.29,
                                      lineHeight: MediaQuery.of(context).size.height * 0.02,
                                      percent: percentage(Data['data']['Product']['funding']['currentAmount'],
                                          Data['data']['Product']['funding']['finalAmount']),
                                      progressColor: AppColors.dropAppLogo,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Container(
                            child: Row(
                              children: [
                                Text("1점",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.grey550,
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.02,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Container(
                                    child: LinearPercentIndicator(
                                      backgroundColor: AppColors.white,
                                      width: MediaQuery.of(context).size.width * 0.29,
                                      lineHeight: MediaQuery.of(context).size.height * 0.02,
                                      percent: percentage(Data['data']['Product']['funding']['currentAmount'],
                                          Data['data']['Product']['funding']['finalAmount']),
                                      progressColor: AppColors.dropAppLogo,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //color: Colors.green,
          ), //상품 평
          Container(
            height: MediaQuery.of(context).size.height * 0.6,
            child: Column(
              children: [
                Flexible(
                    child: Container(
                      //color: Colors.blueGrey,
                    ),
                ),
                Flexible(
                    child: Container(
                      child: Column(
                        children: [
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
                                                    child: Container(
                                                        child: Padding(
                                                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02),
                                                          child: Center(
                                                            child: Text(_currentpage[index]['title'].toString(),
                                                              style: TextStyle(
                                                                color: Colors.grey,
                                                                fontSize: MediaQuery.of(context).size.height*0.02,
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                    ),
                                                  ),
                                                  // SizedBox(
                                                  //   height: 30,
                                                  // ),
                                                  Flexible(
                                                    child: Container(
                                                        child: Padding(
                                                          padding:EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02),
                                                          child:  Text(
                                                            (percentage(_currentpage[index]['funding']['currentAmount'],
                                                                _currentpage[index]['funding']['finalAmount'])*100.0).toString()+"%",
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
                ),
              ],
            ),
          ), //최근 본 상품
        ],
      ),
        persistentFooterButtons:[
          RatingBar(
              itemSize: MediaQuery.of(context).size.height * 0.04,
              initialRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 1,
              ratingWidget: RatingWidget(
                  full:  Icon(
                      Icons.local_hospital,
                      color: Colors.orange),
                  half:  Icon(
                    Icons.local_hospital_outlined,
                    color: Colors.orange,
                  ),
                  empty:  Icon(
                    Icons.local_hospital_outlined,
                    color: Colors.orange,
                  )),
              onRatingUpdate: (value) {
                setState(() {
                  wish = value.toInt();
                });
                print(value);
              }),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.03),
          Container(
          height: MediaQuery.of(context).size.height * 0.05,
          width: MediaQuery.of(context).size.width * 0.74,
          child: Padding(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:  MaterialStateProperty.all<Color>(AppColors.secondaryColor)
              ),
              onPressed: () { // Respond to button press
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: new Icon(Icons.photo),
                            title: new Text('1'),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            leading: new Icon(Icons.music_note),
                            title: new Text('2'),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            leading: new Icon(Icons.videocam),
                            title: new Text('3'),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            leading: new Icon(Icons.share),
                            title: new Text('4'),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    });
              },
              child: Text('구매하기',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: MediaQuery.of(context).size.width * 0.04,
                color: Colors.white
              ),), ),
          ),
        ),
        ]
    );
  }
}
