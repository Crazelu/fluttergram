abstract class StorageService {
  ///Stores a string value with `key`
  Future<void> store({String key, required String value});

  ///Deletes a string value stored with `key`
  Future<void> delete({String key, required String value});

  ///Fetches a string value stored with `key`
  Future<String?> read(String key);
}

class StorageServiceImpl implements StorageService {
  static const USER = 'userId';
  @override
  Future<String?> read(String key) async {
    throw UnimplementedError();
  }

  @override
  Future<void> store({String key = USER, required String value}) async {
    throw UnimplementedError();
  }

  @override
  Future<void> delete({String key = USER, required String value}) {
    throw UnimplementedError();
  }
}
