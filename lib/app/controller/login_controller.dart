import 'package:flutter/material.dart';
import 'package:assignment_flutter/app/service/firebase_service.dart';

import '../../utils/common_methods.dart';

class LoginController extends ChangeNotifier{

  FireBaseService firebase = FireBaseService();

  void googleLogin() async{
    if(await checkConnectivity()) {
      await firebase.googleLogin();
      notifyListeners();
    }


  }
  void signOut() async{
    if(await checkConnectivity()) {
      await firebase.signOut();
      notifyListeners();
    }
  }

}