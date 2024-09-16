import 'package:flutter/material.dart';
import 'package:movie_app/search/search_item_widget.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  var formkey = GlobalKey<FormState>();
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
              leadingWidth: 5,
              title: Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  style: TextStyle(color: Colors.white, fontSize: 14),
                  key: formkey,
                  controller: search,
                  // validator: (value) {

                  // } ,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(color: Colors.white)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(color: Colors.white)),
                      prefixIcon: Icon(Icons.search),
                      prefixIconColor: Colors.white,
                      hintText: "Search",
                      filled: true,
                      fillColor: Color(0xFF514F4F),
                      hintStyle: TextStyle(color: Colors.white)),
                ),
              )),
          body: ListView.builder(
            itemBuilder: (context, index) => SearchItemWidget(),
            itemCount: 3,
          )),
    );
  }
}
