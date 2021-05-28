import 'package:flutter/material.dart';
import 'package:side_sheet/side_sheet.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Side Sheet',
      home: MyHomePage(title: 'Side Sheet Example'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                  onPressed: () =>
                      SideSheet.right(
                          body: Text("Body"),
                          context: context
                      ),
                  child: Text('OPEN RIGHT SIDE SHEET')),

              SizedBox(height: 10),

              ElevatedButton(
                  onPressed: () =>
                      SideSheet.left(
                          body: Text("Body"),
                          context: context
                      ),
                  child: Text('OPEN LEFT SIDE SHEET')),
            ],
          ),
        ),
      ),
    );
  }
}
