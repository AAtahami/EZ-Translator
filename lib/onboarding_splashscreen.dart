import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_buttons.dart';
import 'package:intro_screen_onboarding_flutter/introduction.dart';
import 'package:intro_screen_onboarding_flutter/introscreenonboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final List<Introduction> list = [
    Introduction(
      title: 'EZ Translator',
      subTitle:
          'Translation is the process of conveying a written source language.',
      imageUrl: 'assets/obs_translator.gif',
    ),
    Introduction(
      title: 'Source',
      subTitle:
          'Translation is the process of conveying a written source language.',
      imageUrl: 'assets/obs_dictionary.gif',
    ),
    Introduction(
      title: 'Target',
      subTitle: 'Translation is the process of conveying a written source.',
      imageUrl: 'assets/obs_scanner.gif',
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sahedPref();
  }

  sahedPref() async {
    final prefs = await SharedPreferences.getInstance();
    var login = prefs.getString("login");
    if (login == 'true') {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: ((Context) => const HomeButton())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return IntroScreenOnboarding(
      backgroudColor: Colors.white,
      introductionList: list,
      onTapSkipButton: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeButton(),
          ),
        );
      },
    );
  }

  // loadpref() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();

  //   var isalredy = preferences.getInt('logged');
  //   if (isalredy == 'login') {
  //     Navigator.of(context).push(MaterialPageRoute(
  //       builder: (context) {
  //         return const OnBoardingScreen();
  //       },
  //     ));
  //   } else {
  //     Navigator.of(context).push(MaterialPageRoute(
  //       builder: (context) {
  //         return const HomeButton();
  //       },
  //     ));
  //   }
  // }
}

SplashScreen animation() {
  return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: const OnBoardingScreen(),
      title: const Text(
        'Welcome In EZ SOFT',
        style: TextStyle(fontSize: 20),
      ),
      image: Image.asset('assets/logo.png'),
      backgroundColor: Colors.white,
      loadingText: const Text("Soft Berry Pvt. Ltd"),
      styleTextUnderTheLoader: const TextStyle(fontStyle: FontStyle.italic),
      photoSize: 150.0,
      loaderColor: Colors.teal);
}
