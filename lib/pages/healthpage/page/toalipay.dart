import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class toalipay extends StatefulWidget {
  @override
  _toalipayState createState() => _toalipayState();
}

class _toalipayState extends State<toalipay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(65, 178, 0, 1),
          leading: MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          elevation: 2.0,
          title: const Text(
            "双码出行",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Colors.black,
              fontSize: 25.0,
            ),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/img/dickbackground.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textButtonItem('assets/img/dick1.png',
                  "alipays://platformapi/startapp?appId=2021003125688065&page=pages/index/index"),
              textButtonItem('assets/img/dick2.png',
                  'alipays://platformapi/startapp?appId=2021002170600786&page=%2Fpages%2Findex%2Findex'),
            ],
          ),
        ));
  }

  Widget textButtonItem(String img, String urlLink) {
    return TextButton(
      child: Image(
        height: MediaQuery.of(context).size.height * 0.3,
        image: AssetImage(img),
      ),
      onPressed: () async {
        var url = urlLink;
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'Could not launch $url';
        }
      },
    );
  }
}
