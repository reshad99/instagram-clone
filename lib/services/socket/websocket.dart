import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService {
  late final WebSocketChannel _channel;
  final _messageController = StreamController<dynamic>.broadcast();

  Stream<dynamic> get messages => _messageController.stream;

  WebSocketService(String url, String token) {
    _channel = WebSocketChannel.connect(Uri.parse(url));

    // WebSocket üzerinden gelen verileri dinle
    _channel.stream.listen(
      (data) {
        _messageController.add(data); // StreamController'a veri ekle
      },
      onError: (error) {
        debugPrint('WebSocket Error: $error');
        _messageController
            .addError(error); // Hata durumunda StreamController'a hata ekle
      },
      onDone: () {
        debugPrint('WebSocket connection closed');
        _messageController
            .close(); // Bağlantı kapandığında StreamController'ı kapat
      },
    );

    authenticate(token); // WebSocket üzerinden kimlik doğrulaması yap
  }

  void authenticate(String token) {
    sendJson({
      'token': token,
    });
  }

  void sendDirectMessage(int toUserId, String message) {
    sendJson({
      'type': 'direct_message',
      'toUserId': toUserId,
      'message': message,
    });
  }

  void sendMessage(String room, String message) {
    sendJson({
      'type': 'message',
      'room': room,
      'message': message,
    });
    debugPrint('Websocket message sended');
  }

  void joinRoom(String room) {
    sendJson({
      'type': 'join_room',
      'room': room,
    });
    debugPrint('Websocket joined room');
  }

  void createRoom(int toUserId) {
    sendJson({
      'type': 'create_room',
      'toUserId': toUserId,
    });
  }

  void deleteRoom(int roomId) {
    sendJson({
      'type': 'delete_room',
      'room': roomId,
    });
  }

  void sendJson(Map<String, dynamic> data) {
    _channel.sink.add(jsonEncode(data));
  }

  void close() {
    _channel.sink.close();
  }

  void dispose() {
    _messageController.close();
  }
}
