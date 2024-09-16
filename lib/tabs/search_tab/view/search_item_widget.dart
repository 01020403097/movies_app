import 'package:flutter/material.dart';
// import 'package:flutter/src/rendering/object.dart';

class SearchItemWidget extends StatelessWidget {
  const SearchItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 20),
        child: Column(
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/watchlistimage.png"),
                              fit: BoxFit.fill)),
                      height: 89,
                      width: 140,
                      child: Container(
                        child: Image.asset(
                          "assets/images/watchlisttext.png",
                          scale: 3,
                        ),
                        alignment: Alignment.center,
                      ),
                    ),
                    Image.asset(
                      "assets/images/bookmark.png",
                      scale: 4,
                      alignment: Alignment.topRight,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(
                        "Alita Battle Angel",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "2019",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        "Rosa Salazar, Christoph Waltz",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 2,
              color: Color(0xFF707070),
            )
          ],
        ),
      ),
    );
  }
}
