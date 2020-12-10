import 'package:flutter/material.dart';

class CodyPage extends StatefulWidget {
  @override
  _CodyPageState createState() => _CodyPageState();
}

class _CodyPageState extends State<CodyPage> {
  String inputs = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('추천 코디'),
          centerTitle: true,
          backgroundColor: Color(0xff8FC2EA),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.asset('assets/cody/codyImage.png'),
              Container(
                child: TextField(
                    style: TextStyle(fontSize: 32, color: Colors.grey),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(hintText: '기온 입력'),
                    onChanged: (String str) {
                      setState(() => inputs = str);
                    }),
              ),
              RaisedButton(
                child: Text('검색', style: TextStyle(fontSize: 24)),
                onPressed: () {
                  if (int.parse(inputs) >= 27) {
                    Navigator.push(context, MaterialPageRoute<void>(
                        builder: (BuildContext context) {
                      return Summer1();
                    }));
                  } else if (int.parse(inputs) >= 23 &&
                      int.parse(inputs) < 27) {
                    Navigator.push(context, MaterialPageRoute<void>(
                        builder: (BuildContext context) {
                      return Summer2();
                    }));
                  } else if (int.parse(inputs) >= 20 &&
                      int.parse(inputs) < 23) {
                    Navigator.push(context, MaterialPageRoute<void>(
                        builder: (BuildContext context) {
                      return Summer3();
                    }));
                  } else if (int.parse(inputs) >= 17 &&
                      int.parse(inputs) < 20) {
                    Navigator.push(context, MaterialPageRoute<void>(
                        builder: (BuildContext context) {
                      return Fall1();
                    }));
                  } else if (int.parse(inputs) >= 12 &&
                      int.parse(inputs) < 17) {
                    Navigator.push(context, MaterialPageRoute<void>(
                        builder: (BuildContext context) {
                      return Fall2();
                    }));
                  } else if (int.parse(inputs) >= 9 && int.parse(inputs) < 12) {
                    Navigator.push(context, MaterialPageRoute<void>(
                        builder: (BuildContext context) {
                      return Winter1();
                    }));
                  } else if (int.parse(inputs) >= 5 && int.parse(inputs) < 9) {
                    Navigator.push(context, MaterialPageRoute<void>(
                        builder: (BuildContext context) {
                      return Winter2();
                    }));
                  } else if (int.parse(inputs) <= 4) {
                    Navigator.push(context, MaterialPageRoute<void>(
                        builder: (BuildContext context) {
                      return Winter3();
                    }));
                  }
                },
                color: Color(0xff8FC2EA),
                textColor: Colors.white,
              )
            ],
          ),
        ));
  }
}

class Summer1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('27도 이상 추천 코디'),
          centerTitle: true,
          backgroundColor: Color(0xff8FC2EA),
        ),
        body: GridView.count(
          padding: const EdgeInsets.all(5.0),
          mainAxisSpacing: 5.0,
          crossAxisSpacing: 10.0,
          crossAxisCount: 2,
          children: <Widget>[
            Image.asset('assets/cody/271.PNG'),
            Image.asset('assets/cody/272.PNG'),
            Image.asset('assets/cody/273.PNG'),
            Image.asset('assets/cody/274.PNG'),
            Image.asset('assets/cody/275.PNG'),
            Image.asset('assets/cody/276.PNG'),
            Image.asset('assets/cody/277.PNG'),
            Image.asset('assets/cody/278.PNG'),
          ],
        ));
  }
}

class Summer2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('23~27도 추천 코디'),
          centerTitle: true,
          backgroundColor: Color(0xff8FC2EA),
        ),
        body: GridView.count(
          padding: const EdgeInsets.all(5.0),
          mainAxisSpacing: 5.0,
          crossAxisSpacing: 10.0,
          crossAxisCount: 2,
          children: <Widget>[
            Image.asset('assets/cody/23261.PNG'),
            Image.asset('assets/cody/23262.PNG'),
            Image.asset('assets/cody/23263.PNG'),
            Image.asset('assets/cody/23264.PNG'),
            Image.asset('assets/cody/23265.PNG'),
            Image.asset('assets/cody/23266.PNG'),
            Image.asset('assets/cody/23267.PNG'),
            Image.asset('assets/cody/23268.PNG'),
          ],
        ));
  }
}

class Summer3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('20~23도 추천 코디'),
          centerTitle: true,
          backgroundColor: Color(0xff8FC2EA),
        ),
        body: GridView.count(
          padding: const EdgeInsets.all(5.0),
          mainAxisSpacing: 5.0,
          crossAxisSpacing: 10.0,
          crossAxisCount: 2,
          children: <Widget>[
            Image.asset('assets/cody/20221.PNG'),
            Image.asset('assets/cody/20222.PNG'),
            Image.asset('assets/cody/20223.PNG'),
            Image.asset('assets/cody/20224.PNG'),
            Image.asset('assets/cody/20225.PNG'),
            Image.asset('assets/cody/20226.PNG'),
            Image.asset('assets/cody/20227.PNG'),
            Image.asset('assets/cody/20228.PNG'),
          ],
        ));
  }
}

class Fall1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('17~20도 추천 코디'),
          centerTitle: true,
          backgroundColor: Color(0xff8FC2EA),
        ),
        body: GridView.count(
          padding: const EdgeInsets.all(5.0),
          mainAxisSpacing: 5.0,
          crossAxisSpacing: 10.0,
          crossAxisCount: 2,
          children: <Widget>[
            Image.asset('assets/cody/17191.PNG'),
            Image.asset('assets/cody/17192.PNG'),
            Image.asset('assets/cody/17193.PNG'),
            Image.asset('assets/cody/17194.PNG'),
            Image.asset('assets/cody/17195.PNG'),
            Image.asset('assets/cody/17196.PNG'),
            Image.asset('assets/cody/17197.PNG'),
            Image.asset('assets/cody/17198.PNG'),
          ],
        ));
  }
}

class Fall2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('12~17도 추천 코디'),
          centerTitle: true,
          backgroundColor: Color(0xff8FC2EA),
        ),
        body: GridView.count(
          padding: const EdgeInsets.all(5.0),
          mainAxisSpacing: 5.0,
          crossAxisSpacing: 10.0,
          crossAxisCount: 2,
          children: <Widget>[
            Image.asset('assets/cody/12161.PNG'),
            Image.asset('assets/cody/12162.PNG'),
            Image.asset('assets/cody/12163.PNG'),
            Image.asset('assets/cody/12164.PNG'),
            Image.asset('assets/cody/12165.PNG'),
            Image.asset('assets/cody/12166.PNG'),
            Image.asset('assets/cody/12167.PNG'),
            Image.asset('assets/cody/12168.PNG'),
          ],
        ));
  }
}

class Winter1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('9~12도 추천 코디'),
          centerTitle: true,
          backgroundColor: Color(0xff8FC2EA),
        ),
        body: GridView.count(
          padding: const EdgeInsets.all(5.0),
          mainAxisSpacing: 5.0,
          crossAxisSpacing: 10.0,
          crossAxisCount: 2,
          children: <Widget>[
            Image.asset('assets/cody/10111.PNG'),
            Image.asset('assets/cody/10112.PNG'),
            Image.asset('assets/cody/10113.PNG'),
            Image.asset('assets/cody/10114.PNG'),
            Image.asset('assets/cody/10115.PNG'),
            Image.asset('assets/cody/10116.PNG'),
            Image.asset('assets/cody/10117.PNG'),
            Image.asset('assets/cody/10118.PNG'),
          ],
        ));
  }
}

class Winter2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('5~9도 추천 코디'),
          centerTitle: true,
          backgroundColor: Color(0xff8FC2EA),
        ),
        body: GridView.count(
          padding: const EdgeInsets.all(5.0),
          mainAxisSpacing: 5.0,
          crossAxisSpacing: 10.0,
          crossAxisCount: 2,
          children: <Widget>[
            Image.asset('assets/cody/6091.PNG'),
            Image.asset('assets/cody/6092.PNG'),
            Image.asset('assets/cody/6093.PNG'),
            Image.asset('assets/cody/6094.PNG'),
            Image.asset('assets/cody/6095.PNG'),
            Image.asset('assets/cody/6096.PNG'),
            Image.asset('assets/cody/6097.PNG'),
            Image.asset('assets/cody/6098.PNG'),
          ],
        ));
  }
}

class Winter3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('4도 이하 추천 코디'),
          centerTitle: true,
          backgroundColor: Color(0xff8FC2EA),
        ),
        body: GridView.count(
          padding: const EdgeInsets.all(5.0),
          mainAxisSpacing: 5.0,
          crossAxisSpacing: 10.0,
          crossAxisCount: 2,
          children: <Widget>[
            Image.asset('assets/cody/41.PNG'),
            Image.asset('assets/cody/42.PNG'),
            Image.asset('assets/cody/43.PNG'),
            Image.asset('assets/cody/44.PNG'),
            Image.asset('assets/cody/45.PNG'),
            Image.asset('assets/cody/46.PNG'),
            Image.asset('assets/cody/47.PNG'),
            Image.asset('assets/cody/48.PNG'),
          ],
        ));
  }
}
