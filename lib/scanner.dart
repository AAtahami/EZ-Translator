// import 'dart:io';

// //import 'package:firebase_ml_vision_raw_bytes/firebase_ml_vision_raw_bytes.dart';
// import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/scanned_text.dart';
// import 'package:image_picker/image_picker.dart';

// class scanner extends StatefulWidget {
//   const scanner({Key? key}) : super(key: key);

//   @override
//   State<scanner> createState() => _scannerState();
// }

// class _scannerState extends State<scanner> {
//   late final String _text = " ";
//   XFile? _image;
//   final picker = ImagePicker();
//   InputImage? inputImage;
//   final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Image Scanner"),
//         actions: [
//           TextButton(
//             child: const Text(
//               "Scan",
//               style: TextStyle(
//                 color: Colors.white,
//               ),
//             ),
//             onPressed: scanText,
//           )
//         ],
//       ),

//       // floatingActionButton: FloatingActionButton(
//       //   onPressed: getImage,
//       //   child: const Icon(
//       //     Icons.add_a_photo,
//       //   ),
//       // ),
//       // child: SizedBox(
//       //           height: double.infinity,
//       //           width: double.infinity,
//       //           child: _image != null
//       //               ? Image.file(
//       //                   File(_image!.path),
//       //                   fit: BoxFit.fitWidth,
//       //                 )
//       //               : Container(),
//       //         ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               child: SingleChildScrollView(
//                 child: _image != null
//                     ? Image.file(
//                         File(_image!.path),
//                         fit: BoxFit.fitWidth,
//                       )
//                     : Container(
//                         //color: Colors.red,
//                         ),
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 5),
//                     padding: const EdgeInsets.only(top: 10),
//                     child: MaterialButton(
//                       elevation: 10,
//                       textColor: Colors.white,
//                       color: Colors.teal,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(50)),
//                       child: const Icon(Icons.photo),
//                       onPressed: () {
//                         getImage(ImageSource.gallery);
//                       },
//                     )),
//                 Container(
//                     alignment: Alignment.bottomRight,
//                     margin: const EdgeInsets.symmetric(horizontal: 5),
//                     padding: const EdgeInsets.only(top: 10),
//                     child: MaterialButton(
//                       elevation: 10,
//                       textColor: Colors.white,
//                       color: Colors.teal,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(50)),
//                       child: const Icon(Icons.add_a_photo),
//                       onPressed: () {
//                         getImage(ImageSource.camera);
//                       },
//                     ))
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Future scanText() async {
//     showDialog(
//       builder: (context) => const Center(
//         child: CircularProgressIndicator(),
//       ),
//       context: context,
//     );
//     final RecognizedText recognizedText =
//         await textRecognizer.processImage(inputImage!);

//     String text = recognizedText.text;
//     for (TextBlock? block in recognizedText.blocks) {
//       final String text = block!.text;
//       final List<String> languages = block.recognizedLanguages;

//       for (TextLine line in block.lines) {
//         // Same getters as TextBlock
//         for (TextElement element in line.elements) {
//           // Same getters as TextBlock
//         }
//       }
//     }

//     // final FirebaseVisionImage visionImage =
//     //     FirebaseVisionImage.fromFile(File(_image!.path));
//     // final TextRecognizer textRecognizer =
//     //     FirebaseVision.instance.textRecognizer();
//     // final VisionText = await textRecognizer.processImage(visionImage);
//     // for (TextBlock block in VisionText.blocks) {
//     //   for (TextLine line in block.lines) {
//     //     return _text = line.text + '\n';
//     //   }
//     // }
//     Navigator.of(context).pop();
//     Navigator.of(context).push(
//         MaterialPageRoute(builder: ((BuildContext) => ScannedText(_text))));
//   }

//   Future getImage(ImageSource source) async {
//     final PickedFile = await picker.pickImage(source: ImageSource.camera);
//     setState(() {
//       if (PickedFile != null) {
//         setState(() {
//           _image = PickedFile;
//         });
//       } else {
//         print("NO IMAGE SELECTED");
//       }
//     });
//   }
// }
