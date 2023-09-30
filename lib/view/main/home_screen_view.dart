import 'package:flutter/material.dart';
import 'package:idukaan/view/main/util/bottom_nav_bar_util.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({super.key});
  static String id = '/idukaan/home';

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  int bottomIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Builder(
        builder: (context) {
          final TabController tabController = DefaultTabController.of(context);
          tabController.addListener(
            () {
              if (!tabController.indexIsChanging) {
                setState(
                  () {
                    bottomIndex = tabController.index;
                  },
                );
              }
            },
          );
          return MaterialApp(
            theme: ThemeData(
              useMaterial3: true,
            ),
            home: Scaffold(
              body: TabBarView(
                controller: tabController,
                children: const <Widget>[
                  Center(child: Text('1'),),
                  Center(child: Text('2'),),
                  Center(child: Text('3'),),
                  Center(child: Text('4'),),
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: bottomIndex,
                onTap: (index) {
                  setState(() {
                    tabController.index = index;
                    bottomIndex = index;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                    icon: BottomNavBarUtil.dashboard.icon,
                    label: BottomNavBarUtil.dashboard.label,
                  ),
                  BottomNavigationBarItem(
                    icon: BottomNavBarUtil.business.icon,
                    label: BottomNavBarUtil.business.label,
                  ),
                  BottomNavigationBarItem(
                    icon: BottomNavBarUtil.shop.icon,
                    label: BottomNavBarUtil.shop.label,
                  ),
                  BottomNavigationBarItem(
                    icon: BottomNavBarUtil.profile.icon,
                    label: BottomNavBarUtil.profile.label,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
