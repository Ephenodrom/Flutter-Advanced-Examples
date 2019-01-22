import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String url;

  final PreferredSizeWidget bottom;
  @override
  final Size preferredSize;

  DefaultAppBar(this.title, this.url, {this.bottom})
      : preferredSize = Size.fromHeight(
            kToolbarHeight + (bottom?.preferredSize?.height ?? 0.0));

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: <Widget>[
        FlatButton(
            child: Icon(Icons.info_outline, color: Colors.white),
            onPressed: _launchURL)
      ],
    );
  }

  _launchURL() async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch ${url}';
    }
  }
}
