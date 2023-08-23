import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void initState() {
    super.initState();
  }

  var data;
  Map data_ = {};
  // Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments;
    bool whiter  =   data_.isEmpty ? data['isDaytime'] : data_['isDaytime'];
    String bgimage = whiter ? 'day.png' : 'night.jpg';
    Color bgcolor =
        data['isDaytime'] ? Colors.lightBlue : Color.fromARGB(255, 58, 51, 154);

    print(data);
    print('data');
    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/$bgimage'), fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
            child: Column(
              children: [
                TextButton.icon(
                    style: TextButton.styleFrom(foregroundColor: Colors.white),
                    onPressed: () async {
                      dynamic res =
                          await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data_ = {
                          'location': res['location'],
                          'flag': res['flag'],
                          'time': res['time'],
                          'isDaytime': res['isDaytime']
                        };
                        print(data_);
                      });
                    },
                    
                    icon: Icon(Icons.edit_location),
                    label: Text('edit location')),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data_.isEmpty ? data['location'] : data_['location'],
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  data_.isEmpty ? data['time'] : data_['time'],
                  style: TextStyle(fontSize: 50, color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
