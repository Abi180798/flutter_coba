import 'package:flutter/material.dart';

class ListDetailEvent extends StatefulWidget {
  final String namaEvent;
  final int indexs;
  ListDetailEvent(this.namaEvent, this.indexs);
  @override
  _ListDetailEventState createState() =>
      _ListDetailEventState(this.namaEvent, this.indexs);
}

class _ListDetailEventState extends State<ListDetailEvent> {
  final String namaEvent;
  final int indexs;
  _ListDetailEventState(this.namaEvent, this.indexs);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kembali"),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Detail Event',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Column(children: <Widget>[
              Text("Nama Event: $namaEvent"),
              Text("Index ke-$indexs")
            ],)
          ],
        ),
      ),
    );
  }
}
