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
      theme: ThemeData(primarySwatch: Colors.blueGrey),
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
  String text = 'no data';

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
              /// Open Right side sheet
              ElevatedButton(
                  onPressed: () =>
                      SideSheet.right(body: Text("Body"), context: context),
                  child: Text('OPEN RIGHT SIDE SHEET')),
              SizedBox(height: 10),

              /// Open Left side sheet
              ElevatedButton(
                  onPressed: () =>
                      SideSheet.left(body: Text("Body"), context: context),
                  child: Text('OPEN LEFT SIDE SHEET')),
              SizedBox(height: 20),

              /// Open Right side sheet with custom width
              ElevatedButton(
                  onPressed: () => SideSheet.right(
                      body: Text("Width is set to 0.3 of device Screen With"),
                      width: MediaQuery.of(context).size.width * 0.3,
                      context: context),
                  child: Text('OPEN SHEET WITH CUSTOM WIDTH')),
              SizedBox(height: 20),

              /// Open Left side sheet with returns args when click close icon
              ElevatedButton(
                  onPressed: () async {
                    final data = await SideSheet.left(
                        body: bodyWithReturnArgs(context), context: context);

                    setState(() {
                      text = data;
                    });
                  },
                  child: Text('OPEN LEFT SIDE SHEET WITH RETURN DATA')),
              SizedBox(height: 10),

              /// Open Right side sheet with returns args when click close icon
              ElevatedButton(
                  onPressed: () async {
                    final data = await SideSheet.right(
                        body: IconButton(
                            icon: Icon(Icons.close),
                            onPressed: () => Navigator.pop(
                                context, 'Data returns from right side sheet')),
                        context: context);

                    setState(() {
                      text = data;
                    });
                  },
                  child: Text('OPEN RIGHT SIDE SHEET WITH RETURN DATA')),
              SizedBox(height: 10),
              Text('Arguments: $text')
            ],
          ),
        ),
      ),
    );
  }
}

Widget bodyWithReturnArgs(context) {
  return Container(
    alignment: Alignment.topCenter,
    child: Column(
      children: [
        IconButton(
            icon: Icon(Icons.close),
            onPressed: () =>
                Navigator.pop(context, 'Data returns from left side sheet')),
        Text('Body')
      ],
    ),
  );
}
