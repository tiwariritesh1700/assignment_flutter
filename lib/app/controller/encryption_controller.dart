import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/material.dart';


class EncryptionController extends ChangeNotifier {
  TextEditingController messageController = TextEditingController();
  TextEditingController secretController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  String encryptedValue ="";
  String decryptedValue="";

  final key = encrypt.Key.fromUtf8('put32charactershereeeeeeeeeeeee!'); //32 chars





  //encrypt
  void encryptMyData() {
    final readyToEncrypt = encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));
    final iv = encrypt.IV.fromUtf8(secretController.value.text);

    final encryptedData = readyToEncrypt.encrypt(messageController.value.text, iv: iv);
    encryptedValue = encryptedData.base64;
    notifyListeners();
  }

//dycrypt
 void decryptMyData() {
    final readyToDecrypt = encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));
    final iv = encrypt.IV.fromUtf8(secretController.value.text);

    decryptedValue = readyToDecrypt.decrypt(encrypt.Encrypted.fromBase64(messageController.value.text), iv: iv);
   notifyListeners();
  }

  void clearText(){
    messageController.clear();
    secretController.clear();
  }
}