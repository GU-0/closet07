import 'package:flutter/material.dart';

class CleanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("세탁 방법"),
          centerTitle: true,
          backgroundColor: Color(0xff8FC2EA), //가운데 정렬
        ),
        body: GridView.count(
          padding: const EdgeInsets.all(5.0),
          mainAxisSpacing: 20.0,
          crossAxisSpacing: 5.0,
          crossAxisCount: 2,
          children: <Widget>[
            InkWell(
              child: Image.asset('assets/cleaning/png1.png'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute<void>(builder: (BuildContext context) {
                  return Poly();
                }));
              },
            ),
            InkWell(
              child: Image.asset('assets/cleaning/png2.png'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute<void>(builder: (BuildContext context) {
                  return Cotton();
                }));
              },
            ),
            InkWell(
              child: Image.asset('assets/cleaning/png3.png'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute<void>(builder: (BuildContext context) {
                  return Wool();
                }));
              },
            ),
            InkWell(
              child: Image.asset('assets/cleaning/png4.png'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute<void>(builder: (BuildContext context) {
                  return Denim();
                }));
              },
            ),
            InkWell(
              child: Image.asset('assets/cleaning/png5.png'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute<void>(builder: (BuildContext context) {
                  return Rayon();
                }));
              },
            ),
            InkWell(
              child: Image.asset('assets/cleaning/png6.png'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute<void>(builder: (BuildContext context) {
                  return Acrylic();
                }));
              },
            ),
            InkWell(
              child: Image.asset('assets/cleaning/png7.png'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute<void>(builder: (BuildContext context) {
                  return Suede();
                }));
              },
            ),
            InkWell(
              child: Image.asset('assets/cleaning/png8.png'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute<void>(builder: (BuildContext context) {
                  return Linen();
                }));
              },
            ),
            InkWell(
              child: Image.asset('assets/cleaning/png9.png'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute<void>(builder: (BuildContext context) {
                  return Cashmere();
                }));
              },
            ),
          ],
        ));
  }
}

class Poly extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('폴리에스테르(Polyester)'),
        centerTitle: true,
        backgroundColor: Color(0xff8FC2EA),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'assets/cleaning/png1.png',
            ),
            SizedBox(height: 15.0),
            Image.asset(
              'assets/cleaning/poli.PNG',
            ),
            SizedBox(height: 15.0),
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
              child: Text(
                '대표적인 합성섬유 중 하나로 나일론 다음으로 강도가 높고 내구성이 강한 소재입니다.\n가볍고 구김이 잘 가지 않아 틀어짐이 거의 없고 건조가 빠르며, 흡수성이 부족하고 정전기가 잘 납니다.\n',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
              child: Text(
                '약알칼리성 세제를 이용하여 손으로 눌러주며 세탁하고 그늘에 건조시키는게 좋습니다. \n이물질이 끼기 쉬우므로 다른 빨래와 함께 빨기 보다는 단독세탁을 하는 것이 좋습니다.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Cotton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('면(Cotton)'),
        centerTitle: true,
        backgroundColor: Color(0xff8FC2EA),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'assets/cleaning/png2.png',
            ),
            SizedBox(height: 15.0),
            Image.asset(
              'assets/cleaning/Cotton.PNG',
            ),
            SizedBox(height: 15.0),
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
              child: Text(
                '천연 섬유로 보온성이 좋고 산뜻한 느낌을 주고, \n구김이 잘 가고 세탁시 줄어들 수 있습니다.\n',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
              child: Text(
                '일반 가정에서 사용하는 세탁기, 손빨래 등으로 세탁해도 무난하며, \n면은 곰팡이에 약한 점 유의해야합니다.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Wool extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('울(Wool)'),
        centerTitle: true,
        backgroundColor: Color(0xff8FC2EA),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'assets/cleaning/png3.png',
            ),
            SizedBox(height: 15.0),
            Image.asset(
              'assets/cleaning/wool.PNG',
            ),
            SizedBox(height: 15.0),
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
              child: Text(
                '동의어로 양모이며, 구김이 잘 생기지 않고 보온성이 좋아 겨울 의류로 적합한 소재입니다. \n보풀이 적고 땀을 잘 흡수하고 물에 강한 편이나 곰팡이에 약합니다.\n',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
              child: Text(
                '단시간에 세탁하는 것이 좋으며 전용 울세제 또는 중성/약알칼리성 세제와 미지근한 물로 세탁하는 것이 좋습니다. \n물기로 인해 무거워져 옷걸이에 걸면 옷이 상할 수 있으니 바닥에 눌러 짠 후 타올로 물기 제거 후 그늘에서 건조하는 것이 좋습니다.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Denim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('데님(Denim)'),
        centerTitle: true,
        backgroundColor: Color(0xff8FC2EA),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'assets/cleaning/png4.png',
            ),
            SizedBox(height: 15.0),
            Image.asset(
              'assets/cleaning/denim.PNG',
            ),
            SizedBox(height: 15.0),
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
              child: Text(
                '두껍고 실용적인 면작물 중 하나로 질기고 강하며 내구성이 뛰어나 청바지나 작업복 등으로 많이 사용되고 있습니다.\n',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
              child: Text(
                '잦은 세탁은 피하는 것이 좋고, 탈색과 변형을 최소화하기 위해 단시간에 세탁하는 것이 좋으며,\n 세탁 시 지퍼와 단추를 잠그고 뒤집어 세탁하고 건조 시 밑단이 위로 향하게 거꾸로 매달아 그늘에 건조해야합니다.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Acrylic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('아크릴(acrylic)'),
        centerTitle: true,
        backgroundColor: Color(0xff8FC2EA),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'assets/cleaning/png6.png',
            ),
            SizedBox(height: 15.0),
            Image.asset(
              'assets/cleaning/acrylic.PNG',
            ),
            SizedBox(height: 15.0),
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
              child: Text(
                '겨울 의류에 많이 사용되는 소재로 가볍고 보온성이 뛰어나며 자외선에 강해 변색이 잘 되지 않고 곰팡이와 약물 등에 강하며 구김이 잘 생기지 않습니다.\n 하지만 보풀과 정전기가 잘 생기는 단점이 있습니다.\n',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
              child: Text(
                '30도 이하의 미지근한 물에 중성 또는 약알칼리성 세제로 세탁해야합니다.\n강하지않게 물기를 제거하고 늘어남을 방지하기 위해 그늘진 곳에 "뉘어" 건조하는 것이 좋습니다.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Rayon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('레이온(Rayon)'),
        centerTitle: true,
        backgroundColor: Color(0xff8FC2EA),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'assets/cleaning/png5.png',
            ),
            SizedBox(height: 15.0),
            Image.asset(
              'assets/cleaning/rayon.PNG',
            ),
            SizedBox(height: 15.0),
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
              child: Text(
                '광택이 나고 닿는 감촉이 부드럽고 탄력이 좋습니다.\n 정전기 발생이 적으나 마찰에 약하고 구김이 잘 갑니다.\n',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
              child: Text(
                '30도 정도의 미지근한 물에 약알칼리성 세제를 풀어 약하게 주무르며 손세탁하는게 좋습니다.\n이때, 비비거나 문지르면 변형이 올 수 있으니 주의하며 세탁해야합니다.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Suede extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('스웨이드(Suede)'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[300],
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'assets/cleaning/png7.png',
            ),
            SizedBox(height: 15.0),
            Image.asset(
              'assets/cleaning/suede.PNG',
            ),
            SizedBox(height: 15.0),
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
              child: Text(
                '자켓, 구두, 가방 등에 주로 사용됩니다.\n 겨울용으로 많이 사용되며 쉽게 더러워지고 보풀이 쉽게 생긴다는 단점이 있습니다.\n',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
              child: Text(
                '물세탁을 피하고 드라이클리닝을 추천드리며,\n오염이 생겼을 경우 지우개 또는 중성세제와 물을 섞어 부드러운 천으로 두드리듯이 얼룩을 지우고 물을 천에 묻힌 후 다시 두드려 세제 성분을 희석해줍니다.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Linen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('린넨(Linen)'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[300],
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'assets/cleaning/png8.png',
            ),
            SizedBox(height: 15.0),
            Image.asset(
              'assets/cleaning/linen.PNG',
            ),
            SizedBox(height: 15.0),
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
              child: Text(
                '천연섬유로 통풍이 잘 되고 피부에 잘 달라붙지 않아 여름용 의류로 많이 사용됩니다.\n 구김이 잘 가고 땀 흡수가 잘 되며 정전기가 발생하지 않습니다.\n',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
              child: Text(
                '30도 이하의 미지근한 물 또는 찬물에 손세탁해야합니다.\n세탁 후 옷의 모양이 틀어지지않게 잘 편 후 통풍이 잘 되는 그늘에 건조시켜주는 것이 좋습니다.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Cashmere extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('캐시미어(Cashmere)'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[300],
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'assets/cleaning/png9.png',
            ),
            SizedBox(height: 15.0),
            Image.asset(
              'assets/cleaning/cashmere.PNG',
            ),
            SizedBox(height: 15.0),
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
              child: Text(
                '산양에서 채취한 작물로 내구성이 약하기 때문에 다른 섬유와 혼방으로 많이 사용합니다.\n 고급 원단으로 물과 강한 알칼리, 고온, 표백에 주의해야 하는 예민한 섬유입니다.\n',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
              child: Text(
                '가급적 드라이클리닝을 추천드리나\n집에서 세탁 시 중성세제와 미지근한 물을 섞어 10분정도 담가두고 약하게 손세탁해야합니다.(비벼 빨면 안됩니다.)',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
