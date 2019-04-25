import 'dart:async';
import 'package:advanced_flutter_example/basic/BlocProvider.dart';
import 'package:advanced_flutter_example/examples/globalMessage/Message.dart';
import 'package:rxdart/rxdart.dart';

class MessageBloc implements BlocBase {
  /// Sinks
  Sink<Message> get addition => messageAdditionController.sink;
  final messageAdditionController = StreamController<Message>();

  /// Streams
  Stream<Message> get messageStream => _message.stream;
  final _message = BehaviorSubject<Message>();

  MessageBloc() {
    messageAdditionController.stream.listen(handleMessageAdd);
  }

  ///
  /// Logic for message added .
  ///
  void handleMessageAdd(Message msg) {
    _message.add(msg);
    return;
  }

  @override
  void dispose() {
    messageAdditionController.close();
  }
}
