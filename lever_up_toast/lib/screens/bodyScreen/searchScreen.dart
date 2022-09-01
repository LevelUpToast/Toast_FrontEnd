// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';


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
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(
                width: 350,
                child: Row(
                  children: [
                    Flexible(
                      flex: 6,
                      child: Container(),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        child: IconButton(
                          onPressed: (){
                            print("눌림");
                          },
                          color: Colors.black,
                          icon: Icon(
                            Icons.search
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

}
