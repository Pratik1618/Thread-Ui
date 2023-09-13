import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:threadui/constants.dart';
import 'package:threadui/model/usermode.dart';
import 'package:threadui/pages/BottomTab.dart';
import 'package:threadui/pages/reactionTab.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  CollectionReference _userreference =
      FirebaseFirestore.instance.collection('Users');
  late Stream<QuerySnapshot> _streamuserdetails;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _streamuserdetails = _userreference.snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: bottomTabs(),
        backgroundColor: Colors.black,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          title: Center(
            child: Image.asset(
              'assets/images/threadlogo.png',
              color: Colors.white,
              height: 30,
              width: 30,
            ),
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: _streamuserdetails,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }
            if (snapshot.connectionState == ConnectionState.active) {
              QuerySnapshot querySnapshot = snapshot.data;

              List<UserModel> UserList = [];
              // UserList.addAll();
              for (var i = 0; i < snapshot.requireData.docs.length; i++) {
                UserList.add(
                    UserModel.fromMap(snapshot.requireData.docs[i].data()));
              }

              print(UserList[0]);
              print(UserList[0].Name);
              print(UserList);
              // List(
              //     snapshot.requireData.docs.length,
              //     (index) => UserModel.fromJson(
              //         snapshot.requireData.docs[0].data().toString()));

              // print(snapshot.requireData.docs[0].data()['Text']);
              // print(snapshot.requireData.docs[0].data()['Name']);
              // print(
              //     UserModel.fromMap(snapshot.requireData.docs[0].data()).Name);

              // print(UserList[0]);
              return ListView.builder(
                  itemCount: UserList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return IntrinsicHeight(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        // height: 100,
                        decoration: BoxDecoration(
                            // color: Colors.blue,
                            border: Border(
                                bottom:
                                    BorderSide(width: 0.5, color: greyColor))),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage:
                                          AssetImage('assets/images/zuck.jpg'),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      UserList[index].Name,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Image.asset(
                                      'assets/images/tick.png',
                                      height: 13,
                                      width: 13,
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '14 h',
                                      style: TextStyle(
                                          color: greyColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Image.asset(
                                      'assets/images/3dots.png',
                                      color: Colors.white,
                                      height: 15,
                                      width: 15,
                                    )
                                  ],
                                )
                              ],
                            ),
                            IntrinsicHeight(
                                child: Container(
                                    padding: EdgeInsets.only(top: 10, left: 11),
                                    child: Row(
                                      children: [
                                        VerticalDivider(
                                          color: greyColor,
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  UserList[index].Text,
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                // Text(goat)
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Image.asset(
                                                'assets/images/kohli.jpg',
                                                height: 250),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            ReactionTab(),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              '44 replies 4,258 likes',
                                              style:
                                                  TextStyle(color: greyColor),
                                            )
                                          ],
                                        )
                                      ],
                                    )))
                          ],
                        ),
                      ),
                    );
                  });
            }
            return Center(child: CircularProgressIndicator());
          },

          // new comment to  undo till line no 349
          // child:
          //     ListView.builder(itemBuilder: (BuildContext context, int index) {
          //   return IntrinsicHeight(
          //     child: Container(
          //       padding: EdgeInsets.all(20),
          //       // height: 100,
          //       decoration: BoxDecoration(
          //           // color: Colors.blue,
          //           border: Border(
          //               bottom: BorderSide(width: 0.5, color: greyColor))),
          //       child: Column(
          //         children: [
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Row(
          //                 children: [
          //                   CircleAvatar(
          //                     backgroundImage:
          //                         AssetImage('assets/images/zuck.jpg'),
          //                   ),
          //                   SizedBox(
          //                     width: 15,
          //                   ),
          //                   Text(
          //                     'zuck',
          //                     style: TextStyle(color: Colors.white),
          //                   ),
          //                   SizedBox(
          //                     width: 5,
          //                   ),
          //                   Image.asset(
          //                     'assets/images/tick.png',
          //                     height: 13,
          //                     width: 13,
          //                   )
          //                 ],
          //               ),
          //               Row(
          //                 children: [
          //                   Text(
          //                     '14 h',
          //                     style: TextStyle(
          //                         color: greyColor,
          //                         fontWeight: FontWeight.bold,
          //                         fontSize: 15),
          //                   ),
          //                   SizedBox(
          //                     width: 15,
          //                   ),
          //                   Image.asset(
          //                     'assets/images/3dots.png',
          //                     color: Colors.white,
          //                     height: 15,
          //                     width: 15,
          //                   )
          //                 ],
          //               )
          //             ],
          //           ),
          //           IntrinsicHeight(
          //               child: Container(
          //                   padding: EdgeInsets.only(top: 10, left: 11),
          //                   child: Row(
          //                     children: [
          //                       VerticalDivider(
          //                         color: greyColor,
          //                       ),
          //                       SizedBox(
          //                         width: 15,
          //                       ),
          //                       Column(
          //                         crossAxisAlignment: CrossAxisAlignment.start,
          //                         mainAxisAlignment: MainAxisAlignment.start,
          //                         children: [
          //                           Row(
          //                             children: [
          //                               Text(
          //                                 'Kohli is Goat ',
          //                                 style: TextStyle(color: Colors.white),
          //                               ),
          //                               Text(goat)
          //                             ],
          //                           ),
          //                           SizedBox(
          //                             height: 10,
          //                           ),
          //                           Image.asset('assets/images/kohli.jpg',
          //                               height: 250),
          //                           SizedBox(
          //                             height: 15,
          //                           ),
          //                           ReactionTab(),
          //                           SizedBox(
          //                             height: 10,
          //                           ),
          //                           Text(
          //                             '44 replies 4,258 likes',
          //                             style: TextStyle(color: greyColor),
          //                           )
          //                           // Container(
          //                           //   width: 130,
          //                           //   // color: Colors.white,
          //                           //   child: Row(
          //                           //     mainAxisAlignment:
          //                           //         MainAxisAlignment.spaceBetween,
          //                           //     children: [
          //                           //       GestureDetector(
          //                           //         onTap: (){

          //                           //         }
          //                           //         ,
          //                           //         child: ImageIcon(
          //                           //           AssetImage(
          //                           //               'assets/images/heart.png'),
          //                           //           color: Colors.white,
          //                           //           size: 23,
          //                           //         ),
          //                           //       ),
          //                           //       ImageIcon(
          //                           //         AssetImage('assets/images/chat.png'),
          //                           //         color: Colors.white,
          //                           //         size: 27,
          //                           //       ),
          //                           //       ImageIcon(
          //                           //         AssetImage(
          //                           //             'assets/images/refresh.png'),
          //                           //         color: Colors.white,
          //                           //         size: 23,
          //                           //       ),
          //                           //       ImageIcon(
          //                           //         AssetImage('assets/images/send.png'),
          //                           //         color: Colors.white,
          //                           //         size: 23,
          //                           //       )
          //                           //     ],
          //                           //   ),
          //                           // )
          //                         ],
          //                       )
          //                     ],
          //                   )))
          //         ],
          //       ),
          //     ),
          //   );
          // }),
        )
        // ListView(
        //   children: [
        //     IntrinsicHeight(
        //       child: Container(
        //         padding: EdgeInsets.all(20),
        //         // height: 100,
        //         decoration: BoxDecoration(
        //             // color: Colors.blue,
        //             border:
        //                 Border(bottom: BorderSide(width: 1.5, color: greyColor))),
        //         child: Column(
        //           children: [
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               children: [
        //                 Row(
        //                   children: [
        //                     CircleAvatar(
        //                       backgroundImage:
        //                           AssetImage('assets/images/zuck.jpg'),
        //                     ),
        //                     SizedBox(
        //                       width: 15,
        //                     ),
        //                     Text(
        //                       'zuck',
        //                       style: TextStyle(color: Colors.white),
        //                     ),
        //                     SizedBox(
        //                       width: 5,
        //                     ),
        //                     Image.asset(
        //                       'assets/images/tick.png',
        //                       height: 13,
        //                       width: 13,
        //                     )
        //                   ],
        //                 ),
        //                 Row(
        //                   children: [
        //                     Text(
        //                       '14 h',
        //                       style: TextStyle(
        //                           color: greyColor,
        //                           fontWeight: FontWeight.bold,
        //                           fontSize: 15),
        //                     ),
        //                     SizedBox(
        //                       width: 15,
        //                     ),
        //                     Image.asset(
        //                       'assets/images/3dots.png',
        //                       color: Colors.white,
        //                       height: 15,
        //                       width: 15,
        //                     )
        //                   ],
        //                 )
        //               ],
        //             ),
        //             IntrinsicHeight(
        //                 child: Container(
        //                     padding: EdgeInsets.only(top: 10, left: 11),
        //                     child: Row(
        //                       children: [
        //                         VerticalDivider(
        //                           color: greyColor,
        //                         ),
        //                         SizedBox(
        //                           width: 15,
        //                         ),
        //                         Column(
        //                           crossAxisAlignment: CrossAxisAlignment.start,
        //                           mainAxisAlignment: MainAxisAlignment.start,
        //                           children: [
        //                             Row(
        //                               children: [
        //                                 Text(
        //                                   'Kohli is Goat ',
        //                                   style: TextStyle(color: Colors.white),
        //                                 ),
        //                                 Text(goat)
        //                               ],
        //                             ),
        //                             SizedBox(
        //                               height: 10,
        //                             ),
        //                             Image.asset('assets/images/kohli.jpg',
        //                                 height: 250),
        //                             Row(
        //                               children: [
        //                                 ImageIcon(
        //                                   AssetImage('assets/images/heart.png'),
        //                                   color: Colors.white,
        //                                 )
        //                               ],
        //                             )
        //                           ],
        //                         )
        //                       ],
        //                     )))
        //           ],
        //         ),
        //       ),
        //     )
        //   ],
        // ),
        );
  }
}
