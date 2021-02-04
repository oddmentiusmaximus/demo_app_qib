import 'dart:convert';
import 'dart:io';

import 'package:demo_app_qib/model/banking_model.dart';
import 'package:demo_app_qib/model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../url_manage.dart';

class UserProvider with ChangeNotifier {
  List<UserModel> userList = [];

  List<UserModel> get getUserList {
    return [...userList];
  }

  Future<Map<String, dynamic>> getUserDetails() async {
    Map<String, dynamic> responseMap = {'status': false, 'msg': ''};

    try {
      final res = await http.get('$getUserSection', headers: {
        "Content-Type": "application/json",
      });

      final response = json.decode(res.body) as List<dynamic>;
      if (res.statusCode != 200) {
        responseMap['status'] = false;
        responseMap['msg'] = 'No Banners';
        return responseMap;
      }
      userList.clear();
      response.forEach((id) {
        userList.add(UserModel(
            id: id['id'].toString(),
            accountNo: id['accountNo'].toString(),
            address: id['address'].toString(),
            dateOfBirth: id['dateOfBirth'],
            userName: id['userName']));
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
