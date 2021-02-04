import 'package:demo_app_qib/home/dashboard.dart';
import 'package:demo_app_qib/provider/value_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  FlutterError.onError = (errorDetails) {
    FlutterError.dumpErrorToConsole(errorDetails, forceReport: false);
  };

  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(48),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.redAccent,
          ),
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Center(child: Text("Something went wrong")),
          ),
        ),
      ),
    );
  };
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiProvider(
providers:[
  ChangeNotifierProvider.value(value: ValueProvide()),

],child: MaterialApp(
debugShowCheckedModeBanner: false,
title: 'QIB',


      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    home: DashBoard(),),
    );
  }

}