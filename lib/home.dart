import 'package:flutter/material.dart';
import 'package:gis_tahura_nuraksa_mobile_flutter/listwisata.dart';
import 'package:gis_tahura_nuraksa_mobile_flutter/listevent.dart';
import 'package:gis_tahura_nuraksa_mobile_flutter/src/api/eventAPI.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    EventService().getProfiles().then((value) => print("value: $value"));
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("TAHURA Nuraksa"),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //LIST VIEW CAROUSEL - 1
                      Padding(
                        padding: EdgeInsets.only(top: 5, bottom: 10),
                        child: Text(
                          'Selamat datang di TAHURA Nuraksa',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),

                      Text(
                        'Tahura Nuraksa merupakan satu-satunya Kawasan Konservasi di NTB dan memiliki potensi wisata alam yang menarik untuk dikunjungi dan dinikmati sebagai ajang rekreasi,',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.5, color: Colors.grey),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Icon(
                                    Icons.info_outline,
                                    color: Colors.red,
                                  ),
                                ),
                                Text(
                                  'Informasi',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                )
                              ],
                            ),
                            Divider(),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 1.0, left: 8, bottom: 5),
                              child: Text(
                                'Jangan membuang sampah sekecil apapun selama berada dilokasi pariwisata, cagar budaya dan cagar alam adalah milik bersama, maka lestarikanlah.',
                                style: TextStyle(color: Colors.grey),
                              ),
                            )
                          ],
                        ),
                      ),
                      //LIST VIEW WISATA - 2
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ListWisata()));
                        },
                        child: Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 5),
                          child: Text(
                            'Daftar Wisata',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                      ),

                      Container(
                        child: Expanded(
                            child: ListView.separated(
                                physics: PageScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) =>
                                    imgListWisata(index),
                                separatorBuilder: (context, index) => Divider(
                                      indent: 3,
                                    ),
                                itemCount: _imageListWisata.length)),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ListEvent()));
                        },
                        child: Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: Text(
                            'Daftar Event',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                      ),

                      Container(
                        child: Expanded(
                            child: ListView.separated(
                                physics: PageScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) =>
                                    imgListWisata(index),
                                separatorBuilder: (context, index) => Divider(
                                      indent: 3,
                                    ),
                                itemCount: _imageListWisata.length)),
                      ),
                      //LIST VIEW EVENT - 3
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

imgListWisata(index) {
  return SizedBox(
    height: 450,
    width: 200,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 420,
          width: 180,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage(
                    _imageListWisata[index]['image'],
                  ),
                  fit: BoxFit.cover)),
        ),
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