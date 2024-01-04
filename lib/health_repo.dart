import 'package:health/health.dart';

import 'foot_steps.dart';

class HealthRepository {
  final health = HealthFactory();
  Future<List<FootSteps>> getFootSteep() async {
    bool requested = await health.requestAuthorization([HealthDataType.STEPS]);

    if (requested) {
      var now = DateTime.now();
      List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
          DateTime.now().subtract(const Duration(days: 7)),
          DateTime.now(),
          [HealthDataType.STEPS]);
      return healthData.map((e) {
        var b = e;
        return FootSteps(
          double.parse(b.value.toString()),
          b.unitString,
          b.dateFrom,
          b.dateTo,
        );
      }).toList();
    }

    return [];
  }
  Future<List<FootSteps>> getSleep() async {
    bool requested = await health.requestAuthorization([HealthDataType.SLEEP_IN_BED]);

    if (requested) {
      var now = DateTime.now();
      List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
          DateTime.now().subtract(const Duration(days: 7)),
          DateTime.now(),
          [HealthDataType.SLEEP_IN_BED]);
      return healthData.map((e) {
        var b = e;
        return FootSteps(
          double.parse(b.value.toString()),
          b.unitString,
          b.dateFrom,
          b.dateTo,
        );
      }).toList();
    }

    return [];
  }
  Future<List<FootSteps>> getHeartRate() async {
    bool requested = await health.requestAuthorization([HealthDataType.HEART_RATE]);

    if (requested) {
      var now = DateTime.now();
      List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
          DateTime.now().subtract(const Duration(days: 7)),
          DateTime.now(),
          [HealthDataType.HEART_RATE]);
      return healthData.map((e) {
        var b = e;
        return FootSteps(
          double.parse(b.value.toString()),
          b.unitString,
          b.dateFrom,
          b.dateTo,
        );
      }).toList();
    }

    return [];
  }
  Future<List<FootSteps>> getHeight() async {
    bool requested = await health.requestAuthorization([HealthDataType.HEIGHT]);

    if (requested) {
      var now = DateTime.now();
      List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
          DateTime.now().subtract(const Duration(days: 7)),
          DateTime.now(),
          [HealthDataType.HEIGHT]);
      return healthData.map((e) {
        var b = e;
        return FootSteps(
          double.parse(b.value.toString()),
          b.unitString,
          b.dateFrom,
          b.dateTo,
        );
      }).toList();
    }

    return [];
  }
  Future<List<FootSteps>> getWeight() async {
    bool requested = await health.requestAuthorization([HealthDataType.WEIGHT]);

    if (requested) {
      var now = DateTime.now();
      List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
          DateTime.now().subtract(const Duration(days: 7)),
          DateTime.now(),
          [HealthDataType.WEIGHT]);
      return healthData.map((e) {
        var b = e;
        return FootSteps(
          double.parse(b.value.toString()),
          b.unitString,
          b.dateFrom,
          b.dateTo,
        );
      }).toList();
    }

    return [];
  }

}