import 'package:flutter/material.dart';
import 'package:movies_app/shared/style/app_theme.dart';

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
                          image: const DecorationImage(
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
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Text(
                          "Alita Battle Angel",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 15),
                      ),
                        Text(
                          "2019",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 13, color: AppTheme.lightGray),
                      ),
                        Text(
                          "Rosa Salazar, Christoph Waltz",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 13, color: AppTheme.lightGray),
                      ),
                      ],
                    ),
                  )
                ],
              ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 2,
                color: Color(0xFF707070),
              )
            ],
          ),
        ),
    );
  }
}
