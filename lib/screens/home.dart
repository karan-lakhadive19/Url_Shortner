// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = new TextEditingController();

  var shortenLink = '';

  Future<String> getData() async {
    var url = controller.text;
    var response =
        await http.get(Uri.parse('https://api.shrtco.de/v2/shorten?url=$url'));
    var jsonData = jsonDecode(response.body);

    setState(() {
      shortenLink = jsonData['result']['short_link'];
    });
    return 'Success';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Url Shortner"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              controller: controller,
              decoration: InputDecoration(
                label: Text('Url'),
                hintText: 'Enter Url',
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.brown)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.brown),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text('Shortner Link: $shortenLink'),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () {
                  getData();
                }, child: Text('Click to short')),

                ElevatedButton(onPressed: (){
                  FlutterClipboard.copy('$shortenLink');
                }, child: Text('Copy to Clipboard'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
