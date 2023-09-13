import 'package:flutter/material.dart';
import 'package:threadui/constants.dart';
import 'package:threadui/pages/homePage.dart';
import 'package:threadui/pages/profilePage.dart';
import 'package:threadui/pages/search.dart';

class bottomTabs extends StatefulWidget {
  const bottomTabs({super.key});

  @override
  State<bottomTabs> createState() => _bottomTabsState();
}

class _bottomTabsState extends State<bottomTabs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      // height: 30,
      // color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>
                          homePage(),
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero));
            },
            child: ImageIcon(
              AssetImage('assets/images/homepage.png'),
              size: 28,
              color: greyColor,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>
                          searchPage(),
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero));
            },
            child: ImageIcon(
              AssetImage('assets/images/search.png'),
              size: 24,
              color: greyColor,
            ),
          ),
          ImageIcon(
            AssetImage('assets/images/more.png'),
            size: 24,
            color: greyColor,
          ),
          ImageIcon(
            AssetImage('assets/images/heart.png'),
            size: 24,
            color: greyColor,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>
                          profilePage(),
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero));
            },
            child: ImageIcon(
              AssetImage('assets/images/user.png'),
              size: 24,
              color: greyColor,
            ),
          ),
        ],
      ),
    );
  }
}
