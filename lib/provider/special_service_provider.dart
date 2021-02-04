import 'dart:convert';
import 'dart:io';

import 'package:demo_app_qib/model/banking_model.dart';
import 'package:demo_app_qib/model/special_service_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../url_manage.dart';

class SpecialServiceProvider with ChangeNotifier{
  List<SpecialServiceModel> specialServicesList = [];

  List<SpecialServiceModel> get getSpecialServicesList {
    return [...specialServicesList];
  }

  Future<Map<String, dynamic>> getSpecialServiceDetails() async {
    Map<String, dynamic> responseMap = {'status': false, 'msg': ''};


    try {
      final res = await http.get('$getServiceSection', headers: {
        "Content-Type": "application/json",
      });

      final response = json.decode(res.body) as List<dynamic>;
      if (res.statusCode != 200) {
        responseMap['status'] = false;
        responseMap['msg'] = 'No Banners';
        return responseMap;
      }
      specialServicesList.clear();
      response.forEach((id) {
        specialServicesList.add(SpecialServiceModel(

            id: id['id'].toString(),
            specialServices: id['specialServices'].toString()));
      });
      responseMap['status'] = true;
      responseMap['msg'] = 'Done';
      return responseMap;
    } on SocketException {
      responseMap['status'] = false;
      responseMap['msg'] = 'No Internet Connectivity';
      return responseMap;
    } catch (e) {
      print("$e");
      responseMap['status'] = false;
      responseMap['msg'] = 'Please try again later!';
      return responseMap;
    }
  }

}