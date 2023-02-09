// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/home_page.dart';

// import 'json_page.dart';

// class LanguageSelection extends StatefulWidget {
//   const LanguageSelection({Key? key}) : super(key: key);

//   @override
//   State<LanguageSelection> createState() => _LanguageSelectionState();
// }

// class _LanguageSelectionState extends State<LanguageSelection> {
//   String selectedLanguageCode = "ur";
//   String selectedSourceLanguage = "en";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Select A Language"),
//       ),
//       body: Container(
//         padding: const EdgeInsets.all(15),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             Container(
//               child: const Text(
//                 //"𓂀 𝔼ℤ 𝕋ℝ𝔸ℕ𝕊𝕃𝔸𝕋𝕆ℝ 𓂀",
//                 "🅴🆉 🆂🅾🅵🆃",
//                 style: TextStyle(
//                   fontSize: 50,
//                   //fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 320.0,
//               //color: Colors.yellowAccent,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   const Text(
//                     "Select a Source and Target Language For Translation",
//                     style: TextStyle(
//                       fontSize: 20.0,
//                       fontWeight: FontWeight.bold,
//                       fontStyle: FontStyle.italic,
//                     ),
//                   ),
//                   TextButton(
//                     //splashColor: Colors.red,
//                     //textColor: const Color.fromARGB(255, 240, 242, 243),
//                     child: const Text(
//                       'Sorce Language',
//                       style: TextStyle(
//                         fontSize: 20.0,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     // const Icon(Icons.arrow_drop_down_circle_outlined),
//                     //minWidth: 70.0,
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => jsonPage(
//                             callBack: (data) {
//                               setState(() {
//                                 selectedSourceLanguage = data;
//                               });
//                             },
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                   TextButton(
//                     //splashColor: Colors.red,
//                     //textColor: const Color.fromARGB(255, 240, 242, 243),
//                     child: const Text(
//                       'Target Language',
//                       style: TextStyle(
//                         fontSize: 20.0,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     // const Icon(Icons.arrow_drop_down_circle_outlined),
//                     //color: Colors.teal,
//                     //minWidth: 70,
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => jsonPage(
//                             callBack: (data) {
//                               setState(() {
//                                 selectedLanguageCode = data;
//                               });
//                             },
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               child: MaterialButton(
//                   textColor: Colors.white,
//                   child: const Icon(Icons.arrow_forward_rounded, size: 40),
//                   color: Colors.teal,
//                   minWidth: 100.0,
//                   height: 50.0,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20)),
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) =>
//                             const MyHomePage(title: "EZ TRANSLATOR"),
//                       ),
//                     );
//                   }),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
