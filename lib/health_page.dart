import 'package:flutter/material.dart';

import 'health_card.dart';
import 'health_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {

  final controller = HomeController();

  @override
  void initState() {
    setState(() {
      controller.getStepsData();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Steps Data')),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () => {
            setState(() {
            controller.getStepsData();
            })
          },
            child: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: controller.steps,
        builder: (context, value, child) {
          return value.isEmpty?const Center(child:Text("No any steps data available")): GridView(
            padding: const EdgeInsets.all(15),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15),
            children: [

              for (final footSteps in value)
                HealthCard(footSteps:footSteps)
            ],
          );
        },
      ),
    );
  }
}