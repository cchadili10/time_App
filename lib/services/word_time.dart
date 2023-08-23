import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class Wordtime {
  String location;
  String? time;
  String flag;
  String url;
  late bool isDaytime;

  Wordtime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      Uri Url = Uri.parse('http://worldtimeapi.org/api/timezone/$url');
      Response response = await get(Url);
      Map data = jsonDecode(response.body);
      // print(data);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      // print(datetime);
      // print(offset);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      time = 'reror in time';
    }
  }
}
