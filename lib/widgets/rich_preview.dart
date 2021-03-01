import 'package:flutter_peekalink/models/peekalink_response_model.dart';
import 'package:flutter/material.dart';

import '../flutter_peekalink.dart';

//TODO(Nash): Find an optimal way to display rich content in the application.
class RichPreview extends StatelessWidget {
  const RichPreview({Key key, @required this.data}) : super(key: key);

  final PeekalinkResponse data;
  @override
  Widget build(BuildContext context) {
    if (data.image.url == null && data.url != null) {
      return SizedBox();
    }
    return SizedBox();
  }
}
