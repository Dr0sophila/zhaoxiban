import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:zhaoxiban/pages/dialectpage/page/dialect.dart';
import '/config/request/url.dart';

class DioUtil {
  static BaseOptions options = BaseOptions(
    baseUrl: "",
    connectTimeout: 15000,
    responseType: ResponseType.plain,
    receiveTimeout: 15000,
  );

  static Dio dio = new Dio(options);

  static postRequest(url, {formData}) async {
    try {
      Response response;
      if (formData == null) {
        response = await dio.post(servicePath[url]);
      } else {
        String formdata = jsonEncode(formData);
        response = await dio.post(
          servicePath[url],
          data: formdata,
        );
      }
      if (response.statusCode == 200) {
        String data = response.data;
        return jsonDecode(data);
      } else {
        throw Exception("接口异常");
      }
    } catch (e) {
      print("网络出现错误");
    }
  }

  static qpostRequest(url, {formData}) async {
    try {
      Response response;
      if (formData == null) {
        response = await dio.post(servicePath[url]);
      } else {
        response = await dio.post(
          servicePath[url],
          queryParameters: formData,
        );
      }
      if (response.statusCode == 200) {
        String data = response.data;
        return jsonDecode(data);
      } else {
        throw Exception("接口异常");
      }
    } catch (e) {
      print(e);
    }
  }

  static getRequest(url) async {
    print(servicePath[url]);
    try {
      Response response;
      response = await dio.get(servicePath[url]);

      if (response.statusCode == 200) {
        String data = response.data;
        return jsonDecode(data);
      } else {
        throw Exception("接口异常");
      }
    } catch (e) {
      print("网络出现错误");
    }
  }

  static getwithparms(url, map) async {
    print(servicePath[url]);
    try {
      Response response;
      response = await dio.get(servicePath[url], queryParameters: map);

      if (response.statusCode == 200) {
        String data = response.data;
        return jsonDecode(data);
      } else {
        throw Exception("接口异常");
      }
    } catch (e) {
      print(e);
    }
  }
}

class audio_play {
  static play(pcb) async {
    AudioPlayer player = AudioPlayer();
    String url = 'http://47.100.226.180:3002/common/textDownload/$pcb';
    var result = await player.play(url);
  }

//in case one day someone will read the shit I wrote, I have to say sorry to you. There's no doubt that the code is a pile of shit,but I'm tired and have no willing to optimize, my team is a group of garbage. the front end project is literally built by my own. as a word, screw you, it's your own fault to read it.
  static playtext(String lo, String text) async {
    Map<String, dynamic> formdata = {"role": llist[lo], "text": text};
    print(formdata);
    var res = await DioUtil.postRequest("textUpload", formData: formdata);
    print(res["data"]);
    AudioPlayer player = AudioPlayer();
    String url =
        'http://47.100.226.180:3002/common/textDownload/${res["data"]}';
    var result = await player.play(url);
  }
}
