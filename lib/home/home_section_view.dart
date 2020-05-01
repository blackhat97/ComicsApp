import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:pkcomics/app/app_navigator.dart';
import 'package:pkcomics/generated/i18n.dart';

class HomeSectionView extends StatelessWidget {
  final String title;
  final String action;

  HomeSectionView(this.title, this.action);

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(15, 15, 15, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '$title',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5,),
              Container(
                width: 80,
                height: 2,
                color: Colors.black,
              )
            ],
          ),
          GestureDetector(
            onTap: () {
              if (action == 'recent') {
                AppNavigator.pushComicList(context, title, action);
              }
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  I18n.of(context).more,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                SizedBox(width: 3,),
                Icon(CupertinoIcons.forward, size: 14,),
                SizedBox(width: 20,),
                
              ],
            )
          )
        ],
      )
    );
  }
}