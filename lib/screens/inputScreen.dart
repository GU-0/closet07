import 'dart:convert';
import 'dart:io';
import 'package:closet07/screens/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_storage/firebase_storage.dart';

class InputPage extends StatefulWidget {
  final String uid;

  InputPage({Key key, @required this.uid}) : super(key: key);
  @override
  _InputPageState createState() => _InputPageState(uid);
}

class _InputPageState extends State<InputPage> {
  final String uid;
  _InputPageState(this.uid);
  var clothCollection = Firestore.instance.collection('cloth');
  File _image;
  final _picker = ImagePicker();
  List categoryList = ["아우터", '셔츠', "긴팔", "반팔", "긴바지", '반바지', '치마', '신발', '기타'];
  List materialList = [
    '기타',
    '폴리',
    '면',
    '울',
    '데님',
    '레이온',
    '아크릴',
    '스웨이드',
    '린넨',
    '캐시미어'
  ];
  String docID = '';
  List tagList = [];
  List tagItemList = [];
  Map clothInfo = {
    "docId": "id",
    "category": "기타",
    "material": "기타",
    'imageURL': "null",
    "addInfo": "",
  };
  final GlobalKey<TagsState> _globalKey = GlobalKey<TagsState>();

  Future getImage(ImageSource imageSource) async {
    final pickedFile = await _picker.getImage(source: imageSource);
    setState(() {
      _image = File(pickedFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("항목 추가", style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(
              Icons.save_alt,
              color: Colors.white,
            ),
            onPressed: () {
              saveInfo();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ViewPage(
                            uid: this.uid,
                          )));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: buildBody(),
      ),
    );
  }

  Widget clothImage() {
    return Center(
      child: Stack(
        children: <Widget>[
          Container(
            height: 250,
            width: 250,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(45)),
            child: _image == null
                ? Image.asset("assets/sample_cloth.png")
                : Image.file(
                    _image,
                    fit: BoxFit.fitWidth,
                  ),
          ),
          Positioned(
            bottom: 20.0,
            right: 20.0,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context, builder: (builder) => imageBottomSheet());
              },
              child: Icon(
                Icons.camera_alt,
                color: Colors.teal,
                size: 28.0,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget imageBottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton.icon(
                  onPressed: () {
                    getImage(ImageSource.camera);
                    try {
                      _image2Firebase(_image);
                    } catch (e) {}
                  },
                  icon: Icon(
                    Icons.camera,
                    size: 35,
                  ),
                  label: Text("사진 촬영")),
              Padding(padding: EdgeInsets.symmetric(horizontal: 30)),
              FlatButton.icon(
                  onPressed: () {
                    getImage(ImageSource.gallery);
                    try {
                      _image2Firebase(_image);
                    } catch (e) {}
                  },
                  icon: Icon(
                    Icons.image,
                    size: 35,
                  ),
                  label: Text("갤러리")),
            ],
          )
        ],
      ),
    );
  }

  Widget categoryBottomSheet() {
    return Container(
        height: 300.0,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView.separated(
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemCount: categoryList.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  setState(() {
                    clothInfo["category"] = categoryList[index];
                    Navigator.pop(context);
                  });
                },
                title: Text(categoryList[index]),
              );
            }));
  }

  Widget materialBottomSheet() {
    return Container(
        height: 300.0,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView.separated(
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemCount: materialList.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  setState(() {
                    clothInfo["material"] = materialList[index];
                    Navigator.pop(context);
                  });
                },
                title: Text(materialList[index]),
              );
            }));
  }

  showAlertDialog(BuildContext context) {
    TextEditingController customController = TextEditingController();

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("태그 추가"),
            content: TextField(
              autofocus: true,
              controller: customController,
            ),
            actions: <Widget>[
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pop(customController.text.toString());
                  var text = customController.text.toString();
                  setState(() {
                    tagList.add(text);
                    tagItemList.add(Item(title: text));
                  });
                },
                elevation: 5.0,
                child: Text("추가"),
              )
            ],
          );
        });
  }

  saveInfo() async {
    try {
      await _image2Firebase(_image);
    } catch (e) {}
    docID = str2Sha512(DateTime.now().toString());
    var category = clothInfo["category"];
    var material = clothInfo["material"];
    var imageURL = clothInfo["imageURL"];
    var addInfo = clothInfo["addInfo"];
    await clothCollection
        .document(uid)
        .collection(category)
        .document(docID)
        .setData({
      "docId": docID,
      "category": category,
      "material": material,
      'imageURL': imageURL,
      "addInfo": addInfo,
      "tag": FieldValue.arrayUnion(tagList)
    });
  }

  String str2Sha512(String text) {
    //메모별 id 랜덤배정을 위한 암호화함수
    var bytes = utf8.encode(text); // data being hashed

    var digest = sha512.convert(bytes);
    return digest.toString();
  }

  Future<void> _image2Firebase(File image) async {
    String randomName = str2Sha512(DateTime.now().toString());
    String imageLocation = 'images/image${randomName}.png';

    final StorageReference storageReference =
        FirebaseStorage().ref().child(imageLocation);
    final StorageUploadTask uploadTask = storageReference.putFile(image);
    await uploadTask.onComplete;
    _addPathToDatabase(imageLocation);
  }

  Future<void> _addPathToDatabase(String text) async {
    final ref = FirebaseStorage().ref().child(text);
    var imageString = await ref.getDownloadURL();

    clothInfo['imageURL'] = imageString;
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
              buildTags(),
              buildAddTags(),
              Divider(
                height: 10.0,
                color: Colors.grey[850],
                thickness: 0.5,
              ),
              buildCategory(),
              Divider(
                height: 10.0,
                color: Colors.grey[850],
                thickness: 0.5,
              ),
              buildMaterial(),
              Divider(
                height: 10.0,
                color: Colors.grey[850],
                thickness: 0.5,
              ),
              buildAddInfo()
            ],
          ),
        ),
      ],
    ));
  }

  Widget buildImage() {
    try {
      _image2Firebase(_image);
    } catch (e) {}
    return Center(
      child: Stack(
        children: <Widget>[
          Container(
            height: 250,
            width: 250,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: _image == null
                      ? AssetImage("assets/sample_cloth.png")
                      : FileImage(
                          _image,
                        ),
                ),
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(45)),
          ),
          Positioned(
            bottom: 20.0,
            right: 20.0,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context, builder: (builder) => imageBottomSheet());
              },
              child: Icon(
                Icons.camera_alt,
                color: Colors.teal,
                size: 28.0,
              ),
            ),
          )
        ],
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
        RaisedButton(
          color: Colors.white,
          onPressed: () {
            showModalBottomSheet(
                context: context, builder: (builder) => categoryBottomSheet());
          },
          child: Text(
            clothInfo["category"] == "null" ? "카테고리" : clothInfo["category"],
          ),
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
        RaisedButton(
            color: Colors.white,
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (builder) => materialBottomSheet());
            },
            child: Text(clothInfo["material"] == "null"
                ? "재질"
                : clothInfo["material"])),
      ],
    );
  }

  Widget buildAddInfo() {
    var tecText = TextEditingController();
    tecText.text = clothInfo['addInfo'];
    return SingleChildScrollView(
      child: TextField(
        decoration: InputDecoration(labelText: '추가 정보'),
        autofocus: false,
        controller: tecText,
        maxLines: null,
        onChanged: (String text) {
          clothInfo["addInfo"] = tecText.text;
        },
      ),
    );
  }

  Widget buildTags() {
    return SingleChildScrollView(
      child: Wrap(
        direction: Axis.horizontal,
        children: [
          Tags(
            horizontalScroll: true,
            heightHorizontalScroll: 60,
            key: _globalKey,
            itemCount: tagItemList.length,
            columns: null,
            itemBuilder: (index) {
              final Item currentItem = tagItemList[index];

              return ItemTags(
                pressEnabled: false,
                activeColor: Color(0xff8FC2EA),
                index: index,
                title: currentItem.title,
                customData: currentItem.customData,
                textStyle: TextStyle(fontSize: 14),
                combine: ItemTagsCombine.withTextBefore,
                removeButton: ItemTagsRemoveButton(onRemoved: () {
                  setState(() {
                    tagItemList.removeAt(index);
                    tagList.removeAt(index);
                  });
                  return true;
                }),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildAddTags() {
    return Container(
      alignment: Alignment.center,
      child: OutlineButton(
          child: Text("#태그 추가"),
          onPressed: () {
            showAlertDialog(context);
          },
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0))),
    );
  }
}
