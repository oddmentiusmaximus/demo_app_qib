import 'dart:convert';
import 'dart:io';

import 'package:demo_app_qib/model/banking_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../url_manage.dart';

class BankingProvider with ChangeNotifier {
  List<BankingModel> bankingList = [];

  List<BankingModel> get getBankingList {
    return [...bankingList];
  }

  Future<Map<String, dynamic>> getBankingDetails() async {
    Map<String, dynamic> responseMap = {'status': false, 'msg': ''};

    try {
      final res = await http.get('$getBankingSection', headers: {
        "Content-Type": "application/json",
      });

      final response = json.decode(res.body) as List<dynamic>;
      if (res.statusCode != 200) {
        responseMap['status'] = false;
        responseMap['msg'] = 'No Banners';
        return responseMap;
      }
      bankingList.clear();
      response.forEach((id) {
        bankingList.add(BankingModel(
            id: id['id'].toString(),
            bankingSection: id['bankingSection'].toString()));
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
