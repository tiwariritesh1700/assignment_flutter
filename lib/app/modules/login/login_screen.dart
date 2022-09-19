import 'package:assignment_flutter/app/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../gen/assets.gen.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_dimen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildLoginView(context));
  }

  SafeArea _buildLoginView(BuildContext context) {
    return SafeArea(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        _loginHeaderText(),
        const SizedBox(height: 50),
        _buildGoogleLoginButton(context),
      ]),
    );
  }

  Text _loginHeaderText() {
    return const Text(
      'Demo App',
      style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: AppTextSize.HEADING_LARGE_35,
          color: AppColors.blackColor),
    );
  }

  InkWell _buildGoogleLoginButton(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<LoginController>(context, listen: false).googleLogin();
      },
      child: Center(
        child: Container(
          width: 300,
          padding: const EdgeInsets.only(left: 33, right: 36),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                  spreadRadius: 2,
                  blurRadius: 20,
                  offset: Offset(0, 4),
                )
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Assets.images.png.googleLogoIcon.image(width: 30, height: 30),
                const SizedBox(width: 10),
                const Text('Sign in with Google',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: AppTextSize.LABEL_SMALL_16,
                        color: AppColors.blackColor)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
