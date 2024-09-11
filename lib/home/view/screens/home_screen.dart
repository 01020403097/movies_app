import 'package:flutter/material.dart';
import 'package:movies_app/shared/style/app_theme.dart';
import 'package:movies_app/tabs/browes_tab/view/browse_tab.dart';
import 'package:movies_app/tabs/home_tab/view/home_tab.dart';
import 'package:movies_app/tabs/search_tab/view/search_tab.dart';
import 'package:movies_app/tabs/watchlist_tab/view/watch_list_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'homeScreen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTabIndex = 0;
  List<Widget> tabs = [const HomeTab(),
    const SearchTab(),
    const BrowseTab(),
    const WatchListTab(),

  ];

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: tabs[currentTabIndex],
      bottomNavigationBar: BottomAppBar(
        shape:  CircularNotchedRectangle(),
        notchMargin: height*0.01,
        padding: EdgeInsets.zero,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: BottomNavigationBar(

          items:  [
            BottomNavigationBarItem(

                icon: Icon(

                  Icons.home,
                  size: height*0.036,
                ),
                label: 'Home',),
            BottomNavigationBarItem(
                icon: Icon(Icons.search_rounded, size: height*0.036),
                label: 'Search'),
            BottomNavigationBarItem(
                icon: Image.asset('assets/images/browse.png',height: height*0.036,color: AppTheme.primary,),
                label: 'Browse'),
            BottomNavigationBarItem(
                icon: Image.asset('assets/images/watchlist.png',height:height*0.036 ,color: AppTheme.primary,),
                label: 'WatchList'),
          ],
          currentIndex: currentTabIndex,
          onTap: (index) {
            setState(() {
              currentTabIndex = index;
            });
          },
        ),
      ),
    );
  }
}
