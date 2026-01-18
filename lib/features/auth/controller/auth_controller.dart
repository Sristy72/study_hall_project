import 'package:get/get.dart';
import '../../student_flow/home/screens/home_screen.dart';

class AuthController extends GetxController {
  Future<void> login({required String email, required String password}) async {
    
    Get.to(() => HomeScreen());
  }
}
