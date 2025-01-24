import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TextOrLink extends StatelessWidget {
  final String content;
  final TextStyle style;
  const TextOrLink({
    super.key,
    required this.content,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    final Uri? uri = _getUriIfValid(content);

    if (uri != null) {
      return GestureDetector(
        onTap: () => _launchUrl(uri),
        child: Text(
          content,
          style: style.copyWith(color: Colors.blue),
        ),
      );
    } else {
      return Text(
        content,
        style: style,
      );
    }
  }

  Uri? _getUriIfValid(String text) {
    try {
      final uri = Uri.parse(text);
      return uri.hasScheme ? uri : null;
    } catch (e) {
      return null;
    }
  }

  Future<void> _launchUrl(Uri uri) async {
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $uri';
    }
  }
}
