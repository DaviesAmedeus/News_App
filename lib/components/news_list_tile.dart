import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';

import '../models/recent_news_model.dart';

class NewsListTile extends StatefulWidget {
   NewsListTile(this.data, {Key? key}) : super(key: key);
   RecentNewsData data;


  @override
  State<NewsListTile> createState() => _NewsListTileState();
}

class _NewsListTileState extends State<NewsListTile> {
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   width: double.infinity,
    //   margin: EdgeInsets.only(bottom: 20),
    //   padding: EdgeInsets.all(12),
    //   height: 130,
    //   decoration: BoxDecoration(
    //     color: Colors.black,
    //     borderRadius: BorderRadius.circular(26)
    //   ),
    // );
    return Container(
      width: double.infinity,
      height: 150,
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(26)
      ),
    );
  }
}


