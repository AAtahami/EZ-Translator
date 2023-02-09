import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_application_1/dictionary_view.dart';
import 'package:flutter_application_1/home_page.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Scann/image_to_text_screen.dart';
import 'app_drawer.dart';

class HomeButton extends StatefulWidget {
  const HomeButton({Key? key}) : super(key: key);

  @override
  State<HomeButton> createState() => _HomeButtonState();
}

class _HomeButtonState extends State<HomeButton> {
  String llo = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("EZ SOFT"),
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              //"𓂀 𝔼ℤ 𝕋ℝ𝔸ℕ𝕊𝕃𝔸𝕋𝕆ℝ 𓂀",
              "🅴🆉 🆂🅾🅵🆃",
              style: TextStyle(
                fontSize: 50,
                //fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 250,
              width: 250,

              child: Image(image: AssetImage('assets/home_btn.gif')),
              //color: Colors.amber,
            ),
            Column(
              children: [
                Center(
                  child: GestureDetector(
                    onTap: () async {
                      final prefs = await SharedPreferences.getInstance();
                      var login = await prefs.setString("login", "true");
                      print(login.toString() + "     ........s");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const MyHomePage(title: "EZ TRANSLATOR")),
                      );
                    },
                    child: Container(
                      height: 55,
                      width: MediaQuery.of(context).size.width * 0.80,
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Center(
                        child: Text(
                          "EZ TRANSLATOR",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          //selectionColor: Colors.amber,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DictionaryView()),
                      );
                    },
                    child: Container(
                      height: 55,
                      width: MediaQuery.of(context).size.width * 0.80,
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Center(
                        child: Text(
                          "EZ DICTIONARY",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          //selectionColor: Colors.amber,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TextRecognizerView()),
                      );
                    },
                    child: Container(
                      height: 55,
                      width: MediaQuery.of(context).size.width * 0.80,
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Center(
                        child: Text(
                          "EZ SCANNER",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          //selectionColor: Colors.amber,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
