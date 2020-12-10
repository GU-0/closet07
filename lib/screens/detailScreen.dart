import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'editScreen.dart';

class DetailPage extends StatefulWidget {
  final String uid;
  final String docId;
  final dynamic document;
  DetailPage({Key key, @required this.uid, this.docId, this.document})
      : super(key: key);
  @override
  _DetailPageState createState() => _DetailPageState(uid, docId, document);
}

class _DetailPageState extends State<DetailPage> {
  final String uid;
  final String docId;
  final dynamic document;
  _DetailPageState(this.uid, this.docId, this.document);

  String loadTags() {
    String result = '';
    if (document['tag'].length == 0) {
      return result;
    } else {
      for (int i = 0; i < document['tag'].length; i++) {
        result = result + "#" + document['tag'][i] + "       ";
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '세부정보',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.delete_outline),
              onPressed: () {
                showAlertDialog(context);
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: buildBody(),
      ),
    );
  }

  Widget buildBody() {
    return (Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white, Color(0xff8FC2EA)])),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildImage(),
              Padding(padding: EdgeInsets.all(8)),
              Center(child: buildTags()),
              Padding(padding: EdgeInsets.all(8)),
              Divider(
                height: 10.0,
                color: Colors.grey[850],
                thickness: 0.5,
              ),
              Padding(padding: EdgeInsets.all(4)),
              buildCategory(),
              Padding(padding: EdgeInsets.all(4)),
              Divider(
                height: 10.0,
                color: Colors.grey[850],
                thickness: 0.5,
              ),
              Padding(padding: EdgeInsets.all(4)),
              buildMaterial(),
              Padding(padding: EdgeInsets.all(4)),
              Divider(
                height: 10.0,
                color: Colors.grey[850],
                thickness: 0.5,
              ),
              Padding(padding: EdgeInsets.all(8)),
              buildAddInfo()
            ],
          ),
        ),
      ],
    ));
  }

  Widget buildImage() {
    return Center(
      child: Container(
        height: 250,
        width: 250,
        decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(document['imageURL'])),
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(45)),
      ),
    );
  }

  Widget buildCategory() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '카테고리',
          style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              letterSpacing: 2.0,
              fontWeight: FontWeight.bold),
        ),
        Text(
          document['category'],
          style: TextStyle(
              color: Colors.black, letterSpacing: 2.0, fontSize: 16.0),
        ),
      ],
    );
  }

  Widget buildMaterial() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '재질',
          style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              letterSpacing: 2.0,
              fontWeight: FontWeight.bold),
        ),
        Text(
          document['material'],
          style: TextStyle(
              color: Colors.black, letterSpacing: 2.0, fontSize: 16.0),
        ),
      ],
    );
  }

  Widget buildAddInfo() {
    return SingleChildScrollView(child: Text(document['addInfo']));
  }

  Widget buildTags() {
    return SingleChildScrollView(
      child: Wrap(
        direction: Axis.horizontal,
        children: [Text(loadTags())],
      ),
    );
  }

  void showAlertDialog(BuildContext context) async {
    await showDialog(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          content: Text("정말 삭제하시겠습니까?"),
          actions: <Widget>[
            FlatButton(
              child: Text('취소'),
              textColor: Colors.black,
              onPressed: () {
                Navigator.pop(context, "취소");
              },
            ),
            FlatButton(
              child: Text('삭제'),
              textColor: Colors.black,
              onPressed: () {
                Navigator.pop(context, "삭제");
                setState(() {
                  deleteCloth();
                  Navigator.pop(context);
                });
              },
            ),
          ],
        );
      },
    );
  }

  deleteCloth() async {
    await Firestore.instance
        .collection('cloth')
        .document(uid)
        .collection(document['category'])
        .document(docId)
        .delete();
  }
}
