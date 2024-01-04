import 'package:flutter/material.dart';
import 'package:health/health.dart';

import 'foot_steps.dart';

class HealthCard extends StatelessWidget {
  final FootSteps footSteps;
  final health = HealthFactory();

   HealthCard({super.key, required this.footSteps});
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.grey,
      color: Colors.cyan,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            footSteps.value.toStringAsFixed(2),
            style: const TextStyle(fontSize: 24,color: Colors.pink),
          ),
          Text(
            footSteps.unit.toString(),
            style: const TextStyle(color: Colors.pink),
          ),
          Text(
            footSteps.dateFrom.toString(),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}