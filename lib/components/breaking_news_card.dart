import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/screens/details_screen.dart';

class BreakingNewsCard extends StatefulWidget {
   BreakingNewsCard(this.data, {Key? key}) : super(key: key);
  NewsData data;
  @override
  State<BreakingNewsCard> createState() => _BreakingNewsCardState();
}

class _BreakingNewsCardState extends State<BreakingNewsCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(widget.data)));
      },
      child: Container(

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(widget.data.urlToImage!)
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(
              colors: [Colors.transparent, Colors.black],
                    begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
          )
          ),
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.data.title!,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
              ),
              SizedBox(height: 8.0,),
              Text(widget.data.author!, style: TextStyle(color: Colors.white54, fontSize: 14, fontWeight: FontWeight.normal),),

            ],
          ),
        ),
      ),
    );
  }
}
