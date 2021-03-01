import 'package:flutter_peekalink/flutter_peekalink.dart';
import 'package:flutter/material.dart';
import 'package:flutter_peekalink/theme/theme.dart';

import '../flutter_peekalink.dart';

class PeekalinkLinkPreview extends StatelessWidget {
  const PeekalinkLinkPreview({
    Key key,
    @required this.data,
  }) : super(key: key);

  final PeekalinkResponse data;

  @override
  Widget build(BuildContext context) {
    final theme = PeekalinkThemeProvider.of(context);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).dividerColor,
          width: .5,
        ),
        borderRadius: BorderRadius.circular(9),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (data.image.url != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(9),
              child: Image.network(
                data.image.url,
                fit: BoxFit.cover,
              ),
            ),
          if (data.description != null)
            data.description.isEmpty
                ? const SizedBox()
                : Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (data.description.isNotEmpty)
                          Text(
                            data.description,
                            style: theme.subheadingText,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                      ],
                    ),
                  ),
        ],
      ),
    );
  }
}
