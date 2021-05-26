# side_sheet
 a flutter package for implementing of side sheets

A sample. font: https://material.io/components/sheets-side#usage

<img src="https://lh3.googleusercontent.com/fNu81WKVjDxTVuTQyFTfMyeuFkyAhoorIpaKRNFOiYh_G9GNilqdMNFfBbCf4-wZAbCxUW6uXvZ4lN-uzxyMnpcFKFbOSPE21hk1=w1064-v0" alt="sample" width="300"/>

usage:

```dart
              ElevatedButton(
                  onPressed: () =>
                      SheetSide.right(
                          body: Text("Body"),
                          context: context
                      ),
                  child: Text('OPEN RIGHT SIDE SHEET')),

              ElevatedButton(
                  onPressed: () =>
                      SheetSide.left(
                          body: Text("Body"),
                          context: context
                      ),
                  child: Text('OPEN LEFT SIDE SHEET')),           
```
