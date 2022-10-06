import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_task/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Snakbar',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Snackbar"),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (() => {Snackbar()}),
              child: Text("Show Snackbar"),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: (() => {Dialogbox()}),
              child: Text("Show Dialog"),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: (() => {bottomSheet()}),
              child: Text("Show bottomSheet"),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                //   Get.to(
                // Home(),
                // Home(),
                // arguments: "Data From Main",

                //to make screen Dialog box
                // fullscreenDialog: true,
                //to Provide animation
                //     transition: Transition.leftToRight,
                // Duration(seconds: 800),
                // Curves.bounceInOut,
                //  );
                var data = await Get.to(Home());
                print("Data Print" + '$data');
              },
              child: Text("Go To Home"),
            )
          ],
        )),
      ),
    );
  }
}

Snackbar() {
  return Get.snackbar("Snackbar", "This will be Snackbar message",
      snackPosition: SnackPosition.BOTTOM,
      titleText: Text("Snackbar Tittle"),
      messageText: Text(
        "Another Message",
        style: TextStyle(color: Colors.blue),
      ),
      duration: const Duration(seconds: 5),
      icon: Icon(Icons.arrow_back),
      shouldIconPulse: false,
      backgroundColor: Colors.yellowAccent,
      margin: EdgeInsets.all(5),
      borderRadius: 100,
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.bounceOut,
      mainButton: TextButton(
        onPressed: (() => {print("Texts")}),
        child: Text("Action"),
      ),
      onTap: ((snack) => {print("snackbar clicked")}),
      overlayBlur: 5,
      userInputForm: Form(
          child: Row(
        children: [
          Expanded(child: TextFormField()),
        ],
      )));
}

Dialogbox() {
  return Get.defaultDialog(
    title: "My Dialog Box",
    titleStyle: TextStyle(fontSize: 20),
    middleText: "This is discription msg",
    middleTextStyle: TextStyle(fontStyle: FontStyle.italic),
    content: Row(
      children: [
        CircularProgressIndicator(),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text("Data Loading"),
        ),
      ],
    ),
    textCancel: "Cancel",
    onCancel: (() => {
          print("Cancel "),
        }),
    textConfirm: "Confirm",
    onConfirm: () => {
      print("Confirm"),
    },
    actions: [
      ElevatedButton(
        onPressed: (() => {}),
        child: Text("Action 1"),
      ),
      ElevatedButton(
        onPressed: (() => {}),
        child: Text("Action 2"),
      ),
    ],
    barrierDismissible: false,
  );
}

bottomSheet() {
  return Get.bottomSheet(
    Container(
      child: Wrap(
        children: [
          ListTile(
            leading: Icon(Icons.wb_sunny_outlined),
            title: Text("Light Theme"),
            onTap: (() => {Get.changeTheme(ThemeData.light())}),
          ),
          ListTile(
            leading: Icon(Icons.wb_sunny),
            title: Text("Dark Theme"),
            onTap: (() => {Get.changeTheme(ThemeData.dark())}),
          )
        ],
      ),
    ),
    backgroundColor: Colors.blueAccent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
      side: BorderSide(
        color: Colors.white,
        style: BorderStyle.solid,
        width: 2.0,
      ),
    ),
  );
}
