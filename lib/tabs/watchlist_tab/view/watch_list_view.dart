import 'package:flutter/material.dart';
import 'package:movie_app/search/search_item_widget.dart';

class WatchListView extends StatelessWidget {
  const WatchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "Watch List",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
                // textAlign: TextAlign.start,
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) => SearchItemWidget(),
              itemCount: 13,
            ))
          ],
        ),
      ),
    );
  }
}
