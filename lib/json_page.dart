import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/language_model.dart';

class jsonPage extends StatefulWidget {
  var callBack;
  jsonPage({key, this.callBack});

  @override
  State<jsonPage> createState() => _jsonPageState();
}

class _jsonPageState extends State<jsonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Language List'),
      ),
      body: SingleChildScrollView(
          child: FutureBuilder(
        builder: (context, snapshot) {
          Map<String, LanguageModel> listOFLanguags =
              languageModelFromJson(snapshot.data.toString());
          return Column(
            children: listOFLanguags.entries.map((e) {
              return ListTile(
                onTap: () {
                  print(e.key);
                  widget.callBack(e);
                  Navigator.pop(context);
                },
                title: Text(e.value.name),
                subtitle: Text(e.value.nativeName),
              );
            }).toList(),
          );
        },
        future: DefaultAssetBundle.of(context)
            .loadString("assets/source_language.json"),
      )),
    );
  }
}
