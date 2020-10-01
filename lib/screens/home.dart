import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:pcpartpicker/screens/buildGuides.dart';

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(children: [CustomAppBar(), CustomGrid()]),
      ),
      routes: {
        '/guides': (context) => BuildGuidesPage()
      },
    );
  }
}

class CustomAppBar extends StatelessWidget {
  Widget titleWidget() {
    return RichText(
      text: TextSpan(
          style: GoogleFonts.oswald(
              fontWeight: FontWeight.bold, fontSize: 27, color: Colors.black),
          children: [
            TextSpan(text: "PC"),
            TextSpan(
                text: "PART", style: TextStyle(color: Colors.orangeAccent)),
            TextSpan(text: "PICKER")
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40, left: 20),
      child: Row(children: [titleWidget()]),
    );
  }
}

class CustomGrid extends StatelessWidget {
  Widget cardWidget(BuildContext context, String name, IconData icon, String routeName) {
    return Container(
      padding: EdgeInsets.all(10),
      child: InkWell(
        splashColor: Colors.orangeAccent,
        borderRadius: BorderRadius.circular(10),
        child: Card(
          elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(icon, size: 75),
                  Text(
                    name,
                    style: GoogleFonts.oswald(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            )),
        onTap: () => {
          Navigator.pushNamed(context, routeName)
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        cardWidget(context, "SYSTEM \n BUILDER", Icons.settings, '/'),
        cardWidget(context, "BUILD \n GUIDES", Icons.assignment, '/guides'),
        cardWidget(context, "COMPLETED \n BUILDS", Icons.assignment_turned_in, '/')
      ],
    );
  }
}
