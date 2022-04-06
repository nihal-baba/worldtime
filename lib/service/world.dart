import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class World {
  late String Location;
  late String Time;
  late String flag;
  late String url;
  late int image;
  World({required this.Location,required this.flag,required this.url,required this.image});

    Future<void> getdata() async
  {
    try {
      Response tim = await get(Uri.parse(
          'https://www.timeapi.io/api/Time/current/zone?timeZone=$url')); //note that get('url')wont work instead use get(Uri.http('url','todos'))
      Map data = jsonDecode(tim.body);
      String ti = data['dateTime'];
      //int offset = data['dst_offset'];
      DateTime now = DateTime.parse(ti);
      //now = now.add(Duration(hours: offset));
      Time=DateFormat.jm().format(now);
      print(now.hour);
   if(now.hour>6&&now.hour<=11){image=1;}
      else if(now.hour>11&&now.hour<=15){image=2;}
      else if(now.hour>15&&now.hour<19){image=3;}
      else if(now.hour>=19) {image=4;}
    }
  catch(err)
  {
    print('error found=$err');
    Time='Can''t print time .Error found';
  }
  }
}
