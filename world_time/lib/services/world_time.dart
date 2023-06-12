import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location name for the UI
  String time;
  String flag;
  String urlTail;

  WorldTime({
    required this.location,
    required this.flag,
    required this.urlTail,
    required this.time,
  });

  Future<void> getTimeData() async {
    try {
      Response response = await get(Uri.parse(
          "https://timeapi.io/api/Time/current/zone?timeZone=$urlTail"));
      Map data = jsonDecode(response.body);

      String dateTime = data['dateTime'];

      DateTime now = DateTime.parse(dateTime);

      time = DateFormat.jm().format(now);
    } catch (e) {
      print('caught error: $e');
      time = 'could not get time data';
    }
  }
}

WorldTime instance = WorldTime(
  location: 'Berlin',
  flag: 'germany.png',
  urlTail: 'Europe/Berlin',
  time: '',
);
