import 'dart:io';

import 'config/request/methods.dart';

main() async {
  Map<String, dynamic> formdata = {"role": "x2_xiaobao", "text": "柯肖我日你妈"};

  var res = await DioUtil.postRequest("textUpload", formData: formdata);
  print(res["data"]);
}
