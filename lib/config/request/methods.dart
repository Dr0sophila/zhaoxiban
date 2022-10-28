import 'dart:convert';
import 'package:dio/dio.dart';
import '/config/request/url.dart';

class DioUtil {
  static BaseOptions options = BaseOptions(
    baseUrl: "",
    connectTimeout: 15000,
    responseType: ResponseType.plain,
    receiveTimeout: 15000,
  );

  static Dio dio = new Dio(options);

  static requestData(url, {formData}) async {
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

  static match(url) async {
    try {
      Response response;
      response = await dio.get(url);

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
}
