import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_scrolling_animation/paint.dart';
import 'package:flutter_scrolling_animation/second_page.dart';

class AnimateOnScrollFlutter extends StatefulWidget {
  @override
  _AnimateOnScrollFlutterState createState() => _AnimateOnScrollFlutterState();
}

class _AnimateOnScrollFlutterState extends State<AnimateOnScrollFlutter> {
  final controller = ScrollController();
  double appBarHeight = 200.0;

  static List images = [
    'https://pbs.twimg.com/profile_images/1213003239857242119/Z23IzzwA_400x400.jpg',
    'https://pbs.twimg.com/profile_images/1202672014479282176/j3SAuuld_400x400.jpg',
    'https://pbs.twimg.com/profile_images/1215155273507188736/Oq6IKGlx_400x400.jpg',
    'https://pbs.twimg.com/profile_images/1195956471315472385/-1EMFU5h_400x400.jpg',
    'https://pbs.twimg.com/profile_images/1187104022630555649/Wl8_gveG_400x400.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        controller: controller,
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: appBarHeight,
            floating: true,
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                double percent = ((constraints.maxHeight - kToolbarHeight) *
                    100 /
                    (appBarHeight - kToolbarHeight));
                return Stack(
                  children: <Widget>[
                    Image.network(
                      '${images[0]}',
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: double.infinity,
                    ),

//                    Custom Paint
                    Container(
                      height: kToolbarHeight,
                      child: Row(
                        children: <Widget>[
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomPaint(
                                size: Size.fromHeight(kToolbarHeight),
                                painter: CirclePainter(100 - percent),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

//                    Text and Icon
                    Padding(
                      padding: const EdgeInsets.only(right: 13.0),
                      child: Container(
                        height: kToolbarHeight,
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "JayBaby ",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                controller.animateTo(-appBarHeight,
                                    duration: Duration(seconds: 4),
                                    curve: Curves.fastOutSlowIn);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.menu,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          SliverList(delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                _modalBottomSheetMenu();
              },
              child: Container(
                height: MediaQuery.of(context).size.height / 3,
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image.network(
                    returnedImage(),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  elevation: 3,
                  margin: EdgeInsets.all(10),
                ),
              ),
            );
          }))
        ],
      ),
    );
  }

  void _modalBottomSheetMenu() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: new Text(
                  'Gallery',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
              new Container(
                height: MediaQuery.of(context).size.height / 2,
                color: Colors.transparent,
                child: new Container(
                    decoration: new BoxDecoration(
                        color: Colors.white,
                        borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(10.0),
                            topRight: const Radius.circular(10.0))),
                    child: GridView.builder(
                        itemCount: 12,
                        gridDelegate:
                            new SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SecondPage(images[0])),
                              );
                            },
                            child: Hero(
                              tag: 'image',
                              child: Container(
                                height: 50.0,
                                width: 50.0,
                                child: Card(
                                  semanticContainer: true,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: Image.network(
                                    returnedImage(),
                                    fit: BoxFit.fill,
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  elevation: 3,
                                  margin: EdgeInsets.all(10),
                                ),
                              ),
                            ),
                          );
                        })),
              ),
            ],
          );
        });
  }

  String returnedImage() {
    final _random = new Random();
    var element = images[_random.nextInt(images.length)];
    return element;
  }
}
