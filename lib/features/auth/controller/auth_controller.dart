import 'package:get/get.dart';
import '../../../navigation_menu_tutor.dart';
import '../../student_flow/home/screens/home_screen.dart';

class AuthController extends GetxController {
  Future<void> login(String email, String password) async {
    
    // Get.to(() => HomeScreen());
    Get.to(() => CustomBottomNavTutor());
  }
}
