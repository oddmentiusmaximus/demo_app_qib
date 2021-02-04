
import 'package:demo_app_qib/provider/special_service_provider.dart';
import 'package:demo_app_qib/widget/height_width_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SpecialService extends StatelessWidget {
  const SpecialService({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            "Special Services",
            style: TextStyle(
                color: Colors.black,
                fontSize: 28.0,
                fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.start,
          ),
        ),
        Consumer<SpecialServiceProvider>(
          builder: (con, service, _) =>  SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: List.generate(
                  service.getSpecialServicesList.length,
                      (index) => Hero(
                    tag: service.getSpecialServicesList[index].id,
                    child: GestureDetector(

                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            width:150.0,
                            height: 120.0,
                            child: Card(

                              color: Colors.redAccent,
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
                                          "${ service.getSpecialServicesList[index].specialServices.toUpperCase()}",
                                          style: TextStyle(
                                              color: Colors.deepPurple,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.0
                                          ),textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
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
                          const SizedBox(
                            height: 10.0,
                          ),

                        ],
                      ),
                    ),
                  ),
                )),
          ),
        ),
      ],
    );
  }
}
