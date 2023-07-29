import 'package:flutter/cupertino.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/download_buttons.dart';

class HtmlViewer extends StatelessWidget {
  const HtmlViewer(this.data, {Key? key, this.style}) : super(key: key);

  final String? data;
  final Map<String, Style>? style;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: data == null
            ? const Center(child: CupertinoActivityIndicator())
            : (data ?? "").isEmpty
                ? Container()
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Html(
                        onLinkTap: (url, _, __) async {
                          final uri = Uri.parse(url!);
                          if (await canLaunchUrl(uri)) {
                            if (url.contains('play.google.com') || url.contains('apps.apple.com')) {
                              await launchUrl(uri, mode: LaunchMode.externalApplication);
                            } else {
                              await launchUrl(uri);
                            }
                          }
                        },
                        data: data!.replaceAll('font-feature-settings: normal;', '').replaceAll('downloadButtons', downloadButtons),
                        style: style ??
                            {
                              "body": Style(fontFamily: "LINESeedKR"),
                              "p": Style(fontFamily: "LINESeedKR"),
                              "span": Style(fontFamily: "LINESeedKR"),
                              "h1": Style(fontFamily: "LINESeedKR"),
                            },
                      ),
                    ),
                  ),
      ),
    );
  }
}
