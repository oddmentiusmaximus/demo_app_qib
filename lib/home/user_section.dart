import 'package:demo_app_qib/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class UserSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            "Account Information",
            style: TextStyle(
                color: Colors.black,
                fontSize: 28.0,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.start,
          ),
        ),
        Consumer<UserProvider>(
          builder: (con, user, _) => Container(
            padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
            height: 300,
            width: double.maxFinite,
            child: Card(
              elevation: 5,
              child: Container(
                decoration: BoxDecoration(
                    gradient:
                        LinearGradient(colors: [Colors.green, Colors.blue])),
                padding: EdgeInsets.all(7),
                child: Stack(
                    children: List.generate(user.userList.length, (index) {
                  var date = user.userList[index].dateOfBirth;
                  DateTime parseDate =
                      new DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
                          .parse(date);
                  var inputDate = DateTime.parse(parseDate.toString());
                  var outputFormat = DateFormat('MM/dd/yyyy hh:mm a');
                  var outputDate = outputFormat.format(inputDate);

                  return Column(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Stack(
                          children: <Widget>[
                            Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 5),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          "User Name -",
                                          style: TextStyle(
                                              color: Colors.yellow,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.0),
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Spacer(),
                                        Text(
                                          "${user.getUserList[index].userName}",
                                          style: TextStyle(
                                              color: Colors.yellow,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.0),
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                        SizedBox(
                                          width: 20,
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 50,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Account No - ",
                                          style: TextStyle(
                                              color: Colors.deepPurple,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.0),
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Spacer(),
                                        Text(
                                          "${user.getUserList[index].accountNo}",
                                          style: TextStyle(
                                              color: Colors.deepPurple,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.0),
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                        SizedBox(
                                          width: 20,
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 50,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Street Address -",
                                          style: TextStyle(
                                              color: Colors.yellow,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.0),
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Spacer(),
                                        Text(
                                          "${user.getUserList[index].address}",
                                          style: TextStyle(
                                              color: Colors.yellow,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.0),
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                        SizedBox(
                                          width: 20,
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 50,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Date Of Birth - ",
                                          style: TextStyle(
                                              color: Colors.deepPurple,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.0),
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Spacer(),
                                        Text(
                                          "$outputDate",
                                          style: TextStyle(
                                              color: Colors.deepPurple,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.0),
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                        SizedBox(
                                          width: 20,
                                        )
                                      ],
                                    ),
                                  ],
                                ))
                          ],
                        ),
                      ),
                    ],
                  );
                })),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
