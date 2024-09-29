import 'package:flutter/material.dart';

import '../../search_tab/view/search_item_widget.dart';

class WatchListView extends StatelessWidget {
  const WatchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Watch List",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 22),
              // textAlign: TextAlign.start,
            ),
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) => const SearchItemWidget(),
              itemCount: 13,
            ))
          ],
        ),
      ),
    );
  }
}
