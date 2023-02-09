import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_application_1/Models/dictionary_model.dart';

class DictionaryView extends StatefulWidget {
  const DictionaryView({Key? key}) : super(key: key);

  @override
  State<DictionaryView> createState() => _DictionaryViewState();
}

class _DictionaryViewState extends State<DictionaryView> {
  final TextEditingController searchController = TextEditingController();
  // DictionModel? dictionModel;
  String word = 'owl';
  Future<DictionModel> getData(String searchword) async {
    final response = await http.get(
        Uri.parse('https://owlbot.info/api/v4/dictionary/$searchword'),
        headers: {
          "Authorization": "Token a0ae2b7edc124cc9c9ff5324660b93e6e3dc4ab9"
        });
    if (response.statusCode == 200) {
      return DictionModel.fromJson(jsonDecode(response.body));
    } else {
      throw HttpException(response.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dictionary'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40.0),
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
                    controller: searchController,
                    decoration: const InputDecoration(
                      hintText: "Search for A Word",
                      contentPadding: EdgeInsets.only(left: 24.0),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.search,
                  size: 35.0,
                  color: Colors.white,
                ),
                onPressed: () {
                  word = searchController.text;
                  setState(() {});
                },
              )
            ],
          ),
        ),
      ),
      body: FutureBuilder<DictionModel>(
          future: getData(word),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              final diction = snapshot.requireData;
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      diction.definitions != null
                          ? ListView.builder(
                              shrinkWrap: true,
                              itemCount: diction.definitions!.length,
                              itemBuilder: (context, index) {
                                final definationData =
                                    diction.definitions![index];
                                return Container(
                                  padding: const EdgeInsets.only(
                                      left: 20, top: 10, right: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Word: ${diction.word} \n',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                          'Prnounciation: ${diction.pronunciation} \n'),
                                      definationData.imageUrl != null
                                          ? Image.network(
                                              definationData.imageUrl!)
                                          : const SizedBox(),
                                      Text(
                                        '\n Defination: ${definationData.definition} \n',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      //Text('Emoji: ${definationData.emoji}'),
                                      Text(
                                          'Example: ${definationData.example} \n'),
                                      Text('Type: ${definationData.type} \n'),
                                    ],
                                  ),
                                );
                              })
                          : const Text('Definations are not found'),
                    ],
                  ),
                ),
              );
            } else {
              return Text(' error ${snapshot.error}');
            }
          }),
    );
  }
}
