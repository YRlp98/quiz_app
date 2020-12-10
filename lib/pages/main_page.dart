import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/icons.dart';
import '../theme/strings.dart';
import '../widgets/fab_widgets.dart';
import '../widgets/icon_widgets.dart';
import 'create_quiz_page.dart';
import 'home_page.dart';
import 'settings_page.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //* Properties
  int currentTab = 0;

  // Pages
  final List<Widget> pages = [
    HomePage(),
    SettingsPage(),
  ];

  // Active Page
  Widget currentPage = HomePage();
  final PageStorageBucket pageStorageBucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //* Body
      body: PageStorage(
        child: currentPage,
        bucket: pageStorageBucket,
      ),
      //* FAB
      floatingActionButton: FABWidget(
        ontap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateQuizPage(),
            ),
          );
          print('FAB');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //* Bottom Navigation Bar
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: whiteColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Home
            MaterialButton(
              onPressed: () {
                setState(() {
                  currentPage = HomePage();
                  currentTab = 0;
                });
                print('HOME');
              },
              child: SVGIconWithTextWidget(
                icon: currentTab == 0 ? homeBoldIcon : homeLightIcon,
                iconColor: darkestGreyColor,
                text: homeTextEn,
              ),
            ),
            // Settings
            MaterialButton(
              onPressed: () {
                setState(() {
                  currentPage = SettingsPage();
                  currentTab = 1;
                });
                print('SEETINGS');
              },
              child: SVGIconWithTextWidget(
                icon: currentTab == 1 ? settingsBoldIcon : settingsLightIcon,
                iconColor: darkestGreyColor,
                text: settingsTextEn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
