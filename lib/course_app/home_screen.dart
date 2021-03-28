import "package:flutter/material.dart";
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'model/constants.dart';
import 'details_screen.dart';
import 'model/category.dart';

class CourseHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20, top: 50, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset("assets/icons/menu.svg"),
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Turn Back",
                    style: kHeadingTextStyle.copyWith(fontSize: 20),
                  ),
                ),
                Image.asset("assets/images/user.png", height: 30),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text("Hey Hope,", style: kHeadingTextStyle),
            Text(
              "Find a curse you want to learn",
              style: kSubheadingTextStyle,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F7),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    SvgPicture.asset("assets/icons/search.svg"),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      "Search for anything",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFFa0A5BD),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Category",
                  style: kTitleTextStyle,
                ),
                Text(
                  "See All",
                  style: kSubtitleTextStyle.copyWith(color: kBlueColor),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
                child: StaggeredGridView.countBuilder(
              padding: EdgeInsets.zero,
              crossAxisCount: 2,
              itemCount: categories.length,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              staggeredTileBuilder: (index) => StaggeredTile.fit(1),
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(20),
                  height: index.isEven ? 200 : 240,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: AssetImage(categories[index].image),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        categories[index].name,
                        style: kTitleTextStyle,
                      ),
                      Text(
                        "${categories[index].numOfCourses} Courses",
                        style: TextStyle(
                          color: kTextColor.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
