# side_sheet
A flutter package for implementing of side sheets

A sample. font: https://material.io/components/sheets-side#usage

<img src="https://lh3.googleusercontent.com/fNu81WKVjDxTVuTQyFTfMyeuFkyAhoorIpaKRNFOiYh_G9GNilqdMNFfBbCf4-wZAbCxUW6uXvZ4lN-uzxyMnpcFKFbOSPE21hk1=w1064-v0" alt="sample" width="300"/>

Simple Usage:

```dart
ElevatedButton(
    onPressed: () =>
        SideSheet.right(
            body: Text("Body"),
                context: context
        ),
    child: Text('OPEN RIGHT SIDE SHEET')),


ElevatedButton(
    onPressed: () =>
        SideSheet.left(
            body: Text("Body"),
                context: context
        ),
    child: Text('OPEN LEFT SIDE SHEET')),
```

Custom Width Side Sheet:

```dart
ElevatedButton(
    onPressed: () =>
        SideSheet.right(
            context: context
            width: MediaQuery.of(context).size.width * 0.3,
            body: Text("Body"),
        ),
    child: Text('OPEN RIGHT SIDE SHEET WITH CUSTOM WIDTH')),


ElevatedButton(
    onPressed: () =>
        SideSheet.left(
            context: context
            width: MediaQuery.of(context).size.width * 0.3,
            body: Text("Body"),
        ),
    child: Text('OPEN LEFT SIDE SHEET WITH CUSTOM WIDTH')),
```

With return arguments

```dart
ElevatedButton(
    onPressed: () async {
      final data = await SideSheet.left(
            body: IconButton(icon: Icon(Icons.close),
                      onPressed: () => Navigator.pop(context, 'Data Returns Left')),
            context: context);

      print(data);
    },
    child: Text('OPEN LEFT SIDE SHEET WITH RETURN DATA')
),

ElevatedButton(
    onPressed: () async {
      final data = await SideSheet.right(
            body: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () => Navigator.pop(context, 'Data Returns Right')),
            context: context);

      print(data);
    },
    child: Text('OPEN RIGHT SIDE SHEET WITH RETURN DATA')
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
#
[![Buy Me A Coffee](https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png)](https://www.buymeacoffee.com/israelhudson)
