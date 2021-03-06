import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:pkcomics/public.dart';

class EpisodeCommentCell extends StatelessWidget {
  final EpisodeComment comment;

  EpisodeCommentCell(this.comment);

  Widget buildContent() {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                radius: 13,
                backgroundImage: CachedNetworkImageProvider(comment.avatar),
              ),
              SizedBox(width: 10),
              Text(comment.nickname, style: TextStyle(fontSize: 14, color: AppColor.gray)),
            ],
          ),
          Container(
            padding: EdgeInsets.fromLTRB(35, 15, 15, 0),
            child: Text(comment.content, style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        buildContent(),
        Divider(height: 1, indent: 15),
        Container(
          height: 10,
        )
      ],
    );
  }
}
