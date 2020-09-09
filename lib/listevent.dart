import 'package:flutter/material.dart';
import 'package:gis_tahura_nuraksa_mobile_flutter/listdetailevent.dart';

class ListEvent extends StatefulWidget {
  @override
  _ListEventState createState() => _ListEventState();
}

class _ListEventState extends State<ListEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Kembali"),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Daftar Event',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Container(
                child: Expanded(
                    child: ListView.separated(
                        physics: PageScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) => 
                        GestureDetector(onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ListDetailEvent(_imageListEvent[index]['name'],index)));
                        },
                          child: imgListEvent(index),)
                        ,
                        separatorBuilder: (context, index) => Divider(
                              indent: 3,
                            ),
                        itemCount: _imageListEvent.length)),
              ),
            ],
          ),
        ));
  }
}

imgListEvent(index) {
  return SizedBox(
    height: 120,
    width: 200,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 180,
          width: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage(
                    _imageListEvent[index]['image'],
                  ),
                  fit: BoxFit.cover)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  _imageListEvent[index]['name'],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  _imageListEvent[index]['cat'],
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  _imageListEvent[index]['open'],
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            )
        )
      ],
    ),
  );
}

final _imageListEvent = {
  {
    'name': 'Ayo ke TAHURA Nuraksa',
    'image': 'images/56.jpg',
    'cat': 'Air Terjun',
    'open': '09.00-17.00 WITA'
  },
  {
    'name': 'Glamor Camping',
    'image': 'images/60.jpg',
    'cat': 'Camping',
    'open': '09.00-17.00 WITA'
  },
  {
    'name': 'Menelusuri Goa Pengkoak',
    'image': 'images/71.jpg',
    'cat': 'Religi',
    'open': '09.00-17.00 WITA'
  },
}.toList();
