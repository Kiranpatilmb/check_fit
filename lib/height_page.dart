import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'health_card.dart';
import 'health_screen.dart';

class HeightPage extends StatefulWidget {
  const HeightPage({super.key});

  @override
  State<HeightPage> createState() => _HeightPageState();
}

class _HeightPageState extends State<HeightPage> {
  final controller = HomeController();

  @override
  void initState() {
    setState(() {
      controller.getHeightData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Height Data')),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () => {
              setState(() {
                controller.getHeightData();
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
              ? const Center(child: Text("No any height data available"))
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
