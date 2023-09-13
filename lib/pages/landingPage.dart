import 'package:flutter/material.dart';
import 'package:threadui/constants.dart';
import 'package:threadui/pages/BottomTab.dart';
import 'package:threadui/pages/homePage.dart';

class landingpage extends StatefulWidget {
  const landingpage({super.key});

  @override
  State<landingpage> createState() => _landingpageState();
}

class _landingpageState extends State<landingpage> {
  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Image.asset(
            'assets/images/logo.png',
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => homePage(),
                  transitionDuration: Duration.zero,
                  reverseTransitionDuration: Duration.zero,
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              height: 72,
              width: 326,
              // color: Colors.white,
              decoration: BoxDecoration(
                  color: Color(0xff181818),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Color(0xff383838))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Log in with Instagram',
                        style: TextStyle(color: Color(0xff383838)),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        'kadam_pratik18',
                        style: TextStyle(
                            color: Colors.white,
                            // fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/images/insta.png',
                    height: 40,
                    width: 40,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Center(
            child: Text(
              'Switch Account',
              style: TextStyle(color: greyColor),
            ),
          )
        ],
      ),
    );
  }
}
