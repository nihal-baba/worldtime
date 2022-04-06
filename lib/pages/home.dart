import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
   Map Loc={},homeloc={};
  @override
  Widget build(BuildContext context) {

    Loc=Loc.isNotEmpty?Loc:ModalRoute.of(context)!.settings.arguments as Map;
    homeloc=homeloc.isNotEmpty?homeloc:ModalRoute.of(context)!.settings.arguments as Map;
    String img='morning.jpg',homeimg='morning.jpg';

    switch(Loc['image'])
    {
      case 1:img='morning.jpg';
              break;
      case 2:img='afternoon.jpg';
              break;
      case 3:img='evening.jpg';
              break;
      case 4:img='night.jpg';
    }
    switch(homeloc['homeimage'])
    {
      case 1:homeimg='morning.jpg';
          break;
      case 2:homeimg='afternoon.jpg';
          break;
      case 3:homeimg='evening.jpg';
          break;
      case 4:homeimg='night.jpg';
    }
     var itr=Colors.white;
    return Scaffold(
      backgroundColor: Colors.red,
body: Column(
    children: [
      Expanded(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            image: DecorationImage(
              image: AssetImage('lib/assets/$img'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 60,),
                      RaisedButton.icon(onPressed: ()async{
                   dynamic res= await Navigator.pushNamed(context, '/location');
                   setState(() {
                     Loc={'loc': res['loc'],
                       'flag': res['flag'],
                       'Time': res['Time'],
                       'image':res['image'],
                     };
                    },
                   );
                  }, icon: Icon(Icons.location_on,
                        color:Colors.purple,size: 30,),
                    label: Text('Edit location') ,
                  ),
              SizedBox(height: 20),
              Text(Loc['loc'],style: TextStyle(color:Colors.white,
              fontSize: 40),),
              SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 50),
                    child: Text(Loc['Time'],
                      style: TextStyle(color:itr,
                          fontWeight: FontWeight.bold,
                        fontSize: 70),
                    ),
                  ),
                ],
              ),
              ],
          ),
        ),
      ),
            Expanded(
              child: Container(
                decoration:BoxDecoration(
                  color: Colors.amber,
                  image:DecorationImage(
                    image:AssetImage('lib/assets/$homeimg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    Text(homeloc['homeloc'],style: TextStyle(color:Colors.white,
                        fontSize: 40),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 50),
                          child: Text(homeloc['homeTime'],style: TextStyle(color:itr,fontWeight: FontWeight.bold,
                              fontSize: 70),
                          ),
                        ),
                      ],
                    ),
                     SizedBox(height: 20),
                    RaisedButton.icon(onPressed: ()async{
                      dynamic res= await Navigator.pushNamed(context, '/homeloc');
                      setState(() {
                        homeloc={'homeloc': res['homeloc'],

                          'homeflag': res['homeflag'],
                          'homeTime': res['homeTime'],
                          'homeimage':res['homeimage'],};
                      }
                      );
                    }, icon: Icon(Icons.location_on,color:Colors.red[400],size: 30,),
                      label: Text('Change Home location') ,
                    ),
                  ],
                ),
              ),
            ),
    ],
),
    );
  }
}
