# Description
Outsourcing some checkboxes, radiobuttons and switches to a modal and a bottomsheet. We have to use 
a **StatefullWidgetBuilder** so that the input fields will be updated within the ui.
The reason for this is that the status of the modal / bottom sheet is independent of the status of 
the current screen. 
So when we call the **setState((){ ... })** it will update the ui in the background but not the ui in the
modal / bottom sheet.

# Structure

We setup some variables that will be used by the checkboxes, switches and radiobuttons.

```dart
bool modalIsChecked = false;
bool modalIsSwitched = false;
int modalRadioValue = 0;

bool bottomIsChecked = false;
bool bottomIsSwitched = false;
int bottomRadioValue = 0;
```
We setup two buttons to display the modal and the bottom sheet.

```dart
RaisedButton(
  onPressed: () {
    // display modal
  },
  child: Text("Show modal"),
),
RaisedButton(
  onPressed: () {
    // display bottom sheet
  },
  child: Text("Show bottom sheet"),
),
```
When we press the button to display the bottom sheet, we will call the **showModalBottomSheet()** method.
We set a normal builder and return a StatefulBuilder. This is very important because we need the StateSetter
to update the ui in the bottom sheet.
```dart
showModalBottomSheet<void>(
  context: context,
  builder: (BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter state) {
        // Build the layout
      }
  }
);
```
Here comes the most important part. We don't call the **setState((){ ... })** method. We use the 
**StateSetter** called **state** from the **StatefulBuilder**. 
Use **state((){ ... })** to update the ui of the bottom sheet.

```dart
onChanged: (value) {
  state(() {
    bottomIsChecked = value;
  });
}
```

_Additional information : **state** is just the name of the StateSetter variable, it is possible to use 
another name and therefore change the method._