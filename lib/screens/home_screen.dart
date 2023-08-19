import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/trending_news_model.dart';

import '../constants/color_constant.dart';
import '../models/news_model.dart';
import '../models/recent_news_model.dart';
import 'details_screen.dart';

TrendingNews trendingObj = TrendingNews();

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(left: 15, right: 15),
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///Search component
                Container(
                  height: 39,
                  margin: const EdgeInsets.only(top: 18),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black12),
                  child: Stack(
                    children: [
                      TextField(
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        style: const TextStyle(
                            fontSize: 12,
                            color: kBlackColor,
                            fontWeight: FontWeight.w600),
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(
                                left: 19, right: 50, bottom: 8),
                            border: InputBorder.none,
                            hintText: 'Search Book...',
                            hintStyle: GoogleFonts.openSans(
                                fontSize: 12,
                                color: kGreyColor,
                                fontWeight: FontWeight.w600)),
                      ),
                      const Positioned(
                          top: 8,
                          right: 9,
                          child: Icon(
                            Icons.search,
                            color: Colors.blueAccent,
                          ))
                    ],
                  ),
                ),

                ///Logo
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text(
                    "assenga",
                    style: GoogleFonts.notoSerif(
                        fontSize: 34,
                        fontWeight: FontWeight.w600,
                        color: kBlackColor
                    ),
                  ),
                  Text(
                    "online",
                    style: GoogleFonts.notoSerif(
                        fontSize: 34,
                        fontWeight: FontWeight.w600,
                        color: kBlueColor
                    ),
                  ),
                  Text(
                    ".",
                    style: GoogleFonts.notoSerif(
                        fontSize: 34,
                        fontWeight: FontWeight.w600,
                        color: kBlackColor
                    ),
                  ),
                  Text(
                    "com",
                    style: GoogleFonts.notoSerif(
                        fontSize: 34,
                        fontWeight: FontWeight.w600,
                        color: Colors.red
                    ),
                  ),
                ],

                ),

                const SizedBox(
                  height: 20,
                ),

                ///Trending news section
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Trending News",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: kBlackColor,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    ///Horizontal scroll trending news
                    CarouselSlider.builder(
                      itemCount: trendingObj.trendingNews.length,
                      itemBuilder: (context, index, id) => Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              20), // Adjust the radius as needed
                        ),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                    "${trendingObj.trendingNews[index]["image"]}")),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: const LinearGradient(
                                    colors: [Colors.transparent, Colors.black],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter)),
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  trendingObj.trendingNews[index]["title"],
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                  "Na ${trendingObj.trendingNews[index]["author"]}",
                                  style: const TextStyle(
                                      color: Colors.white54,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      options: CarouselOptions(
                          aspectRatio: 26 / 16,
                          enableInfiniteScroll: false,
                          enlargeCenterPage: true),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "News Category",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: kBlackColor,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    ///Categories Section
                    Container(
                      width: double.infinity,
                      height: 160,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ///First Row
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                OurCategoryCard(
                                  cardTitle: "Education",
                                  icon: const Icon(
                                    Icons.menu_book,
                                    color: kBlueColor,
                                  ),
                                  onTap: () {},
                                ),
                                OurCategoryCard(
                                  cardTitle: "Sports",
                                  icon: const Icon(
                                    Icons.sports_gymnastics_outlined,
                                    color: kBlueColor,
                                  ),
                                  onTap: () {},
                                ),
                                OurCategoryCard(
                                  cardTitle: "Politics",
                                  icon: const Icon(
                                    Icons.person,
                                    color: kBlueColor,
                                  ),
                                  onTap: () {},
                                ),
                                OurCategoryCard(
                                  cardTitle: "Jobs",
                                  icon: const Icon(
                                    Icons.add,
                                    color: kBlueColor,
                                  ),
                                  onTap: () {},
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),

                          ///Second row
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                OurCategoryCard(
                                  cardTitle: "Money",
                                  icon: const Icon(
                                    Icons.money,
                                    color: kBlueColor,
                                  ),
                                  onTap: () {},
                                ),
                                OurCategoryCard(
                                  cardTitle: "Selection",
                                  icon: const Icon(
                                    Icons.group,
                                    color: kBlueColor,
                                  ),
                                  onTap: () {},
                                ),
                                OurCategoryCard(
                                  cardTitle: "TAMISEMI",
                                  icon: const Icon(
                                    Icons.cases_outlined,
                                    color: kBlueColor,
                                  ),
                                  onTap: () {},
                                ),
                                OurCategoryCard(
                                  cardTitle: "Tech",
                                  icon: const Icon(
                                    Icons.computer,
                                    color: kBlueColor,
                                  ),
                                  onTap: () {},
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    ///Hot news section
                    const Text(
                      "Hot News",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: kBlackColor,
                      ),
                    ),

                    const SizedBox(
                      height: 16.0,
                    ),
                    ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: RecentNewsData.recentNews.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                            },
                            child: Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Adjust the radius as needed
                              ),
                              child: Container(
                                width: double.infinity,
                                height: 130,
                                margin: const EdgeInsets.only(bottom: 20),
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(26)),
                                child: Row(children: [
                                  Flexible(
                                      flex: 5,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            RecentNewsData
                                                .recentNews[index].title!,
                                            style: const TextStyle(
                                                color: kBlackColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            RecentNewsData
                                                .recentNews[index].content!,
                                            style: const TextStyle(
                                                color: kBlackColor),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: const [
                                              Text(
                                                "4hrs ago",
                                                style: TextStyle(
                                                    color: kGreyColor),
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Icon(
                                                Icons.share,
                                                color: kBlueColor,
                                                size: 20,
                                              ),
                                              Icon(
                                                Icons.bookmark,
                                                color: kBlueColor,
                                                size: 20,
                                              )
                                            ],
                                          )
                                        ],
                                      )),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Flexible(
                                      flex: 3,
                                      child: Hero(
                                        tag:
                                            "${RecentNewsData.recentNews[index].title}",
                                        child: Container(
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      RecentNewsData
                                                          .recentNews[index]
                                                          .urlToImage!),
                                                  fit: BoxFit.fitHeight)),
                                        ),
                                      )),
                                ]),
                              ),
                            ),
                          );
                        })
                  ],
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}

class OurCategoryCard extends StatelessWidget {
  VoidCallback? onTap;
  Icon? icon;
  String? cardTitle;

  OurCategoryCard(
      {super.key, required this.icon, required this.cardTitle, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(10.0), // Adjust the radius as needed
        ),
        child: Container(
          width: 70,
          height: 65,
          decoration: BoxDecoration(
              color: Colors.black12, borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: icon,
              ),
              Text(
                cardTitle!,
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.blueGrey),
              )
            ],
          ),
        ),
      ),
    );
  }
}
