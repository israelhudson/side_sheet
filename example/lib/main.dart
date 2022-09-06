import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:side_sheet/side_sheet.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String language = "en";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Side Sheet',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      locale: Locale(language),
      supportedLocales: [Locale("en"), Locale("ar")],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      home: MyHomePage(
          language: language,
          onLanguageChanged: (newLanguage) {
            setState(() {
              language = newLanguage;
            });
          },
          title: 'Side Sheet Example'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage(
      {Key? key,
      required this.title,
      required this.language,
      required this.onLanguageChanged})
      : super(key: key);
  final String title;
  final ValueChanged<String> onLanguageChanged;
  final String language;

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
      body: Builder(builder: (context) {
        print(Directionality.of(context));
        return Center(
          child: SingleChildScrollView(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                      height: MediaQuery.of(context).size.height,
                      color: Colors.cyan,
                      child: Center(
                        child: Text(
                          "START",
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(color: Colors.white),
                        ),
                      )),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      TextButton(
                        onPressed: () {
                          widget.onLanguageChanged(
                              widget.language == "en" ? "ar" : "en");
                        },
                        child: Text("Toggle Language: ${widget.language}"),
                      ),
                      SizedBox(height: 10),

                      /// Open Start side sheet
                      ElevatedButton(
                          onPressed: () => SideSheet.start(
                              body: Text("Body"), context: context),
                          child: Text('OPEN START SIDE SHEET')),
                      SizedBox(height: 10),

                      /// Open End side sheet
                      ElevatedButton(
                          onPressed: () => SideSheet.end(
                              body: Text("Body"), context: context),
                          child: Text('OPEN END SIDE SHEET')),
                      SizedBox(height: 20),

                      /// Open END side sheet with custom width
                      ElevatedButton(
                          onPressed: () => SideSheet.start(
                              body: Text(
                                  "Width is set to 0.3 of device Screen With"),
                              width: MediaQuery.of(context).size.width * 0.3,
                              context: context),
                          child: Text('OPEN SHEET WITH CUSTOM WIDTH')),
                      SizedBox(height: 20),

                      /// Open End side sheet with returns args when click close icon
                      ElevatedButton(
                          onPressed: () async {
                            final data = await SideSheet.end(
                                body: bodyWithReturnArgs(context),
                                context: context);

                            setState(() {
                              text = data;
                            });
                          },
                          child: Text('OPEN END SIDE SHEET WITH RETURN DATA')),
                      SizedBox(height: 10),

                      /// Open Start side sheet with returns args when click close icon
                      ElevatedButton(
                          onPressed: () async {
                            final data = await SideSheet.start(
                                body: IconButton(
                                    icon: Icon(Icons.close),
                                    onPressed: () => Navigator.pop(context,
                                        'Data returns from Start side sheet')),
                                context: context);

                            setState(() {
                              text = data;
                            });
                          },
                          child:
                              Text('OPEN START SIDE SHEET WITH RETURN DATA')),
                      SizedBox(height: 10),
                      Text('Arguments: $text')
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                  height: MediaQuery.of(context).size.height,
                  color: Colors.lightBlue,
                  child: Center(
                      child: Text(
                    "END",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(color: Colors.white),
                  )),
                )),
              ],
            ),
          ),
        );
      }),
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
                Navigator.pop(context, 'Data returns from end side sheet')),
        Text('Body')
      ],
    ),
  );
}
