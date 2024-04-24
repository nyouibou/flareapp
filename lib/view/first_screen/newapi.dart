// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flareapp/controller/homescreencontroller.dart';
import 'package:flareapp/view/globalwidgets/customnewspage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<HomeScreenController>(context, listen: false)
          .fetchNewsbyCategory();
      await Provider.of<HomeScreenController>(context, listen: false)
          .getTopHeadlines();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final providerObj = Provider.of<HomeScreenController>(context);
    return DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(""),
            centerTitle: true,
            titleTextStyle: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 20),
          ),
          body: Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 300,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.easeInToLinear,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.horizontal,
                ),
                items: List.generate(
                    providerObj.topheadlinesList.length,
                    (index) => Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: CachedNetworkImage(
                              width: double.infinity,
                              fit: BoxFit.cover,
                              imageUrl: providerObj
                                      .topheadlinesList[index].urlToImage ??
                                  "",
                              placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        )),
              ),
              SingleChildScrollView(
                child: Expanded(
                  child: providerObj.categoryLoading == true
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.separated(
                          itemCount: providerObj.articlesByCategory.length,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          itemBuilder: (context, index) => CustomNewsCard(
                              imageUrl: providerObj
                                      .articlesByCategory[index].urlToImage ??
                                  "",
                              author:
                                  providerObj.articlesByCategory[index].author ??
                                      "",
                              category: providerObj
                                      .articlesByCategory[index].source?.name ??
                                  "",
                              title: providerObj.articlesByCategory[index].title ??
                                  "",
                              dateTime: providerObj.articlesByCategory[index]
                                          .publishedAt !=
                                      null
                                  ? DateFormat("dd MMM yyyy ")
                                      .format(providerObj.articlesByCategory[index].publishedAt!)
                                  : ""),
                          separatorBuilder: (context, index) => Divider(
                            thickness: .5,
                            indent: 30,
                            endIndent: 30,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
