import 'package:flutter/material.dart';
import 'package:movies_app/tabs/search_tab/view/search_item_widget.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
              leadingWidth: 0,
              title: TextFormField(
                controller: search,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Color(0xFF514F4F))),
                    prefixIcon: Icon(Icons.search),
                    prefixIconColor: Colors.white,
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.white)),
              )),
          body: ListView.builder(
            itemBuilder: (context, index) => SearchItemWidget(),
            itemCount: 3,
          )),
    );
  }
}
