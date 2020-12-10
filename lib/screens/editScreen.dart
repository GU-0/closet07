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

class EditPage extends StatefulWidget {
  final String uid;
  final String docId;
  final dynamic document;
  EditPage({Key key, @required this.uid, this.docId, this.document})
      : super(key: key);

  @override
  _EditPageState createState() => _EditPageState(uid, docId, document);
}

class _EditPageState extends State<EditPage> {
  final String uid;
  final String docId;
  final dynamic document;
  _EditPageState(this.uid, this.docId, this.document);
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
  void initState() {
    super.initState();
    for (int i = 0; i < document['tag'].length; i++) {
      tagList.add(document['tag'][i]);
      tagItemList.add(Item(title: document['tag'][i]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("수정페이지"),
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
                ? Image.network(document['imageURL'])
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
    var category = clothInfo["category"];
    var material = clothInfo["material"];
    var imageURL = clothInfo["imageURL"];
    var addInfo = clothInfo["addInfo"];
    await clothCollection
        .document(uid)
        .collection(category)
        .document(docID)
        .updateData({
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
    if (_image != null) {
      _image2Firebase(_image);
    }
    return Center(
      child: Stack(
        children: <Widget>[
          Container(
            height: 250,
            width: 250,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: _image == null
                      ? NetworkImage(document['imageURL'])
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
    var tecText = TextEditingController();
    tecText.text = document['addInfo'];
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
