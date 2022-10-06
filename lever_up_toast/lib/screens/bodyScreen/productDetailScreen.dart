// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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

  double percentage(int currentAmount,int finalAmount){
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
              child: Text('     LevelUpToast',
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
            height: MediaQuery.of(context).size.height * 0.21,
            child: Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width *0.04,
                right: MediaQuery.of(context).size.width *0.04,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height *0.045,
                    width:MediaQuery.of(context).size.width* 0.255,
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
                  Container(
                    child: Text(Data['data']["Product"]['title'],
                      style:TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.06,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height* 0.004,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.06,
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
                                  width: MediaQuery.of(context).size.width * 0.5,
                                ),
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
                              width: MediaQuery.of(context).size.width * 0.9,
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
                  Container(
                    height: MediaQuery.of(context).size.height * 0.06,
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
                                width: MediaQuery.of(context).size.width * 0.05),
                            Text("목표금액",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: MediaQuery.of(context).size.height * 0.018
                              ),),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.5),
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
                ],
              ),
            )
          ), //제목,퍼센트,종료일시,테그
          Container(
            color: AppColors.grey,
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.11,
            child: Row(
              children: [
                Flexible(
                  flex:2,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width *0.04,
                        right: MediaQuery.of(context).size.width *0.04,
                          top: MediaQuery.of(context).size.height *0.014,
                        bottom: MediaQuery.of(context).size.height *0.014,
                      ),
                      child: Container(
                        color: Colors.white,
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.18,
                        child: GestureDetector(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  imagePath+Data['data']['vendorInfo']['vendorProfileImg']
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                ),
                Flexible(
                  flex: 4,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height *0.014,
                        bottom: MediaQuery.of(context).size.height *0.014,
                      ),
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height *0.008,),
                            Container(
                              child: Text(Data['data']['vendorInfo']['vendorName'],
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height *0.023,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height *0.007,
                            ),
                            Container(
                              child: Text(Data['data']['vendorInfo']['vendorIntroduction'],
                              style: TextStyle(
                                fontSize: MediaQuery.of(context).size.height *0.0175,
                              ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ),
              ],
            ),
          ), //제공자 정보
          Container(
            color: AppColors.grey,
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
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
                          borderRadius: BorderRadius.circular(0),
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width *0.04,
                              right: MediaQuery.of(context).size.width *0.04,
                            ),
                            child: Image(
                              height: MediaQuery.of(context).size.height * 0.2,
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  imagePath+image[imageCount++].trim()
                              ),
                            ),
                          ),
                        ):
                        Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width *0.04,
                            right: MediaQuery.of(context).size.width *0.04,
                            top: MediaQuery.of(context).size.height * 0.032,
                          ),
                          child: Container(
                            child:Text(parse[index].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: MediaQuery.of(context).size.height * 0.02
                              ),
                            ),
                          ),
                        ),
                    ),
                  );
                },
            ),
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
                                ),
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
                                ),
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
                                ),
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
                                ),
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
          Padding(
            padding: EdgeInsets.only(
              right: MediaQuery.of(context).size.width * 0.04,
              left: MediaQuery.of(context).size.width * 0.04,
            ),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.65,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height *0.01,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height *0.3,
                    child: Column(
                      children: [
                        Flexible(
                          flex:1,
                          child: Row(
                            children: [
                              SizedBox(width: MediaQuery.of(context).size.width * 0.04,),
                              Container(
                                child: Text("이런 상품도 있어요",
                                  style: TextStyle(
                                      color: AppColors.grey500,
                                      fontSize: MediaQuery.of(context).size.height * 0.026,
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 3,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: Data['data']['recommendedProducts'].length,
                            itemBuilder: (context, index){
                              return GestureDetector(
                                onTap: () async {
                                  print(_currentpage[index]);
                                  currentPage.addPage(Data['data']['recommendedProducts'][index]);
                                  if(0 == await Api().productDetail(Data['data']['recommendedProducts'][index]["productSeq"])){
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
                                            width: MediaQuery.of(context).size.width*0.4,
                                            child: Padding(
                                              padding:EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(15),
                                                child: Image(
                                                  fit: BoxFit.fill,
                                                  image: NetworkImage(
                                                      imagePath+Data['data']['recommendedProducts'][index]["initialImgUrl"][1].toString()
                                                  ),
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
                                                  ),
                                                ),
                                              ),
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
                                          ),
                                        ),
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
                  Container(
                    height: MediaQuery.of(context).size.height *0.3,
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
                                      color: AppColors.grey500,
                                      fontSize: MediaQuery.of(context).size.height * 0.026,
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                              ),
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
                                            width: MediaQuery.of(context).size.width*0.4,
                                            child: Padding(
                                              padding:EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(15),
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
                                                  ),
                                                ),
                                              ),
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
                                          ),
                                        ),
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
                ],
              ),
            ),
          ), //최근 본 상품
        ],
      ),
        persistentFooterButtons:[
          RatingBar(
              itemSize: MediaQuery.of(context).size.height * 0.04,
              initialRating: 0,
              direction: Axis.horizontal,
              //allowHalfRating: true,
              itemCount: 1,
              ratingWidget: RatingWidget(
                  full:  ClipRRect(
                    child: SvgPicture.asset("assets/img/H.svg"),
                  ),
                  half: ClipRRect(
                    child: SvgPicture.asset("assets/img/EmptyH.svg"),
                  ),
                  empty:  ClipRRect(
                    child: SvgPicture.asset("assets/img/EmptyH.svg"),
                    ),

              ),
              onRatingUpdate: (value) {
                setState(() {
                  wish = value.toInt();
                },);
                print(value);
              },
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.03,
          ),
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
              ),
              ),
            ),
          ),
        ),
        ]
    );
  }
}
