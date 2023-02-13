enum Message {
  /// When client request menu from server
  requestMenu('request_menu'),
  updateMenu('update_menu');

  const Message(this.value);

  final String value;
}
