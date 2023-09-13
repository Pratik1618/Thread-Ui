import 'package:flutter/material.dart';

class ReactionTab extends StatefulWidget {
  const ReactionTab({super.key});

  @override
  State<ReactionTab> createState() => _ReactionTabState();
}

class _ReactionTabState extends State<ReactionTab> {
  String imgPath = 'assets/images/heart.png';
  var color2 = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      // color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              if (imgPath == 'assets/images/heart.png') {
                imgPath = 'assets/images/heart2.png';
                color2 = Colors.red;
              } else {
                imgPath = 'assets/images/heart.png';
                color2 = Colors.white;
              }
              setState(() {});
            },
            child: ImageIcon(
              AssetImage(imgPath),
              color: color2,
              size: 23,
            ),
          ),
          ImageIcon(
            AssetImage('assets/images/chat.png'),
            color: Colors.white,
            size: 27,
          ),
          ImageIcon(
            AssetImage('assets/images/refresh.png'),
            color: Colors.white,
            size: 23,
          ),
          ImageIcon(
            AssetImage('assets/images/send.png'),
            color: Colors.white,
            size: 23,
          )
        ],
      ),
    );
  }
}
