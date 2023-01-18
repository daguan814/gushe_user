import 'package:dio/dio.dart' as dioCC;
import 'package:flutter_gushejianying/common/config/DioClicent.dart';

class FileUpload {
  //?输入：路径， 输出：文件直接访问的路径
  static ImgUpload(_imagePath) async {
    //?设置静态资源映射的路径
    String nginxPath = "http://121.40.85.197:100/imgs/";

    //单独提取出文件的名字
    var _name = _imagePath.substring(
        _imagePath.lastIndexOf("/") + 1, _imagePath.length);

    if (_imagePath != null) {
      var formData = dioCC.FormData.fromMap({
        'file': await dioCC.MultipartFile.fromFile(_imagePath, filename: _name)
      });

      dioCC.Response<Map> response = await dioCC.Dio()
          .post('${DioClient().baseurl}/common/upload', data: formData);
      print(response);
      print("图片存放的路径是：$nginxPath" + _name);  
      return nginxPath + _name; //最终的路径名
    }
  }
}
