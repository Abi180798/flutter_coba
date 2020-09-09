import 'package:flutter/material.dart';
import 'package:gis_tahura_nuraksa_mobile_flutter/listdetailwisata.dart';

class ListWisata extends StatefulWidget {
  @override
  _ListWisataState createState() => _ListWisataState();
}

class _ListWisataState extends State<ListWisata> {
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
                  'Daftar Wisata',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Container(
                child: Expanded(
                    child: ListView.separated(
                        physics: PageScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ListDetailWisata(
                                            _imageListWisata[index]['name'],
                                            index)));
                              },
                              child: imgListWisata(index),
                            ),
                        separatorBuilder: (context, index) => Divider(
                              indent: 3,
                            ),
                        itemCount: _imageListWisata.length)),
              ),
            ],
          ),
        ));
  }
}

imgListWisata(index) {
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
                    _imageListWisata[index]['image'],
                  ),
                  fit: BoxFit.cover)),
        ),
        Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  _imageListWisata[index]['name'],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  _imageListWisata[index]['cat'],
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  _imageListWisata[index]['open'],
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ))
      ],
    ),
  );
}

final _imageListWisata = {
  {
    'name': 'Air Terjun Segenter',
    'image': 'images/56.jpg',
    'cat': 'Air Terjun',
    'open': '09.00-17.00 WITA'
  },
  {
    'name': 'Stipak Camping Ground',
    'image': 'images/60.jpg',
    'cat': 'Camping',
    'open': '09.00-17.00 WITA'
  },
  {
    'name': 'Goa Pengkoak',
    'image': 'images/71.jpg',
    'cat': 'Religi',
    'open': '09.00-17.00 WITA'
  },
}.toList();
