import 'package:get/get.dart';

class IncomeController extends GetxController {
  final transactions = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Generating data similar to screenshot (repeated pattern)
    for (int i = 0; i < 15; i++) {
      transactions.add({
        'amount': 83.41,
        'date': '10/06/2025',
        'place': "Lucy's Cafe - 14 Kiln street",
        'count': 3,
      });
    }
  }
}