import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (() => {}),
              child: Text("Next Screen"),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () => {
                // Get.back()
                Get.back(result: " This data send by Home")
              },
              child: Text("Back To Home"),
            ),
            Text("This Data come From " + '${Get.arguments}')
          ],
        ),
      ),
    );
  }
}
