import 'package:flutter/material.dart';
import 'package:flutter_application_rhp/components/app_drawer.dart';
import 'package:flutter_application_rhp/components/customAppBar.dart';
import 'package:flutter_application_rhp/views/entreprise/createProgram.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var showall;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: CustomAppBar(title: "Acceuil", goBack: false),
      ),
      backgroundColor: Color.fromARGB(14, 0, 0, 0),
      endDrawer: AppDrawer(),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
        child: Column(
          children: [
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  ...[1, 2, 3]
                      .map((e) => Container(
                          width: 300,
                          child: Card(
                            elevation: 0,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 20),
                              child: Container(
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/images/logo.png",
                                      width: 150,
                                      fit: BoxFit.cover,
                                    ),
                                    Text(
                                      " data data data",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text.rich(
                                      TextSpan( 
                                      text:"datacdefvucygvsxhbj yuvoéezgudbjevyepvcb dgfeè_évc d fpi ràizdcp ylief",
                                      overflow: TextOverflow.ellipsis, 
                                      maxLines: 2,
                                      
                                      )
                                      
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )))
                      .toList()
                ])),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CreateProgram()));
                },
                child: Text(
                  "Create Program",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      )),
    );
  }
}
