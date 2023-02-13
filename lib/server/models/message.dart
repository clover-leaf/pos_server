enum Message {
  /// When client request menu from server
  /// i.e {'type': 'request_menu'}
  requestMenu('request_menu'),

  /// When kitchen update item in-stock status
  /// i.e {'type': 'update_item', 'item': Item.toJson}
  updateItem('update_item');

  const Message(this.value);

  final String value;
}
