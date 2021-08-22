import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class StorageService {
  ///Stores a string value with `key`
  Future<void> store({String key, required String value});

  ///Deletes a string value stored with `key`
  Future<void> delete([String key]);

  ///Fetches a string value stored with `key`
  Future<String?> read([String key]);
}

class StorageServiceImpl implements StorageService {
  late FlutterSecureStorage storage;

  StorageServiceImpl({FlutterSecureStorage? storage}) {
    this.storage = storage ?? FlutterSecureStorage();
  }

  static const USER = 'userId';
  @override
  Future<String?> read([String key = USER]) async {
    return await storage.read(key: key);
  }

  @override
  Future<void> store({String key = USER, required String value}) async {
    await storage.write(key: key, value: value);
  }

  @override
  Future<void> delete([String key = USER]) async {
    await storage.delete(key: key);
  }
}
