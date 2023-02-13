enum Message {
  /// When client request menu from server
  requestMenu('request_menu');

  const Message(this.value);

  final String value;
}
