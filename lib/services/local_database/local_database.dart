abstract class LocalDatabase {
  Future<dynamic> init([String? boxName]) async {}
  void store(String key, dynamic value) {}
  dynamic get(String key) {}
  void update(String key, dynamic value) {}
  void delete(String key) {}
}
