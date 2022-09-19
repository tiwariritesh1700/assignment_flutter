import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_dimen.dart';
import '../../../utils/WidgetUtils/app_drawer.dart';
import '../encryption/encryption_screen.dart';
import '../stopwatch/stopwatch_screen.dart';
import '../todo/todo_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColors.whiteColor),
        title: const Text(
          'Welcome',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: AppTextSize.HEADING_MEDIUM_25,
              color: AppColors.whiteColor),
        ),
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: const [
          EncryptionScreen(),
          TodoScreen(),
          StopWatchScreen(),
        ],
      ),
      drawer:  AppDrawer(context: context),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Card _buildBottomNavigationBar() {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 8,
      child: BottomNavigationBar(
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
        currentIndex: selectedIndex,
        items: [
          _buildBottomNavigationBarItem(
              icon: Assets.images.png.lock.image(
                width: 30,
                height: 30,
                color: AppColors.greyTextColor,
              ),
              activeIcon: Assets.images.png.lock.image(
                width: 30,
                height: 30,
                color: AppColors.primaryColor,
              ),
              label: 'Encryption'),
          _buildBottomNavigationBarItem(
              icon: Assets.images.png.toDoList.image(
                  width: 30, height: 30, color: AppColors.greyTextColor),
              activeIcon: Assets.images.png.toDoList.image(
                  width: 30, height: 30, color: AppColors.primaryColor),
              label: 'To-Do'),
          _buildBottomNavigationBarItem(
              icon: Assets.images.png.stopwatch.image(
                  width: 30, height: 30, color: AppColors.greyTextColor),
              activeIcon: Assets.images.png.stopwatch.image(
                  width: 30, height: 30, color: AppColors.primaryColor),
              label: 'StopWatch'),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem({
    required Widget icon,
    required Widget activeIcon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: icon,
      activeIcon: activeIcon,
      label: label,
    );
  }
}
