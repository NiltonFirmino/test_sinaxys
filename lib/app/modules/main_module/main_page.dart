import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_sinaxys/app/core/components/app_bar_widget.dart';
import 'package:test_sinaxys/app/modules/main_module/submodules/inbox_module/inbox.dart';

import '../../core/utils/constants/app_strings.dart';
import '../../core/utils/style/colors/general_colors.dart';
import 'submodules/home_module/home_page.dart';
import 'submodules/network_module/network_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedBody = 0;

  @override
  void initState() {
    super.initState();
    dev.log(Modular.to.path, name: kPath);
  }

  static const List<Widget> _widgetBodyOptions = <Widget>[
    HomePage(),
    NetworkPage(),
    InboxPage(),
  ];
  void onItemTapped(int index) {
    setState(() {
      _selectedBody = index;
    });
  }

  void initSelectedPage(int? index) {
    if (index == null) {
      setState(() {
        _selectedBody = 0;
      });
    } else {
      setState(() {
        _selectedBody = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var animatedPadding = _selectedBody * size.width * 0.3333;
    return Scaffold(
      appBar: const SinaxysAppBarWidget(),
      body: _widgetBodyOptions.elementAt(_selectedBody),
      bottomNavigationBar: Container(
        height: 80,
        decoration: const BoxDecoration(
          color: kColorBackgroundLight,
          border: Border(
            top: BorderSide(
              color: kColorDividerDropShadow,
              width: 1,
            ),
          ),
        ),
        child: Stack(
          children: [
            AnimatedPadding(
              padding: EdgeInsets.only(left: animatedPadding),
              duration: const Duration(milliseconds: 200),
              child: SizedBox(
                width: size.width * 0.3333,
                height: 5,
                child: Center(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: kColorNavBarSelectedIcon,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(5),
                      ),
                    ),
                    width: size.width * 0.20,
                    height: 5,
                  ),
                ),
              ),
            ),
            Center(
              child: BottomNavigationBar(
                elevation: 0,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    activeIcon: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: SvgPicture.asset(
                        'assets/icons/jobs_vacancies_solid.svg',
                        color: kColorNavBarSelectedIcon,
                        semanticsLabel: 'Home',
                      ),
                    ),
                    icon: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: SvgPicture.asset(
                        'assets/icons/jobs_vacancies_solid.svg',
                        color: kColorNavBarIcon,
                        semanticsLabel: 'Home',
                      ),
                    ),
                    label: kHome,
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: SizedBox(
                        width: 27,
                        child: Stack(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/network_outlined.svg',
                              color: kColorNavBarSelectedIcon,
                              semanticsLabel: 'Home',
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: kColorNavBarNotification,
                                  gradient: const RadialGradient(
                                    colors: [
                                      kColorNavBarNotification,
                                      kColorNavBarNotificationBorder,
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    icon: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: SizedBox(
                        width: 27,
                        child: Stack(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/network_outlined.svg',
                              color: kColorNavBarIcon,
                              semanticsLabel: 'Home',
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: kColorNavBarNotification,
                                  gradient: const RadialGradient(
                                    colors: [
                                      kColorNavBarNotification,
                                      kColorNavBarNotificationBorder,
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    label: kNetWork,
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: SvgPicture.asset(
                        'assets/icons/inbox_outlined.svg',
                        height: 25,
                        color: kColorNavBarSelectedIcon,
                        semanticsLabel: 'Home',
                      ),
                    ),
                    icon: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: SvgPicture.asset(
                        'assets/icons/inbox_outlined.svg',
                        color: kColorNavBarIcon,
                        semanticsLabel: 'Home',
                      ),
                    ),
                    label: kInbox,
                  ),
                ],
                type: BottomNavigationBarType.fixed,
                currentIndex: _selectedBody,
                selectedItemColor: kColorNavBarSelectedIcon,
                unselectedItemColor: kColorNavBarIcon,
                backgroundColor: kColorBackgroundBottomNavBar,
                onTap: onItemTapped,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
