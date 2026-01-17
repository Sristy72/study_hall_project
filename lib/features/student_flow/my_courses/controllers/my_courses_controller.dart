import 'package:get/get.dart';
import 'package:study_hall_project/core/base/base_controller.dart';

class MyCoursesController extends BaseController {
  final RxInt currentTabIndex = 0.obs;
  final RxBool hasCourses = false.obs; // Track if user has courses
  
  // Calendar mode state
  final RxBool isCalendarMode = false.obs; // Toggle between list and calendar
  final RxString calendarViewType = 'Day'.obs; // Day, Week, Month

  void changeTab(int index) {
    currentTabIndex.value = index;
  }

  void setHasCourses(bool value) {
    hasCourses.value = value;
  }
  
  void toggleCalendarMode() {
    isCalendarMode.value = !isCalendarMode.value;
  }
  
  void setCalendarViewType(String type) {
    calendarViewType.value = type;
  }
}

