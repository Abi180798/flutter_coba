import 'package:flutter/material.dart';
import 'package:gis_tahura_nuraksa_mobile_flutter/PetaWisata.dart';

class ListDetailWisata extends StatefulWidget {
  final String namaWisata;
  final int indexs;
  ListDetailWisata(this.namaWisata, this.indexs);
  @override
  _ListDetailWisataState createState() =>
      _ListDetailWisataState(this.namaWisata, this.indexs);
}

class _ListDetailWisataState extends State<ListDetailWisata> {
  final String namaWisata;
  final int indexs;
  _ListDetailWisataState(this.namaWisata, this.indexs);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kembali"),
      ),
      body: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Detail Wisata',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text("Nama Wisata:"),
                      Text("$namaWisata"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text("Index ke-"),
                      Text("$indexs"),
                    ],
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PetaWisata(-8.520387, 116.283115)));
                    },
                    child: Text("Lihat Peta"),
                  )
                ],
              ),
            ],
          )),
    );
  }
}
