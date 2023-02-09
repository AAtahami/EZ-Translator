import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';

import 'Models/student_model.dart';

class aboutUs extends StatelessWidget {
  const aboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('About Us'),
        ),
        body: TinderCard());
  }
}

class TinderCard extends StatefulWidget {
  @override
  _TinderCardState createState() => _TinderCardState();
}

class _TinderCardState extends State<TinderCard> with TickerProviderStateMixin {
  List<StudentModel> welcomeImages = [
    StudentModel(
        name: "ALI AHMAD", image: "assets/tc_1.jpg", rollNo: "109_029039"),
    StudentModel(
        name: "MOHAMMAD ZAIN", image: "assets/tc_2.jpg", rollNo: "160_029039"),
    StudentModel(
        name: "AHMAD ALI ", image: "assets/tc_3.jpg", rollNo: "199_029039"),
    StudentModel(
        name: "ALI AHMAD", image: "assets/tc_4.jpeg", rollNo: "110_029039"),
  ];

  @override
  Widget build(BuildContext context) {
    CardController controller;

    return Scaffold(
      body: Column(
        children: [
          Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.87,
              child: TinderSwapCard(
                animDuration: 200,
                // swipeUp: true,
                // swipeDown: true,
                orientation: AmassOrientation.BOTTOM,
                totalNum: welcomeImages.length,
                stackNum: 3,
                swipeEdge: 4.0,
                maxWidth: MediaQuery.of(context).size.width * 0.99,
                maxHeight: MediaQuery.of(context).size.height * 0.99,
                minWidth: MediaQuery.of(context).size.width * 0.98,
                minHeight: MediaQuery.of(context).size.height * 0.98,
                cardBuilder: (context, index) => Card(
                  child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              welcomeImages[index].image,
                            ),
                            fit: BoxFit.cover,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, bottom: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              welcomeImages[index].name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25.0,
                              ),
                            ),
                            Text(
                              welcomeImages[index].rollNo,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
                cardController: controller = CardController(),
                swipeUpdateCallback:
                    (DragUpdateDetails details, Alignment align) {
                  if (align.x < 0) {
                  } else if (align.x > 0) {}
                },
                swipeCompleteCallback:
                    (CardSwipeOrientation orientation, int index) {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
