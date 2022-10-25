// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lever_up_toast/API/api.dart';

class ToastPayScreen extends StatefulWidget {
  const ToastPayScreen({Key? key}) : super(key: key);

  @override
  _ToastPayScreenState createState() => _ToastPayScreenState();
}

class _ToastPayScreenState extends State<ToastPayScreen> {
  @override
  Widget build(BuildContext context) {
    Map toastPay =    {
      "payName": "ToastPay",
      "payCheck": "100,000",
      "color": Color(0xFF4C7241)
    };
    List payment = [
      {"card": "VISA", "cardNum": "1234-1234-1234-1234", "color": Colors.blue},
      {"card": "VISA", "cardNum": "1234-1234-1234-1234", "color": Colors.cyan},
    ];

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: InkWell(
                child: const Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                onTap: () => Navigator.pushReplacementNamed(context, '/home'),
              ),
            ),
          ],
          elevation: 0,
          title: const Text(
            'LevelUpToast',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
        ),
        body: Container(
          child: ListView(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.95,
                height: MediaQuery.of(context).size.height * 0.3,
                child: Card(
                  color: toastPay['color'],
                  child: Stack(
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(toastPay["payName"], style: TextStyle(color: Colors.white, fontSize: 24,fontWeight: FontWeight.w500),),
                                ),
                              ],
                            )
                          ],
                        ),
                        Column(
                          verticalDirection: VerticalDirection.up,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text( "잔액  "+ toastPay["payCheck"], style: TextStyle(color: Colors.white, fontSize: 24,fontWeight: FontWeight.w500),),
                                ),
                              ],
                            )
                          ],
                        ),
                      ]
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 1,
                color: Colors.white,
                child: Center(
                  child: ListView.builder(
                    itemCount: payment.length,
                    itemBuilder: (BuildContext ctx, int idx) {
                      return Container(
                        width: MediaQuery.of(context).size.width * 0.95,
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: Card(
                          color: payment[idx]['color'],
                          child: Stack(
                            children: [
                              Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(payment[idx]["card"], style: TextStyle(color: Colors.white, fontSize: 24,fontWeight: FontWeight.w500),),
                                    ),
                                  ],
                                )
                              ],
                            ),
                              Column(
                                verticalDirection: VerticalDirection.up,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(payment[idx]["cardNum"], style: TextStyle(color: Colors.white, fontSize: 24,fontWeight: FontWeight.w500),),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ]
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
