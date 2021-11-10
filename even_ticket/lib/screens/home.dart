import 'package:even_ticket/controllers/counter_controller.dart';
import 'package:even_ticket/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final CounterController counterController = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text("Clicks: ${counterController.counter.value}")),
            const SizedBox(
              height: 10,
            ),
            Center(
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(LoginScreen());
                    },
                    child: const Text("Open Other Screen")))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterController.increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
