# Global Message

## Description

Displaying message in a snackbar, that appear anywhere in the app.

## Structure

The [GlobalMessageWrapper](GlobalMessageWrapper.dart) displays every message that is passed to the [MessageBloc](MessageBloc.dart). The GlobalMessageWrapper uses a StreamBuilder to fetch the messages from the MessageBloc and displays the message in the _showMessage method.

```dart
@override
Widget build(BuildContext context) {
    return StreamBuilder(
        initialData: null,
        stream: BlocProvider.of<GlobalBloc>(context).messageBloc.messageStream,
        builder: (BuildContext context, AsyncSnapshot<Message> snapshot) {
          Message msg = snapshot.data;
          if (msg != null) {
            WidgetsBinding.instance
                .addPostFrameCallback((_) => _showMessage(msg));
          }
          return Container(child: widget.child);
        }
    );
}
```

It is important to use the following lines of code. You can't display a snackbar inside the streambuilder, due to the snackbar will call setState during the streambuilder **builds** the widget. Flutter will throw "setState() or markNeedsBuild() called during build.".
A streambuilder should only build widgets!

```dart
WidgetsBinding.instance.addPostFrameCallback((_) => _showMessage(msg));
```

The [Message](Message.dart) class is used to store the message information like text and type. It can easily be extended!

```dart
class Message {
  final String text;
  final String type;

  Message(this.text, this.type);
}
```

To display a message, just add one to the MessageBloc.

```dart
BlocProvider.of<GlobalBloc>(context)
    .messageBloc
    .addition
    .add(Message("This is a success message", "success"));
```

## Additional Information

To use the [GlobalMessageWrapper](GlobalMessageWrapper.dart) globally in your app, put him on top of the widget tree. You could put it under your MaterialApp Widget in the main.dart file.