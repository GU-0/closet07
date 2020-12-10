import 'package:closet07/controllers/authentication.dart';
import 'package:closet07/screens/cleaning.dart';
import 'package:closet07/screens/cody.dart';
import 'package:closet07/screens/detailScreen.dart';
import 'package:closet07/screens/inputScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../main.dart';

class ViewPage extends StatefulWidget {
  final String uid;

  ViewPage({Key key, @required this.uid}) : super(key: key);

  @override
  _ViewPageState createState() => _ViewPageState(uid);
}

class _ViewPageState extends State<ViewPage> {
  var clothCollection = Firestore.instance.collection('cloth');
  List categoryList = ["아우터", '셔츠', "긴팔", "반팔", "긴바지", '반바지', '치마', '신발', '기타'];
  final String uid;
  _ViewPageState(this.uid);

  var clothcollections = Firestore.instance.collection('clothes');
  String cloth;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categoryList.length,
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => InputPage(
                          uid: this.uid,
                        )),
              );
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          appBar: AppBar(
            title: Text(
              "옷장",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "tepeno",
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.power_settings_new),
                color: Colors.white,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () => signOutUser().then((value) {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => HomePage()),
                      (Route<dynamic> route) => false);
                }),
              )
            ],
            bottom: PreferredSize(
              preferredSize: Size(85, 85),
              child: Container(
                height: 85,
                child: TabBar(
                    unselectedLabelColor: Colors.white,
                    indicatorColor: Colors.white,
                    isScrollable: true,
                    tabs: <Widget>[
                      Container(
                        height: 85,
                        child: Tab(
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 25,
                                backgroundImage:
                                    ExactAssetImage('assets/outer.png'),
                              ),
                              Padding(padding: EdgeInsets.all(2.5)),
                              Text(
                                '아우터',
                                style: TextStyle(
                                    fontSize: 13, color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 85,
                        child: Tab(
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 25,
                                backgroundImage:
                                    ExactAssetImage('assets/shirt.png'),
                              ),
                              Padding(padding: EdgeInsets.all(2.5)),
                              Text(
                                '셔츠',
                                style: TextStyle(fontSize: 13),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 85,
                        child: Tab(
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 25,
                                backgroundImage:
                                    ExactAssetImage('assets/Lsleeve.png'),
                              ),
                              Padding(padding: EdgeInsets.all(2.5)),
                              Text(
                                '긴팔',
                                style: TextStyle(fontSize: 13),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 85,
                        child: Tab(
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 25,
                                backgroundImage:
                                    ExactAssetImage('assets/Ssleeve.png'),
                              ),
                              Padding(padding: EdgeInsets.all(2.5)),
                              Text(
                                '반팔',
                                style: TextStyle(fontSize: 13),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 85,
                        child: Tab(
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 25,
                                backgroundImage:
                                    ExactAssetImage('assets/Lpants.png'),
                              ),
                              Padding(padding: EdgeInsets.all(2.5)),
                              Text(
                                '긴바지',
                                style: TextStyle(fontSize: 13),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 85,
                        child: Tab(
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 25,
                                backgroundImage:
                                    ExactAssetImage('assets/Spants.png'),
                              ),
                              Padding(padding: EdgeInsets.all(2.5)),
                              Text(
                                '반바지',
                                style: TextStyle(fontSize: 13),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 85,
                        child: Tab(
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 25,
                                backgroundImage:
                                    ExactAssetImage('assets/skirt.png'),
                              ),
                              Padding(padding: EdgeInsets.all(2.5)),
                              Text(
                                '치마',
                                style: TextStyle(fontSize: 13),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 85,
                        child: Tab(
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 25,
                                backgroundImage:
                                    ExactAssetImage('assets/shoe.png'),
                              ),
                              Padding(padding: EdgeInsets.all(2.5)),
                              Text(
                                '신발',
                                style: TextStyle(fontSize: 13),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 85,
                        child: Tab(
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 25,
                                backgroundImage:
                                    ExactAssetImage('assets/etc.png'),
                              ),
                              Padding(padding: EdgeInsets.all(2.5)),
                              Text(
                                '기타',
                                style: TextStyle(fontSize: 13),
                              )
                            ],
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ),
          drawer: Drawer(
              child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/logo.png'),
                      radius: 35,
                      backgroundColor: Color(0xff8FC2EA),
                    ),
                    Text(
                      "   옷뚜기",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 21,
                          color: Colors.white),
                    ),
                  ],
                ),
                decoration: BoxDecoration(color: Color(0xff8FC2EA)),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CodyPage()));
                },
                child: ListTile(
                  title: Text(
                    "날씨별 추천 코디",
                    style: TextStyle(fontSize: 16),
                  ),
                  tileColor: Colors.grey[100],
                ),
              ),
              Divider(
                height: 10.0,
                color: Colors.grey[850],
                thickness: 0.5,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CleanPage()));
                },
                child: ListTile(
                  title: Text(
                    "소재별 세탁 방법",
                    style: TextStyle(fontSize: 16),
                  ),
                  tileColor: Colors.grey[100],
                ),
              ),
            ],
          )),
          body: TabBarView(children: <Widget>[
            loadImageUrl('아우터'),
            loadImageUrl('셔츠'),
            loadImageUrl('긴팔'),
            loadImageUrl('반팔'),
            loadImageUrl('긴바지'),
            loadImageUrl('반바지'),
            loadImageUrl('치마'),
            loadImageUrl('신발'),
            loadImageUrl('기타'),
          ])),
    );
  }

  loadImageUrl(category) {
    return StreamBuilder(
        stream: Firestore.instance
            .collection('cloth')
            .document(uid)
            .collection(category)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Text(''),
            );
          }
          var items = snapshot.data?.documents ?? [];

          return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.0,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return buildListItem(context, items[index]);
              });
        });
  }

  Widget buildListItem(context, document) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage(
                      uid: uid,
                      docId: document['docId'],
                      document: document,
                    )));
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(image: NetworkImage(document['imageURL']))),
      ),
    );
  }
}
