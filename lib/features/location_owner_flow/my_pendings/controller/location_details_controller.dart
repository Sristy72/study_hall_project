import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Controller to handle UI state
class LocationController extends GetxController {
  var selectedTab = 0.obs; // 0: Description, 1: Availability, 2: Reviews
  var currentPagerIndex = 0.obs;
  var locationName = "Location Details".obs;
  
}