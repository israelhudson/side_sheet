# side_sheet
A flutter package for implementing of side sheets

A sample. font: https://material.io/components/sheets-side#usage

<img src="https://lh3.googleusercontent.com/fNu81WKVjDxTVuTQyFTfMyeuFkyAhoorIpaKRNFOiYh_G9GNilqdMNFfBbCf4-wZAbCxUW6uXvZ4lN-uzxyMnpcFKFbOSPE21hk1=w1064-v0" alt="sample" width="300"/>

Simple Usage (Respecting App's Directionality):

```dart
ElevatedButton(
    onPressed: () =>
        SideSheet.end(
            body: Text("Body"),
                context: context
        ),
    child: Text('OPEN END (RIGHT if ltr) SIDE SHEET')),


ElevatedButton(
    onPressed: () =>
        SideSheet.start(
            body: Text("Body"),
                context: context
        ),
    child: Text('OPEN START (LEFT if ltr) SIDE SHEET')),
```

Custom Width Side Sheet:

```dart
ElevatedButton(
    onPressed: () =>
        SideSheet.end(
            context: context
            width: MediaQuery.of(context).size.width * 0.3,
            body: Text("Body"),
        ),
    child: Text('OPEN END SIDE SHEET WITH CUSTOM WIDTH')),


ElevatedButton(
    onPressed: () =>
        SideSheet.start(
            context: context
            width: MediaQuery.of(context).size.width * 0.3,
            body: Text("Body"),
        ),
    child: Text('OPEN START SIDE SHEET WITH CUSTOM WIDTH')),
```

With return arguments

```dart
ElevatedButton(
    onPressed: () async {
      final data = await SideSheet.start(
            body: IconButton(icon: Icon(Icons.close),
                      onPressed: () => Navigator.pop(context, 'Data Returns Start')),
            context: context);

      print(data);
    },
    child: Text('OPEN START SIDE SHEET WITH RETURN DATA')
),

ElevatedButton(
    onPressed: () async {
      final data = await SideSheet.end(
            body: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () => Navigator.pop(context, 'Data Returns END')),
            context: context);

      print(data);
    },
    child: Text('OPEN END SIDE SHEET WITH RETURN DATA')
),    
```

Close sheet in body

```dart
Navigator.pop(context);
```

With arguments

```dart
Navigator.pop(context, 'data return');
```
