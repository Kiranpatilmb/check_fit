import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'health_card.dart';
import 'health_screen.dart';

class HeartRatePage extends StatefulWidget {
  const HeartRatePage({super.key});

  @override
  State<HeartRatePage> createState() => _HeartRatePageState();
}

class _HeartRatePageState extends State<HeartRatePage> {
  final controller = HomeController();

  @override
  void initState() {
    setState(() {
      controller.getHeartRateData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Health Rate Data')),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () => {
              setState(() {
                controller.getHeartRateData();
              })
            },
            child: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: controller.steps,
        builder: (context, value, child) {
          return value.isEmpty
              ? const Center(child: Text("No any heart rate data available"))
              : GridView(
                  padding: const EdgeInsets.all(15),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15),
                  children: [
                    for (final footSteps in value)
                      HealthCard(footSteps: footSteps),
                  ],
                );
        },
      ),
    );
  }
}
