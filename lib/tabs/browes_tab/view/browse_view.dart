import 'package:flutter/material.dart';
import 'package:movie_app/browse/browse_item.dart';
import 'package:movie_app/search/search_item_widget.dart';
import 'package:movie_app/search/search_view.dart';

class BrowseView extends StatelessWidget {
  const BrowseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        centerTitle: false,
        title: Container(
          padding: EdgeInsets.only(top: 20),
          child: Text(
            "Browse Category",
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SafeArea(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 1.5),
          itemBuilder: (context, index) => BrowseItem(),
          padding: EdgeInsets.only(top: 30, left: 15),
        ),
      ),
    );

    //         Expanded(
    //   child: ListView.builder(
    //     itemBuilder: (context, index) => BrowseItem(),
    //     itemCount: 20,
    //   ),
    // )
  }
}
