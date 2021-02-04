import 'package:demo_app_qib/provider/banking_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BankingSection extends StatefulWidget {
  @override
  _BankingSectionState createState() => _BankingSectionState();
}

class _BankingSectionState extends State<BankingSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Banking Options",
          style: TextStyle(
              color: Colors.black, fontSize: 28.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.start,
        ),
        Consumer<BankingProvider>(
          builder: (con, bank, _) => GridView.count(
            primary: false,
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
            crossAxisSpacing: 6.0,
            crossAxisCount: 3,
            childAspectRatio: (100 / 100),
            children: List.generate(bank.getBankingList.length, (index) {
              var items = bank.getBankingList[index];
              return InkWell(
                splashColor: Colors.orange[300],
                radius: 100.0,
                highlightColor: Colors.orange[300],
                child: Container(
                  decoration: new BoxDecoration(
                      color: Colors.orange[300],
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          //extend the shadow
                          offset: Offset(
                            15.0, // Move to right 10  horizontally
                            15.0, // Move to bottom 10 Vertically
                          ),
                        )
                      ]),
                  margin: EdgeInsets.all(8),
                  child: Padding(
                    padding: EdgeInsets.all(0),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                            flex: 2,
                            child: Container(
                              // margin: EdgeInsets.only(left: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      items.bankingSection,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "${items.id} variety options",
                                      maxLines: 1,
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 11,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
