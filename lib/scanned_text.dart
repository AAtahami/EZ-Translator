// import 'package:clipboard/clipboard.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// class ScannedText extends StatelessWidget {
//   final String text;
//   ScannedText(this.text);

//   @override
//   final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: key,
//       appBar: AppBar(
//         title: const Text("Scanned Text"),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.copy),
//             onPressed: () {
//               FlutterClipboard.copy(text);
//               Fluttertoast.showToast(
//                 msg: "Text Copied",
//                 gravity: ToastGravity.BOTTOM,
//                 toastLength: Toast.LENGTH_SHORT,
//                 backgroundColor: Colors.white,
//                 textColor: Colors.teal,
//               );
//               //FlutterClipboard.copy(text).then((value) => key.currentState!.(const SnackBar(content: Text("Copied"))));
//             },
//           )
//         ],
//       ),
//       body: Container(
//         padding: const EdgeInsets.all(10),
//         alignment: Alignment.center,
//         height: double.infinity,
//         width: double.infinity,
//         child: SelectableText(text.isEmpty ? 'NO TEXT AVAILABLE' : text),
//       ),
//     );
//   }
// }
