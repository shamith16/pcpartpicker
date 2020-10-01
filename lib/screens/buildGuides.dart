import 'dart:js';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pcpartpicker/api/api.dart';
import 'package:pcpartpicker/entities/guides.dart';

class BuildGuidesPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomBuildGuideBar(),
          Expanded(child: BuildsWidget()),
        ],
      ),
    );
  }
}

class CustomBuildGuideBar extends StatelessWidget {
  Widget titleWidget() {
    return RichText(
      text: TextSpan(
          style: GoogleFonts.oswald(
              fontWeight: FontWeight.bold, fontSize: 27, color: Colors.black),
          children: [
            TextSpan(text: "PC"),
            TextSpan(
              text: "PART",
              style: TextStyle(color: Colors.orangeAccent),
            ),
            TextSpan(text: "PICKER"),
            TextSpan(
              text: " / ",
              style: TextStyle(color: Colors.orangeAccent),
            ),
            TextSpan(text: "GUIDES")
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

class BuildsWidget extends StatelessWidget {
  Widget categoryWidget(Categories categories, BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              categories.title,
              style: GoogleFonts.montserrat(fontWeight: FontWeight.w500, fontSize: 18),
              textAlign: TextAlign.start,
            ),
          ),
          ...categories.guides.map((e) {
            return InkWell(
              child: Card(
                child: ListTile(
                  title: Text(e.title, style: GoogleFonts.rubik(fontSize: 16),),
                  dense: true,
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...e.products.map<Widget>((c) => Text(c, style: TextStyle(fontSize: 12),)).toList(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FlatButton.icon(onPressed: null, icon: Icon(Icons.monetization_on), label: Text(e.price)),
                          FlatButton.icon(onPressed: null, icon: Icon(Icons.comment), label: Text(e.comments.toString()))
                        ],
                      )
                    ],
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ))
              },
            );
          })
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<BuildGuides>(
        future: getBuildGuides(),
        builder: (BuildContext context, AsyncSnapshot<BuildGuides> snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.orangeAccent),
              ),
            );
          }

          return ListView(
            physics: BouncingScrollPhysics(),
            children: snapshot.data.categories
                .map<Widget>((e) => categoryWidget(e, context))
                .toList(),
          );
        });
  }
}
