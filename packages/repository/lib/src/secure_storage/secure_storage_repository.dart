import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

abstract class ISecureStorageRepository {
  Future<void> writeEmail(String key, String email);
  Future<void> writePassword(String key, String password);
  Future<String?> readEmail(String key);
  Future<String?> readPassword(String key);
}

@Injectable(as: ISecureStorageRepository)
class SecureStorageRepository implements ISecureStorageRepository {
  final storage = FlutterSecureStorage();

  static const EMAIL_KEY = 'storage-user-email-key';
  static const PASSWORD_KEY = 'storage-user-password-key';

  @override
  Future<String?> readEmail(String key) async => await storage.read(key: key);

  @override
  Future<String?> readPassword(String key) async => await storage.read(key: key);

  @override
  Future<void> writeEmail(String key, String email) async =>
      await storage.write(key: key, value: email);

  @override
  Future<void> writePassword(String key, String password) async =>
      storage.write(key: key, value: password);
}
