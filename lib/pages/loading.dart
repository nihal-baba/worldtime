import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:worldtime/service/world.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class load extends StatefulWidget {
  const load({Key? key}) : super(key: key);

  @override
  State<load> createState() => _loadState();
}

class _loadState extends State<load> {

var  Size =40.0;
void data() async{
  World time=World(Location:' Asia\nKolkata',flag:'India.jpg',url:'Asia/Kolkata',image:1);
  await time.getdata();
  Navigator.pushReplacementNamed(context, '/home', arguments: {
      'homeloc':time.Location,
    'homeTime': time.Time,
    'homeimage':time.image,
      'loc': time.Location,
      'flag': time.flag,
      'Time': time.Time,
      'image':time.image,
    }
    );
  print(time);
  }





@override
  void initState() {
    // TODO: implement initState
    data();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.purple[200],
      body: Center(

      child:SpinKitSquareCircle(
        color: Colors.red[400],
        size: 70.0,
        //  controller: AnimationController(vsync: this,duration:Duration(milliseconds: 200)) ,
      ),
      //Text(Time,style: TextStyle(fontSize:Size ,color: Colors.blue,fontWeight: FontWeight.w300),)
      ),
    );

  }
}
