import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String url;

  final PreferredSizeWidget bottom;
  final List<Widget> customActions;
  @override
  final Size preferredSize;

  DefaultAppBar(this.title, this.url, {this.bottom, this.customActions})
      : preferredSize = Size.fromHeight(
            kToolbarHeight + (bottom?.preferredSize?.height ?? 0.0));

  @override
  Widget build(BuildContext context) {
    List<Widget> actions = [];
    actions.add(FlatButton(
        child: Icon(Icons.info_outline, color: Colors.white),
        onPressed: _launchURL));
    if (customActions != null) {
      actions.addAll(customActions);
    }
    return AppBar(title: Text(title), actions: actions);
  }

  _launchURL() async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
