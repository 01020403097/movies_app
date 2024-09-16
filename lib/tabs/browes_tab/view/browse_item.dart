import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BrowseItem extends StatelessWidget {
  const BrowseItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Stack(children: [
        Container(
          alignment: Alignment.center,
          height: 90,
          width: 160,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage("assets/images/browsepic.png"),
                  fit: BoxFit.fill)),
          child: Text(
            "Action",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ]),
    );
  }
}
