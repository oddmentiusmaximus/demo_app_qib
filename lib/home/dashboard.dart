import 'package:demo_app_qib/provider/banking_provider.dart';
import 'package:demo_app_qib/provider/special_service_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'banking_section.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  Future<void> getBanking(BuildContext con) async {
    final bankingVal = Provider.of<BankingProvider>(context, listen: false);
    if (bankingVal.getBankingList.isEmpty) {
      final res = await bankingVal.getBankingDetails();
      if (!res['status']) {
        print("${res['status']}");
      }
    }
  }
  Future<void> getSpecialService(BuildContext con) async {
    final specialServiceVal = Provider.of<SpecialServiceProvider>(context, listen: false);
    if (specialServiceVal.getSpecialServicesList.isEmpty) {
      final res = await specialServiceVal.getSpecialServiceDetails();
      if (!res['status']) {
        print("${res['status']}");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[700],
        title: Text("DashBoard"),
        leading:       Icon(Icons.menu, color: Colors.black,size: 30.0,),
      ),
        body: Container(
          decoration: new BoxDecoration(
              gradient: new LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 25,178,238),
                  Color.fromARGB(255, 21,236,229)
                ],
              )),
          child: SafeArea(
              child: ListView(
                children: <Widget>[

                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      "Welcome, to Demo App for QIB",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  FutureBuilder(
                      future: getBanking(context),
                      builder: (con, snap) => snap.connectionState == ConnectionState.waiting
                          ? Shimmer.fromColors(
                          child: GridView.count(
                            primary: false,
                            shrinkWrap: true,
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                            crossAxisSpacing: 6.0,
                            crossAxisCount: 3,
                            childAspectRatio: (100 / 100),
                            children: List.generate(5, (index) {
                              return Card(
                                elevation: 5,
                                margin: EdgeInsets.all(8),
                                child: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                          flex: 3,
                                          child: Container(
                                            margin: EdgeInsets.only(left: 8),
                                            decoration:  new BoxDecoration(
                                                shape: BoxShape.circle
                                            ),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  '',
                                                  style: TextStyle(
                                                      fontSize: 15, fontWeight: FontWeight.bold),
                                                ),
                                                Text(
                                                  '',
                                                  maxLines: 1,
                                                  style: TextStyle(color: Colors.grey, fontSize: 10),
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              );
                            }),
                          ),
                          baseColor: Colors.grey[400],
                          highlightColor: Colors.grey[200])
                          : BankingSection()),

                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Center(
                      child: Wrap(
                        spacing:20,
                        runSpacing: 20.0,
                        children: <Widget>[
                          SizedBox(
                            width:160.0,
                            height: 160.0,
                            child: Card(

                              color: Color.fromARGB(255,21, 21, 21),
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)
                              ),
                              child:Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          "Transfers",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.0
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                      ],
                                    ),
                                  )
                              ),
                            ),
                          ),
                          SizedBox(
                            width:160.0,
                            height: 160.0,
                            child: Card(

                              color: Colors.orange[300],
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)
                              ),
                              child:Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          "Payments",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.0
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                      ],
                                    ),
                                  )
                              ),
                            ),
                          ),
                          SizedBox(
                            width:160.0,
                            height: 160.0,
                            child: Card(

                              color: Colors.orange[300],
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)
                              ),
                              child:Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          "Account Services",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.0
                                          ),textAlign: TextAlign.center,
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                      ],
                                    ),
                                  )
                              ),
                            ),
                          ),
                          SizedBox(
                            width:160.0,
                            height: 160.0,
                            child: Card(

                              color: Color.fromARGB(255,21, 21, 21),
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)
                              ),
                              child:Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          "View All",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.0
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                      ],
                                    ),
                                  )
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
          ),
        )
    );
  }
}
