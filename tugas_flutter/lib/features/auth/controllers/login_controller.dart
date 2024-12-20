import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tugas_flutter/core/enum/response_state.dart';

class LoginController extends GetxController {
  var isObscure = true.obs;
  Rx<ResponseState> responseState = ResponseState.init.obs;

  Future<void> loginUser(String email, String password) async {
    responseState.value = ResponseState.loading;
    update();

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      responseState.value = ResponseState.success;
    } on FirebaseAuthException catch (e) {
      responseState.value = ResponseState.failed;
    } finally {
      update();
    }
  }

  void suffixIconTap() {
    isObscure.value = !isObscure.value;
  }
}
