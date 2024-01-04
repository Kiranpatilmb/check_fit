import 'package:flutter/material.dart';

import 'foot_steps.dart';
import 'health_repo.dart';

class HomeController {
  final repository = HealthRepository();
  final steps = ValueNotifier(<FootSteps>[]);
  Future<void> getStepsData() async {
    steps.value = await repository.getFootSteep();
  }
  Future<void> getSleepData() async {
    steps.value = await repository.getSleep();
  }
  Future<void> getHeartRateData() async {
    steps.value = await repository.getHeartRate();
  }
  Future<void> getWeightData() async {
    steps.value = await repository.getWeight();
  }
  Future<void> getHeightData() async {
    steps.value = await repository.getHeight();
  }
}