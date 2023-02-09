import 'dart:math';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/language_model.dart';
import 'package:flutter_application_1/TTS_STT.dart';
import 'package:flutter_application_1/json_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share_plus/share_plus.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:translator/translator.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController textController = TextEditingController();
  String pasteValue = "";
  bool _hasSpeech = false;
  final bool _logEvents = false;
  final TextEditingController _pauseForController =
      TextEditingController(text: '10');
  final TextEditingController _listenForController =
      TextEditingController(text: '300');
  double level = 0.0;
  double minSoundLevel = 50000;
  double maxSoundLevel = -50000;
  String lastWords = '';
  final _tts = TTSPkg();
  String lastError = '';
  String lastStatus = '';
  String _currentLocaleId = 'ur';
  List<LocaleName> _localeNames = [];
  SpeechToText speech = SpeechToText();

  String translatedPhrase = "";
  var translator = GoogleTranslator();
  var scanedText;
  String selectedTargetLanguage = "ur";
  String selectedSourceLanguage = "en";
  String SelectedSourceLangueName = "English";
  String SelectedTargetLangueName = "Urdu";

  String SelectedSourceLangueLocal = "en-US";
  String SelectedTargetLangueLocal = "ur-PK";

  get navigator => null;
  void startListening() {
    lastWords = '';
    lastError = '';
    final pauseFor = int.tryParse(_pauseForController.text);
    final listenFor = int.tryParse(_listenForController.text);
    // Note that `listenFor` is the maximum, not the minimun, on some
    // systems recognition will be stopped before this value is reached.
    // Similarly `pauseFor` is a maximum not a minimum and may be ignored
    // on some devices.
    speech.listen(
        onResult: resultListener,
        listenFor: Duration(seconds: listenFor ?? 300),
        pauseFor: Duration(seconds: pauseFor ?? 10),
        partialResults: true,
        localeId: _currentLocaleId,
        onSoundLevelChange: soundLevelListener,
        cancelOnError: true,
        listenMode: ListenMode.confirmation);
    setState(() {});
  }

  void soundLevelListener(double level) {
    minSoundLevel = min(minSoundLevel, level);
    maxSoundLevel = max(maxSoundLevel, level);
    // _logEvent('sound level $level: $minSoundLevel - $maxSoundLevel ');
    setState(() {
      this.level = level;
    });
  }

  void stopListening() {
    speech.stop();
    setState(() {
      level = 0.0;
    });
  }

  void cancelListening() {
    speech.cancel();
    setState(() {
      level = 0.0;
    });
  }

  /// This callback is invoked each time new recognition results are
  /// available after `listen` is called.
  void resultListener(SpeechRecognitionResult result) {
    setState(() {
      textController.text = result.recognizedWords;
      lastWords = '${result.recognizedWords} - ${result.finalResult}';
    });
  }

  Future<void> initSpeechState() async {
    try {
      var hasSpeech = await speech.initialize(
        onError: (onError) {
          print("speech to text error" + onError.errorMsg);
        },
        onStatus: (status) {
          print(status.toString() + ">>");
        },
        debugLogging: true,
      );
      if (hasSpeech) {
        // Get the list of languages installed on the supporting platform so they
        // can be displayed in the UI for selection by the user.
        _localeNames = await speech.locales();

        var systemLocale = await speech.systemLocale();
        _currentLocaleId = systemLocale?.localeId ?? '';
      }
      if (!mounted) return;

      setState(() {
        _hasSpeech = hasSpeech;
      });
    } catch (e) {
      setState(() {
        lastError = 'Speech recognition failed: ${e.toString()}';
        _hasSpeech = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initSpeechState();
    // setState(() {
    //   if(widget.scanText!=null){

    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("EZ TRANSLATOR"),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(
                left: 10.0,
                right: 10.0,
              ),
              width: double.infinity,
              height: height * 0.400,
              //color: Colors.white,
              child: Column(
                  //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 12,
                      autofocus: true,
                      cursorColor: Colors.black,
                      controller: textController,
                      decoration:
                          const InputDecoration(hintText: "Enter Text Here..."),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                      ),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Padding(padding: EdgeInsets.only(top: 50.0)),
                        MaterialButton(
                          elevation: 10,
                          splashColor: Colors.red,
                          textColor: Colors.white,
                          child: const Icon(Icons.mic),
                          color: Colors.teal,
                          minWidth: 50.0,
                          height: 50.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          onPressed: () async {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => SpeechSampleApp()),
                            // );
                            startListening();
                            Fluttertoast.showToast(
                              msg: "Now Speek",
                              gravity: ToastGravity.TOP,
                              toastLength: Toast.LENGTH_SHORT,
                              backgroundColor: Colors.white,
                              textColor: Colors.teal,
                            );
                          },
                        ),
                        MaterialButton(
                          elevation: 10,
                          splashColor: Colors.red,
                          textColor: Colors.white,
                          child: const Text("Translate"),
                          color: Colors.teal,
                          minWidth: 50.0,
                          height: 50.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          onPressed: () {
                            setState(() {
                              translator
                                  .translate(textController.text,
                                      from: selectedSourceLanguage,
                                      to: selectedTargetLanguage)
                                  .then((t) {
                                print(t.text);
                                setState(() {
                                  translatedPhrase = t.text.toString();
                                });
                              });
                            });
                          },
                        ),
                        MaterialButton(
                          elevation: 10,
                          splashColor: Colors.red,
                          textColor: Colors.white,
                          child: const Icon(Icons.paste),
                          color: Colors.teal,
                          minWidth: 50.0,
                          height: 50.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          onPressed: () {
                            FlutterClipboard.paste().then((value) {
                              setState(() {
                                textController.text = value;
                                pasteValue = value;
                              });
                            });
                            Fluttertoast.showToast(
                              msg: "Text Paste",
                              gravity: ToastGravity.BOTTOM,
                              toastLength: Toast.LENGTH_SHORT,
                              backgroundColor: Colors.white,
                              textColor: Colors.teal,
                            );
                          },
                        ),
                        MaterialButton(
                          elevation: 10,
                          splashColor: const Color.fromRGBO(244, 67, 54, 1),
                          textColor: Colors.white,
                          child: const Icon(Icons.volume_up),
                          color: Colors.teal,
                          minWidth: 50.0,
                          height: 50.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          onPressed: () async {
                            _tts.speak(
                                textController.text, SelectedSourceLangueLocal);
                          },
                        ),
                      ],
                    ),
                  ]),
            ),
            SizedBox(
              width: double.infinity,
              height: height * 0.100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    //splashColor: Colors.red,
                    //textColor: const Color.fromARGB(255, 240, 242, 243),
                    child: Text(
                      SelectedSourceLangueName,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // const Icon(Icons.arrow_drop_down_circle_outlined),
                    //minWidth: 70.0,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => jsonPage(
                            callBack: (MapEntry<String, LanguageModel> data) {
                              setState(() {
                                selectedSourceLanguage = data.key;
                                SelectedSourceLangueName = data.value.name;
                                SelectedSourceLangueLocal = data.value.local;

                                _currentLocaleId = data.key.toString();
                              });
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  TextButton(
                    //splashColor: Colors.red,
                    //textColor: const Color.fromARGB(255, 240, 242, 243),
                    child: Text(
                      SelectedTargetLangueName,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // const Icon(Icons.arrow_drop_down_circle_outlined),
                    //color: Colors.teal,
                    //minWidth: 70,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => jsonPage(
                            callBack: (data) {
                              setState(() {
                                selectedTargetLanguage = data.key;
                                SelectedTargetLangueName = data.value.name;
                                SelectedTargetLangueLocal = data.value.local;
                              });
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 10.0,
                right: 10.0,
              ),
              width: double.infinity,
              height: height * 0.3775,
              color: Colors.teal,
              child: Column(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(right: 1),
                      height: height * 0.180,
                      child: SingleChildScrollView(
                        child: Text(
                          translatedPhrase,
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 85,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MaterialButton(
                          elevation: 10,
                          splashColor: Colors.red,
                          textColor: Colors.teal,
                          child: const Icon(Icons.clear),
                          color: Colors.white,
                          minWidth: 50.0,
                          height: 50.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          onPressed: () {
                            setState(() {
                              translatedPhrase = "";
                              textController.text = "";
                            });
                            Fluttertoast.showToast(
                              msg: "Text Clear",
                              gravity: ToastGravity.BOTTOM,
                              toastLength: Toast.LENGTH_SHORT,
                              backgroundColor: Colors.white,
                              textColor: Colors.teal,
                            );
                          },
                        ),
                        MaterialButton(
                          elevation: 10,
                          splashColor: Colors.red,
                          textColor: Colors.teal,
                          child: const Icon(Icons.copy),
                          color: Colors.white,
                          minWidth: 50.0,
                          height: 50.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          onPressed: () {
                            FlutterClipboard.copy(translatedPhrase);
                            Fluttertoast.showToast(
                              msg: "Text Copied",
                              gravity: ToastGravity.BOTTOM,
                              toastLength: Toast.LENGTH_SHORT,
                              backgroundColor: Colors.white,
                              textColor: Colors.teal,
                            );
                          },
                        ),
                        MaterialButton(
                          elevation: 10,
                          splashColor: Colors.red,
                          textColor: Colors.teal,
                          child: const Icon(Icons.volume_up),
                          color: Colors.white,
                          minWidth: 50.0,
                          height: 50.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          onPressed: () async {
                            _tts.speak(
                                translatedPhrase, SelectedTargetLangueLocal);
                          },
                        ),
                        MaterialButton(
                          elevation: 10,
                          splashColor: const Color.fromRGBO(244, 67, 54, 1),
                          textColor: Colors.teal,
                          child: const Icon(Icons.share),
                          color: Colors.white,
                          minWidth: 50.0,
                          height: 50.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          onPressed: () async {
                            if (translatedPhrase.isNotEmpty) {
                              await Share.share(translatedPhrase);
                            }
                          },
                        ),
                      ],
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
