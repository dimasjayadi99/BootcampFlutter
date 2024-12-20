import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../core/enum/response_state.dart';

class RegisterController extends GetxController {
  var isObscure1 = true.obs;
  var isObscure2 = true.obs;
  Rx<ResponseState> responseState = ResponseState.init.obs;

  Future<void> createUser(String email, String password) async {
    responseState.value = ResponseState.loading;
    update();

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
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

  void suffixIconTap(RxBool isObscure) {
    isObscure.value = !isObscure.value;
  }
}
