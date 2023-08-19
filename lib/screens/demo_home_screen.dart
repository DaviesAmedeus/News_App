import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:news_app/components/breaking_news_card.dart';
import 'package:news_app/components/news_list_tile.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/models/recent_news_model.dart';

import 'details_screen.dart';

class DemoHomeScreen extends StatefulWidget {
  const DemoHomeScreen({Key? key}) : super(key: key);

  @override
  State<DemoHomeScreen> createState() => _DemoHomeScreenState();
}

class _DemoHomeScreenState extends State<DemoHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          "NewsApp",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_outlined,
                color: Colors.black,
              ))
        ],
      ),

      ///The Body
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Breakig News",
                style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              CarouselSlider.builder(
                itemCount: NewsData.breakingNewsData.length,
                itemBuilder: (context, index, id) =>
                    BreakingNewsCard(NewsData.breakingNewsData[index]),
                options: CarouselOptions(
                    aspectRatio: 16 / 9,
                    enableInfiniteScroll: false,
                    enlargeCenterPage: true),
              ),
              SizedBox(
                height: 40.0,
              ),
              Text(
                "Recent News",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: RecentNewsData.recentNews.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(NewsData.breakingNewsData[index])));
                        },
                      child: Container(
                        width: double.infinity,
                        height: 130,
                        margin: EdgeInsets.only(bottom: 20),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(26)),
                        child: Row(children: [
                          Flexible(
                              flex: 3,
                              child: Hero(
                                tag: "${RecentNewsData.recentNews[index].title}",
                                child: Container(
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      image: DecorationImage(
                                          image: AssetImage(RecentNewsData
                                              .recentNews[index].urlToImage!),
                                          fit: BoxFit.fitHeight)),
                                ),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Flexible(
                              flex: 5,
                              child: Column(
                                children: [
                                  Text(
                                    RecentNewsData.recentNews[index].title!,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    RecentNewsData.recentNews[index].content!,
                                    style: TextStyle(color: Colors.white54),
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              ))
                        ]),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),

      ///The bottom navigation across pages
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(20)),
        child: BottomNavigationBar(
          selectedItemColor: Colors.orange.shade900,
          elevation: 0.0,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                backgroundColor: Colors.transparent,
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmark), label: "Bookmark"),
            BottomNavigationBarItem(
                icon: Icon(Icons.rss_feed_rounded), label: "Feed"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
          ],
        ),
      ),
    );
  }
}
