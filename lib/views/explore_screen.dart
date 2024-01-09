// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pyramid/common/bold_text.dart';
import 'package:pyramid/common/const.dart';
import 'package:pyramid/common/plain_text.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

List<Color> gradcolor = [
  Color(0xFF3C3C3C),
  Color(0xFF000000),
];

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          color: Color(0xFFF7F6FA),
          padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // padding: EdgeInsets.only(left: 10, top: 10),
                height: 180,
                width: w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/img1.png"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        width: 230,
                        height: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(23),
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color(0xFF3B3B3B),
                              Colors.black.withOpacity(0),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PlainText(
                            name: "Best Quarantine\nWorkout",
                            fontsize: 24,
                            color: Colors.white,
                          ),
                          SizedBox(height: 50), // Add some vertical spacing
                          Row(
                            children: [
                              BoldText(
                                name: "See more",
                                fontsize: 14,
                                color: Color(0xFFBBF246),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 12,
                                color: Color(0xFFBBF246),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              hspacer(5),
              BoldText(name: "Best for you", fontsize: 18),
              hspacer(5),
              Container(
                height: 194,
                width: w,
                color: Color(0xFFF7F6FA),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            buildExerciseContainer("assets/images/belly.png",
                                "Belly fat burner", "10 min", "Beginner"),
                            hspacer(5),
                            buildExerciseContainer("assets/images/plank.png",
                                "Plank", "5 min", "Expert"),
                          ],
                        ),
                        wspacer(7),
                        Column(
                          children: [
                            buildExerciseContainer("assets/images/lose.png",
                                "Lose Fat", "10 min", "Beginner"),
                            hspacer(5),
                            buildExerciseContainer("assets/images/body.png",
                                "Build Biceps", "30 min", "Intermediate"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              hspacer(5),
              BoldText(name: "Challenge", fontsize: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildChallengeBox(
                      "Plank\nChallenge",
                      "assets/images/fire.png",
                      Color(0xFFBBF246),
                      Colors.black),
                  buildChallengeBox(
                      "Spirit\nChallenge",
                      "assets/images/spirit.png",
                      Color(0xFF192126),
                      Colors.white),
                  buildChallengeBox(
                    "Spirit\nChallenge",
                    "assets/images/squat.png",
                    Colors.white,
                    Colors.black,
                  ),
                ],
              ),
              hspacer(5),
              BoldText(name: "Fast Warmup", fontsize: 18),
              SizedBox(
                height: 92,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (BuildContext context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(2),
                        child: buildExerciseContainer(
                            imgLink[index],
                            exerciseName[index],
                            exerciseDuration[index],
                            exercisetype[index]),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildChallengeBox(
      String title, String imgLink, Color color, Color textColor) {
    return Container(
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(9)),
      height: 105,
      width: 105,
      child: Stack(
        children: [
          Positioned(
              bottom: 5,
              left: 5,
              child: PlainText(
                name: title,
                color: textColor,
                fontsize: 14,
                fontWeight: FontWeight.w600,
              )),
          Positioned(
            right: 0,
            bottom: 5,
            child: Opacity(
              opacity: 0.7,
              child: Image.asset(imgLink),
            ),
          )
        ],
      ),
    );
  }

  Widget buildExerciseContainer(String imgLink, String exerciseName,
      String duration, String exerciseType) {
    return Container(
      height: 86,
      width: 200,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(9),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(imgLink),
          ),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BoldText(
                name: exerciseName,
                fontsize: 14,
                fontWeight: FontWeight.w600,
              ),
              hspacer(5),
              Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: Color(0xFFF1F1F1),
                ),
                child: PlainText(name: duration, fontsize: 12),
              ),
              hspacer(5),
              Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: Color(0xFFF1F1F1),
                ),
                child: PlainText(name: exerciseType, fontsize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget hspacer(double height) => SizedBox(height: height);
  Widget wspacer(double width) => SizedBox(width: width);
}
