import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketManager {
  WebSocketChannel? _channel;

  bool get isConnected => _channel != null;
  Stream<dynamic>? get stream => _channel?.stream;

  void connect(String url) {
    disconnect();
    _channel = WebSocketChannel.connect(Uri.parse(url));
  }

  void send(String payload) {
    _channel?.sink.add(payload);
  }

  Future<void> disconnect() async {
    await _channel?.sink.close();
    _channel = null;
  }
}
