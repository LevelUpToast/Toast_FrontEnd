import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WishScreen extends StatefulWidget {
  const WishScreen({Key? key}) : super(key: key);
  @override
  _WishScreenState createState() => _WishScreenState();

}


class _WishScreenState extends State<WishScreen> with PreferredSizeWidget{
  @override
  Widget build(BuildContext context) {
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
                  itemCount: 10,
                  itemBuilder: (context, index){
                    return Container(
                      height: 150,
                      child: Card(
                        shadowColor: Colors.white,
                        child: Row(
                          children: [
                            Flexible(
                              flex:1,
                              child: Container(
                                child: Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Card(
                                    color: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Container(
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              flex : 2,
                              child: Column(
                                children: [
                                  Flexible(
                                    child: Container(
                                      color: Colors.green,
                                    ),
                                  ),
                                  Flexible(
                                    child: Container(
                                      color : Colors.tealAccent,
                                    ),
                                  ),
                                  Flexible(
                                    child: Container(
                                      color: Colors.red,
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
                  itemCount: 10,
                  itemBuilder: (context, index){
                    return Container(
                      height: 160,
                      child: Card(
                        shadowColor: Colors.white,
                        child: Row(
                          children: [
                            Flexible(
                              flex:1,
                              child: Container(
                                color: Colors.grey,
                              ),
                            ),
                            Flexible(
                              flex : 2,
                              child: Column(
                                children: [
                                  Flexible(
                                    child: Container(
                                      color: Colors.green,
                                    ),
                                  ),
                                  Flexible(
                                    child: Container(
                                      color : Colors.tealAccent,
                                    ),
                                  ),
                                  Flexible(
                                    child: Container(
                                      color: Colors.red,
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
