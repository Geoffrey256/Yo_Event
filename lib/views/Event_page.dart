import 'package:flutter/material.dart';
import 'package:yo_event/ReusableWidgets/colors.dart';
import 'package:yo_event/ReusableWidgets/reusableText.dart';
import 'package:yo_event/ReusableWidgets/iconTextWidget.dart';
import 'package:yo_event/Views/home.dart';

class EventSite extends StatefulWidget {
  const EventSite({super.key});

  @override
  State<EventSite> createState() => _EventSiteState();
}

class _EventSiteState extends State<EventSite> {
  PageController pageController = PageController(viewportFraction: 0.75);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = 220;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // color: Colors.redAccent,
          height: 280,
          child: PageView.builder(
              controller: pageController,
              itemCount: 6,
              itemBuilder: (context, index) {
                return _buildPageItem(index);
              }),
        ),
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = new Matrix4.identity();

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            // color: Colors.blue,
            height: 220,
            margin: EdgeInsets.only(left: 10, right: 10, top: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: index.isEven ? AppColors.MainColor : AppColors.AppBarColor,
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage("assets/event.jpeg")),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120,
              margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: Container(
                padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(
                      text: 'Big Event Festival',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                            5,
                            (index) => Icon(
                              Icons.star,
                              color: Colors.blue,
                              size: 15,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        SmallText(text: "4.5"),
                        SizedBox(width: 10),
                        SmallText(text: "1287"),
                        SizedBox(width: 10),
                        SizedBox(width: 10),
                        SmallText(text: "Comments")
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        IconAndTextWidget(
                          icon: Icons.circle_sharp,
                          text: "Normal",
                          iconColor: Colors.blue,
                        ),
                        SizedBox(width: 5),
                        IconAndTextWidget(
                          icon: Icons.location_on,
                          text: "1.7KM",
                          iconColor: Colors.blue,
                        ),
                        SizedBox(width: 5),
                        IconAndTextWidget(
                          icon: Icons.access_time_rounded,
                          text: "22 Mins ago",
                          iconColor: Colors.blue,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
