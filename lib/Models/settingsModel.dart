import 'package:flutter/cupertino.dart';

class SettingsModel {
  String title = "";
  IconData icon;
  Widget action;

  SettingsModel({
    @required this.title,
    @required this.icon,
    @required this.action,
  });
}
