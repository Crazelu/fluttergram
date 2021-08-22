abstract class StorageService {
  ///Stores a string value with `key`
  Future<void> store({required String key, required String value});

  ///Fetches a string value stored with `key`
  Future<String?> read(String key);
}

class StorageServiceImpl implements StorageService {
  @override
  Future<String?> read(String key) async {
    throw UnimplementedError();
  }

  @override
  Future<void> store({required String key, required String value}) async {
    throw UnimplementedError();
  }
}
