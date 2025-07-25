import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:solari/core/errors/exceptions.dart';
import '../../../../injection_container.dart';

const String _accessTokenKey = 'access_token_key';
const String _deviceTokenKey = 'device_token_key';
const String _passwordKey = 'password_key';
const String _emailKey = 'email_key';

abstract class AuthLocalDataSource {
  Future<void> cacheUserAccessToken({required String token});
  Future<void> cacheUserDeviceToken({required String? deviceToken});
  Future<void> cacheUserCredentials({
    required String email,
    required String password,
  });
  Future<void> cacheUserEmail({
    required String email,
  });

  Future<(String email, String password)> getCacheUserCredentials();
  Future<String> getCacheUserAccessToken();
  Future<String> getCacheUserDeviceToken();
  Future<String> getCacheUserEmail();

  Future<void> clearData();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;
  AuthLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheUserDeviceToken({required String? deviceToken}) async {
    try {
      await secureStorage.write(key: _deviceTokenKey, value: deviceToken);
    } catch (e) {
      log(e.toString());
      throw CacheException();
    }
  }

  @override
  Future<String> getCacheUserDeviceToken() async {
    try {
      final String? deviceToken =
          await secureStorage.read(key: _deviceTokenKey);
      if (deviceToken != null) {
        return deviceToken;
      } else {
        throw CacheException();
      }
    } on CacheException {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheUserAccessToken({required String token}) async {
    try {
      await secureStorage.write(key: _accessTokenKey, value: token);
    } catch (e) {
      log(e.toString());
      throw CacheException();
    }
  }

  @override
  Future<String> getCacheUserAccessToken() async {
    try {
      final String? token = await secureStorage.read(key: _accessTokenKey);
      if (token != null) {
        return token;
      } else {
        throw CacheException();
      }
    } on CacheException {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheUserCredentials(
      {required String email, required String password}) async {
    try {
      await secureStorage.write(key: _passwordKey, value: password);
      await secureStorage.write(key: _emailKey, value: email);
    } catch (e) {
      log(e.toString());
      throw CacheException();
    }
  }

  @override
  Future<(String, String)> getCacheUserCredentials() async {
    try {
      final String? phone = await secureStorage.read(key: _emailKey);
      final String? password = await secureStorage.read(key: _passwordKey);
      if (phone == null || password == null) {
        throw CacheException();
      } else {
        return (phone, password);
      }
    } catch (e) {
      log(e.toString());
      throw CacheException();
    }
  }

  @override
  Future<void> clearData() async {
    try {
      await secureStorage.deleteAll();
      await sharedPreferences.clear();
    } catch (e) {
      log(e.toString());
      throw CacheException();
    }
  }

  @override
  Future<void> cacheUserEmail({required String email}) async {
    try {
      await secureStorage.write(key: _emailKey, value: email);
    } catch (e) {
      log(e.toString());
      throw CacheException();
    }
  }

  @override
  Future<String> getCacheUserEmail() async {
    try {
      final String? email = await secureStorage.read(key: _emailKey);
      if (email != null) {
        return email;
      } else {
        throw CacheException();
      }
    } on CacheException {
      throw CacheException();
    }
  }
}
