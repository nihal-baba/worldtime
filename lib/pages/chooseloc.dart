import 'package:flutter/material.dart';
import 'package:worldtime/service/world.dart';
class chooseloc extends StatefulWidget {
  const chooseloc({Key? key}) : super(key: key);

  @override
  State<chooseloc> createState() => _chooselocState();
}

class _chooselocState extends State<chooseloc> {
    List<World> locations=[
      World(Location:'America\n   Puerto Rico',flag:'America.jpg',url:'America/Dominica',image:1),
      World(Location:'Atlantic\n    Bermuda',flag:'Bermuda.jpg',url:'Atlantic/Bermuda',image:1),
      World(Location:'Australia\n   Melbourne',flag:'Australia.jpg',url:'Australia/Melbourne',image:1),
      World(Location:'America\n   Toronto',flag:'Canada.jpg',url:'America/Toronto',image:1),
      World(Location:' Asia\nKolkata',flag:'India.jpg',url:'Asia/Kolkata',image:1),
      World(Location:'Asia\nKabul',flag:'Afghanistan.png',url:'Asia/Kabul',image:1),
      World(Location:'Asia\nBaghdad',flag:'Iraq.jpg',url:'Asia/Baghdad',image:1),
      World(Location:'Asia\nDubai',flag:'Dubai.jpg',url:'Asia/Dubai',image:1),
      World(Location:'Asia\nBangkok',flag:'Thailand.jpg',url:'Asia/Bangkok',image:1),
      World(Location:'Asia\nDhaka',flag:'Bangladesh.jpg',url:'Asia/Dhaka',image:1),
      World(Location:'Asia\nColombo',flag:'srilanka.jpg',url:'Asia/Colombo',image:1),
      World(Location:'Asia\nHong Kong',flag:'HongKon.jpg',url:'	Hongkong',image:1),
      World(Location:'Asia\nTokyo',flag:'Japan.jpg',url:'Asia/Tokyo',image:1),
    ];

    void update(index)async{
      World time=locations[index];
      await time.getdata();
      print(time.Time);
      Navigator.pop(context,{ 'loc': time.Location,
        'flag': time.flag,
        'Time': time.Time,
        'image':time.image,}
      );
    }

   @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: Text("Choose Location Page"),
        backgroundColor: Colors.purple[500],
      ),
      body: ListView.builder(itemCount:locations.length
          ,itemBuilder: (context,index){
        return Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              onTap: (){
                update(index);
              },
              title: Text(locations[index].Location),
              leading:CircleAvatar(backgroundImage: AssetImage('lib/assets/${locations[index].flag}'),),
            ),
          ),
        );
        },),

    );
  }
}
