//import 'dart:math';

import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {

  static final pageName = 'avatar';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://cdn.forbes.com.mx/2018/11/stan-lee.jpg'),
              radius: 30.0,
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage('https://www.recreoviral.com/wp-content/uploads/2016/02/Cameos-en-los-que-ha-aparecido-Stan-Lee.jpg'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
    
  }
}