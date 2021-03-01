import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter_peekalink/flutter_peekalink.dart';

void main() {
  runApp(
    MaterialApp(
      home: OEmbedHome(),
    ),
  );
}

class OEmbedHome extends StatefulWidget {
  @override
  _OEmbedHomeState createState() => _OEmbedHomeState();
}

class _OEmbedHomeState extends State<OEmbedHome> {
  TextEditingController controller;
  PeekalinkResponse previewData;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> fetchUrl(final String url) async {
    final Uri _url = Uri.http("api.peekalink.io", "/", {
      "link": url,
      // "key": API.api,
    });
    final response = await http.get(_url.toString());
    final _oEmbedResponse = PeekalinkResponse.fromMap(
      json.decode(
        utf8.decode(response.bodyBytes),
      ),
    );

    setState(() {
      previewData = _oEmbedResponse;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                      onSubmitted: (value) => fetchUrl(value),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => fetchUrl(controller.value.text),
                    child: Text("Preview"),
                  )
                ],
              ),
            ),
            if (previewData != null)
              PeekalinkWidget(
                data: previewData,
                preview: true,
                expanded: false,
              )
          ],
        ),
      ),
    );
  }
}
