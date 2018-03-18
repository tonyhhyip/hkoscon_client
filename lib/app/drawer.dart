import 'package:flutter/material.dart';
import 'const.dart' show PrimaryColor, SecondaryColor, AppTitle;
import 'about.dart' show AboutApp;
import 'router/router.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer(this.items);

  final List<DrawerItem> items;

  @override
  _AppDrawerState createState() => new _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  Widget _buildHeader() {
    const decoration = const BoxDecoration(
      color: PrimaryColor,
    );

    const Text title = const Text(
        AppTitle,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: SecondaryColor,
          fontSize: 30.0,
          fontFamily: 'Roboto',
        )
    );

    return new DrawerHeader(
        decoration: decoration,
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              title,
            ],
          ),
        )
    );
  }

  Iterable<Widget> _buildItems(BuildContext context) {
    return widget.items.map((item) => new ListTile(
      leading: new Icon(item.icon),
      title: new Text(item.title),
      onTap: () {
        Navigator.pop(context);
        Router.of(context).replace(item.route);
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    var header = this._buildHeader();
    List<Widget> children = <Widget>[header];
    children.addAll(this._buildItems(context));
    children.add(new AboutApp());

    return new Drawer(
      child: new ListView(
        children: children,
      ),
    );
  }
}

class DrawerItem {
  String title;
  IconData icon;
  String route;

  DrawerItem({
    this.title,
    this.icon,
    this.route,
  });
}