import 'package:assignment_flutter/app/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../theme/app_dimen.dart';

class AppDrawer extends StatelessWidget {
  final BuildContext context;

  const AppDrawer({
    Key? key,
    required this.context,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: _buildDrawerView(),
    );
  }

  SafeArea _buildDrawerView() {
    return SafeArea(
      child: Column(
        children: [
          _drawerHeaderView(),
          _drawerTileView('Change Language', () {
            print('reached 1');
          }),
          _drawerTileView('Logout', () {
            print('reached 2');
            Provider.of<LoginController>(context,listen: false).signOut();
          }),
          const Spacer(),
          appVersionText(),
          _commonSizedBox(),
        ],
      ),
    );
  }

  Widget _drawerHeaderView() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          child: const Center(
            child: Text(
              'Demo App',
              style: TextStyle(
                  fontSize: AppTextSize.HEADING_MEDIUM_25,
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.ellipsis),
            ),
          ),
        ),
        _commonSizedBox(),
        _commonDivider(),
      ],
    );
  }

  Widget _drawerTileView(
    String drawerTileName,
    Function() onTap,
  ) {
    return Column(
      children: [
        _commonSizedBox(),
        InkWell(
            onTap: onTap,
            child:  Text(
              drawerTileName,
              style: const TextStyle(
                  fontSize: AppTextSize.LABEL_MEDIUM_18,
                  fontWeight: FontWeight.w400),
            )),
        _commonSizedBox(),
        _commonDivider(),

      ],
    );
  }

  Divider _commonDivider() {
    return const Divider(
      thickness: 2,
      color: Colors.grey,
    );
  }

  SizedBox _commonSizedBox() {
    return const SizedBox(
      height: 10,
    );
  }

  Widget appVersionText() {
    return const Text(
      'App Version 1.0.0',
      style: TextStyle(
          fontSize: AppTextSize.LABEL_SMALL_14, fontWeight: FontWeight.w400),
    );
  }
}
