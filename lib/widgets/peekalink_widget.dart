import 'package:flutter_peekalink/models/peekalink_response_model.dart';
import 'package:flutter_peekalink/theme/peekalink_theme.dart';
import 'package:flutter_peekalink/widgets/link_preview.dart';
import 'package:flutter_peekalink/widgets/link_expanded.dart';
import 'package:flutter_peekalink/theme/theme.dart';
import 'package:flutter/material.dart';

import '../flutter_peekalink.dart';

class PeekalinkWidget extends StatefulWidget {
  PeekalinkWidget({
    Key key,
    @required this.data,
    this.theme,
    @required this.expanded,
    @required this.preview,
  }) : super(key: key);

  final PeekalinkResponse data;
  final PeekalinkThemeData theme;
  final bool expanded;
  final bool preview;

  @override
  _PeekalinkWidgetState createState() => _PeekalinkWidgetState();
}

class _PeekalinkWidgetState extends State<PeekalinkWidget> {
  PeekalinkThemeData _theme;
  @override
  void initState() {
    super.initState();
    updateTheme();
  }

  @override
  void didUpdateWidget(PeekalinkWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.theme != widget.theme) {
      updateTheme();
    }
  }

  void updateTheme() {
    _theme = widget.theme ?? PeekalinkThemeData();
  }

  @override
  Widget build(BuildContext context) {
    return PeekalinkThemeProvider(
      data: _theme,
      child: Builder(
        builder: (BuildContext context) {
          if (widget.expanded) return PeekalinkLinkPreview(data: widget.data);
          if (!widget.expanded) return PeekalinkLinkExpanded(data: widget.data);
          return SizedBox();
        },
      ),
    );
  }
}
