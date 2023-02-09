import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/dictionary_model.dart';
import 'package:http/http.dart';

class MyDictionary extends StatefulWidget {
  const MyDictionary({Key? key}) : super(key: key);

  @override
  State<MyDictionary> createState() => _MyDictionaryState();
}

class _MyDictionaryState extends State<MyDictionary> {
  final String _url = "https://owlbot.info/api/v4/dictionary/owl";
  final String _token = "a0ae2b7edc124cc9c9ff5324660b93e6e3dc4ab9";

  final TextEditingController _controller = TextEditingController();

  late StreamController<DictionModel?> _streamController;
  late Stream _stream;
  DictionModel? dictionModel;

  late Timer _debounce;

  _search() async {
    if (_controller.text.isEmpty) {
      _streamController.add(null);
    }

    _streamController.add(null);
    Response response = await get(Uri.parse(_url + _controller.text.trim()),
        headers: {
          "Authorization": "Token a0ae2b7edc124cc9c9ff5324660b93e6e3dc4ab9"
        });
    print(response.body);
    if (response.statusCode == 200) {
      dictionModel = DictionModel.fromJson(jsonDecode(response.body));
      _streamController.add(DictionModel.fromJson(jsonDecode(response.body)));
      // setState(() {});
    }
    // _streamController.add(response.body);
    // _stream = _streamController.stream;
  }

  @override
  void initState() {
    super.initState();
    _streamController = StreamController();
    _search();
    _stream = _streamController.stream;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dictionary"),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 12.0, bottom: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: TextFormField(
                    onChanged: (String text) {
                      if (_debounce.isActive) _debounce.cancel();
                      _debounce = Timer(const Duration(milliseconds: 1000), () {
                        _search();
                      });
                    },
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: "Search a Word",
                      contentPadding: EdgeInsets.only(left: 24),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {
                  _search();
                },
              ),
            ],
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(8.0),
        child: StreamBuilder(
          stream: _stream,
          builder: (BuildContext ctx, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(
                child: Text("Enter a Word"),
              );
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            // final data = snapshot.requireData as DictionModel;
            return Text(snapshot.requireData.toString());
            // return HtmlWidget(
            //   // the first parameter (`html`) is required
            //   snapshot.requireData,

            //   // all other parameters are optional, a few notable params:

            //   // specify custom styling for an element
            //   // see supported inline styling below
            //   customStylesBuilder: (element) {
            //     if (element.classes.contains('foo')) {
            //       return {'color': 'red'};
            //     }

            //     return null;
            //   },

            //   // render a custom widget
            //   // customWidgetBuilder: (element) {
            //   //   if (element.attributes['foo'] == 'bar') {
            //   //     return FooBarWidget();
            //   //   }

            //   //   return null;
            //   // },

            //   // turn on selectable if required (it's disabled by default)
            //   isSelectable: true,

            //   // these callbacks are called when a complicated element is loading
            //   // or failed to render allowing the app to render progress indicator
            //   // and fallback widget
            //   onErrorBuilder: (context, element, error) =>
            //       Text('$element error: $error'),
            //   onLoadingBuilder: (context, element, loadingProgress) =>
            //       const CircularProgressIndicator(),

            //   // this callback will be triggered when user taps a link
            //   // onTapUrl: (url) => print('tapped $url'),

            //   // select the render mode for HTML body
            //   // by default, a simple `Column` is rendered
            //   // consider using `ListView` or `SliverList` for better performance
            //   renderMode: RenderMode.column,

            //   // set the default styling for text
            //   textStyle: const TextStyle(fontSize: 14),

            //   // turn on `webView` if you need IFRAME support (it's disabled by default)
            //   webView: true,
            // );

            // return ListView.builder(
            //     itemCount: snapshot.data['definitions'].length,
            //     itemBuilder: (BuildContext context, int index) {
            //       return ListBody(
            //         children: [
            //           Container(
            //             color: Colors.grey,
            //             child: ListTile(
            //               leading: snapshot.data["definitions"][index]
            //                           ["image_url"] ==
            //                       null
            //                   ? null
            //                   : CircleAvatar(
            //                       backgroundImage: NetworkImage(snapshot
            //                           .data["definitions"][index]["image_url"]),
            //                     ),
            //               title: Text(_controller.text.trim() +
            //                   "(" +
            //                   snapshot.data["definitions"][index]["type"] +
            //                   ")"),
            //             ),
            //           ),
            //           Padding(
            //             padding: const EdgeInsets.all(8.0),
            //             child: Text(
            //                 snapshot.data["definitions"][index]["definition"]),
            //           )
            //         ],
            //       );
            //     });
          },
        ),
      ),
    );
  }
}
