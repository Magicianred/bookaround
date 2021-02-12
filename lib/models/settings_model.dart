import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsModel extends ChangeNotifier {
  bool proximitySearchEnabled;
  bool firstStart;
  DateTime lastUpdateTime;

  SettingsModel({
    this.proximitySearchEnabled,
    this.firstStart,
    this.lastUpdateTime,
  });

  @override
  String toString() => "Impostazioni correnti.";

  Future<void> updateFromMemory() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    this.proximitySearchEnabled = preferences.getBool("proximitySearchEnabled");
    this.firstStart = preferences.getBool("firstStart") ?? true;
    this.lastUpdateTime = DateTime.fromMillisecondsSinceEpoch(preferences.getInt("lastUpdateTime") ?? DateTime.now().millisecondsSinceEpoch);

    notifyListeners();
  }

  Future<void> updateInMemory() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    if (this.proximitySearchEnabled != null) await preferences.setBool("proximitySearchEnabled", this.proximitySearchEnabled);
    await preferences.setBool("firstStart", this.firstStart);
    await preferences.setInt("lastUpdateTime", DateTime.now().millisecondsSinceEpoch);

    notifyListeners();
  }
}
