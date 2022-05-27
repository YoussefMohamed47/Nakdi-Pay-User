import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nakdi_pay_user/utils/app_images.dart';
import 'package:nakdi_pay_user/view/screens/home/homepage.dart';
import 'package:nakdi_pay_user/view/screens/insights/insights.dart';
import 'package:nakdi_pay_user/view/screens/notification/notifcation.dart';
import 'package:nakdi_pay_user/view/screens/scan/scan.dart';

import '../../utils/app_colors.dart';
import '../widgets/scroll_to_hide_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 1;
  ScrollController controller = ScrollController();
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _pages.elementAt(_currentIndex)),
      bottomNavigationBar: ScrollToHideWidget(
        controller: controller,
        child: BottomNavigationBar(
          backgroundColor: AppColors.navbgColor,
          onTap: onTabTapped, // new
          currentIndex: _currentIndex,
          showUnselectedLabels: true, // new
          //
          // selectedIconTheme:
          //     IconThemeData(color: AppColors.primaryColor, size: 26),
          unselectedIconTheme:
              const IconThemeData(color: AppColors.iconGreyColor, size: 20),
          unselectedItemColor: AppColors.iconGreyColor,
          selectedItemColor: AppColors.primaryColor,

          items: [
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                AppImages.activeHomeBottomIcon,
              ),
              icon: SvgPicture.asset(
                AppImages.homeBottomIcon,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                AppImages.activeNotificationsBottomIcon,
              ),
              icon: SvgPicture.asset(
                AppImages.notificationsBottomIcon,
              ),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                AppImages.activeInsightsBottomIcon,
              ),
              icon: SvgPicture.asset(
                AppImages.insightsBottomIcon,
              ),
              label: 'Insights',
            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                AppImages.activeScanBottomIcon,
              ),
              icon: SvgPicture.asset(
                AppImages.scanBottomIcon,
              ),
              label: 'Scan',
            ),
          ],
        ),
      ),
    );
  }

  static const List<Widget> _pages = <Widget>[
    HomePage(),
    Notifications(),
    Insights(),
    Scan()
  ];
}