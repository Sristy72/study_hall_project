import 'package:get/get.dart';
import '../model/edit_location_model.dart';

class WorkspaceEditController extends GetxController {
  final EditWorkspaceData initial;

  late RxString name;
  late RxString description;
  late RxString rule;
  late RxBool noiseLow;
  late RxBool noiseModerate;
  late RxBool noiseHigh;
  late RxDouble maxReservations;

  final RxBool isEditingDetails = false.obs; // ✅ NEW

  WorkspaceEditController(this.initial) {
    name = initial.name.obs;
    description = initial.description.obs;
    rule = initial.rule.obs;
    noiseLow = (initial.noiseLevel == "Low").obs;
    noiseModerate = (initial.noiseLevel == "Moderate").obs;
    noiseHigh = (initial.noiseLevel == "High").obs;
    maxReservations = initial.maxReservationsPerDay.toDouble().obs;
  }

  /// Toggle Edit / Close
  void toggleEditDetails() {
    isEditingDetails.value = !isEditingDetails.value;
  }

  void saveChanges() {
    isEditingDetails.value = false; // 🔒 lock again after save

    // TODO: persist changes (API, local storage, etc.)
    Get.back();
    Get.snackbar(
      "Saved",
      "Changes saved successfully",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void selectNoise(String level) {
    noiseLow.value = level == "Low";
    noiseModerate.value = level == "Moderate";
    noiseHigh.value = level == "High";
  }
}