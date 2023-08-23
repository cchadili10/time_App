import 'package:flutter/material.dart';
import 'package:time_app/services/word_time.dart';

class Location extends StatefulWidget {
  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<Wordtime> locations = [
    Wordtime(location: 'Casablanca', flag: 'flag', url: 'Africa/Casablanca'),
    Wordtime(location: 'Cairo', flag: 'flag', url: 'Africa/Cairo'),
    Wordtime(location: 'NewYork', flag: 'flag', url: 'America/New_York'),
    Wordtime(location: 'Seoul', flag: 'flag', url: 'Asia/Seoul'),
    Wordtime(location: 'London', flag: 'flag', url: 'Europe/London')
  ];

  void updatetime(index) async {
    Wordtime wordtime = locations[index];
    await wordtime.getTime();
    Navigator.pop(
      context,
      {
      'location': wordtime.location,
      'flag': wordtime.flag,
      'time': wordtime.time,
      'isDaytime': wordtime.isDaytime
      
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    print('1');
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[800],
          title: Text('choose a Location'),
          centerTitle: true,
          elevation: 0,
        ),
        body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) => Card(
            child: ListTile(
                onTap: () {
                  updatetime(index);
                },
                title: Text(locations[index].location),
                leading: Icon(
                  Icons.flag_circle_rounded,
                )),
          ),
        ));
  }
}
