import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mehendi_design_app/src/home_category/views/home_category_screen.dart';
import 'package:mehendi_design_app/utils/constants.dart';

class MainScreen extends StatelessWidget {
  static const String routeName = '/main';

  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetOptions = <Widget>[
      HomeCategoryScreen(),
      Text('data'),
    ];

    return DefaultTabController(
      length: 2,
      child: GetBuilder<TabScreenController>(
        init: TabScreenController(),
        builder: (tabController) => Scaffold(
          body: widgetOptions.elementAt(tabController.selectedIndex),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorite',
              ),
            ],
            currentIndex: tabController.selectedIndex,
            selectedItemColor: kPrimaryColor,
            onTap: tabController.onItemTapped,
          ),
        ),
      ),
    );
  }
}

class TabScreenController extends GetxController {
  int selectedIndex = 0;

  onItemTapped(int index) {
    selectedIndex = index;
    update();
  }
}
