
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HiveService {
  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  static const String _encryptionKeyName = 'HIVE_ENCRYPTION_KEY';

  // init Hive with Encrypt
  Future<void> initHiveStorage() async {
    await Hive.initFlutter();
    await _ensureEncryptionKey();
  }

  // open Box with Encrypt
  Future<Box> initHiveBox(String boxName) async {
    final encryptionKey = await _getEncryptionKey();
    return Hive.openBox(
      boxName,
      encryptionCipher: HiveAesCipher(encryptionKey),
    );
  }

  //  get on Box by name
  Box getHiveBox(String boxName) {
    return Hive.box(boxName);
  }

  Future<void> deleteBoxFromDisk(String boxName) async {
    await Hive.deleteBoxFromDisk(boxName);
  }

  // التحقق من وجود مفتاح التشفير أو إنشاء واحد جديد
  Future<void> _ensureEncryptionKey() async {
    final containsKey = await _secureStorage.containsKey(key: _encryptionKeyName);
    if (!containsKey) {
      final key = Hive.generateSecureKey();
      await _secureStorage.write(
        key: _encryptionKeyName,
        value: base64UrlEncode(key),
      );
    }
  }

  // جلب مفتاح التشفير
  Future<List<int>> _getEncryptionKey() async {
    final encodedKey = await _secureStorage.read(key: _encryptionKeyName);
    if (encodedKey == null) throw Exception('Encryption key not found');
    return base64Url.decode(encodedKey);
  }
}

class StorageService {
  putSharedPrefBoolValue(String key, bool value) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  Future<bool?> getSharedPrefBoolValue(String key) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.reload();
    return prefs.getBool(key);
  }
}