// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:torch_light/torch_light.dart';
import 'dart:async';

class light extends StatefulWidget {
  @override
  _lightState createState() => _lightState();
}

class _lightState extends State<light> {
  bool _hasFlash = false;
  bool _isOn = false;
  double _intensity = 1.0;

  @override
  initState() {
    super.initState();
    initPlatformState();
  }

  initPlatformState() async {
    bool hasFlash = await TorchLight.isTorchAvailable();
    print("Device has flash ? $hasFlash");
    setState(() {
      _hasFlash = hasFlash;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(211, 192, 64, 1),
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
            "手电筒",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Colors.white,
              fontSize: 25.0,
            ),
          ),
        ),
        body: Center(
          child: MaterialButton(
            onPressed: _turnFlash,
            child: Image(
              width: MediaQuery.of(context).size.width,
              image: AssetImage(
                  "assets/img/${_isOn ? "flash_off" : "flash_on"}.png"),
            ),
          ),
        ));
  }

  Future _turnFlash() async {
    TorchLight.enableTorch();
    _isOn ? TorchLight.disableTorch() : TorchLight.enableTorch();
    var f = await TorchLight.isTorchAvailable();
    setState(() {
      _hasFlash = f;
      _isOn = !_isOn;
    });
  }
}
