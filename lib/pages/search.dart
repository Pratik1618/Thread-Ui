import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:threadui/constants.dart';
import 'package:threadui/model/searchmodel.dart';
import 'package:threadui/pages/BottomTab.dart';

class searchPage extends StatefulWidget {
  const searchPage({super.key});

  @override
  State<searchPage> createState() => _searchPageState();
}

class _searchPageState extends State<searchPage> {
  CollectionReference _searchrefrence =
      FirebaseFirestore.instance.collection('search');
  late Stream<QuerySnapshot> _streamsearchdetails;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _streamsearchdetails = _searchrefrence.snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        bottomNavigationBar: bottomTabs(),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Search',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 5,
                      ),
                      height: 30,
                      decoration: BoxDecoration(
                          color: greyColor,
                          borderRadius: BorderRadius.circular(7)),
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        maxLines: 1,
                        showCursor: false,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 1, left: 1),
                            border: InputBorder.none,
                            isDense: true,
                            hintText: 'Search',
                            hintStyle: TextStyle(color: Colors.grey),
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: _streamsearchdetails,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.active) {
                      QuerySnapshot querySnapshot = snapshot.data;

                      List<SearchModel> SearchList = [];

                      for (var i = 0;
                          i < snapshot.requireData.docs.length;
                          i++) {
                        SearchList.add(SearchModel.fromMap(
                            snapshot.requireData.docs[i].data()));
                      }

                      var url =
                          'https://firebasestorage.googleapis.com/v0/b/thread-a40a3.appspot.com/o/kohli.jpg?alt=media&token=a1edea0d-10a5-4ee2-8c9f-fbd539458dbf';

                      print(SearchList[0].Sname);
                      return Expanded(
                        child: ListView.builder(
                            itemCount: SearchList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                decoration: BoxDecoration(
                                    // color: Colors.blue,
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 0.5, color: greyColor))),
                                padding: EdgeInsets.symmetric(
                                    vertical: 7, horizontal: 10),
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                        radius: 15,
                                        backgroundImage: AssetImage(
                                            'assets/images/zuck.jpg')),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  SearchList[index].Susername,
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                Container(
                                                    width: 80,
                                                    height: 30,
                                                    child: Center(
                                                      child: Text(
                                                        'Follow',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 15,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        border: Border.all(
                                                            color: Color(
                                                                0xff383838))))
                                              ],
                                            ),
                                            Text(
                                              SearchList[index].Sname,
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
