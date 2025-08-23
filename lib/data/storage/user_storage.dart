import 'package:shared_preferences/shared_preferences.dart';

class UserStorage {
  static const String _tokenKey = "auth_token";
  static const String _classSelected = 'Class-Selected';

  /// tên hiển thị
  static const String _username = "user-name";
  static const String _avatarUrl = "avatarUrl";

  /// tk đăng nhập
  static const String _phoneLogin = "phone-login";
  static const String _password = "pass-word";
  static const String _userId = "user-id";
  static const String _yearOfBirth = "year-of-birth";
  static const String _lop = "lop";

  /// Save token to SharedPreferences
  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  /// Retrieve token from SharedPreferences
  static Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey) ?? '';
  }

  /// Clear token from SharedPreferences
  static Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }

  /// lưu lớp học của user
  static Future<void> setSelectClass(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_classSelected, value);
  }

  /// get ra lớp học của user
  static Future<String> getSelectClass() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_classSelected) ?? '12';
  }

  static Future<void> clearSelectClass() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_classSelected);
  }

// Tên người dùng (username): Hiển thị trong ứng dụng.
  static Future<void> saveUsername(String userName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_username, userName);
  }

  static Future<String> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_username) ?? '';
  }

  static Future<void> clearUsername() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_username);
  }

//   Avatar URL: Đường dẫn ảnh đại diện.
  static Future<void> saveAvatarUrl(String avatar) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_avatarUrl, avatar);
  }

  static Future<String> getAvatarUrl() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_avatarUrl) ?? '';
  }

  static Future<void> clearAvatarUrl() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_avatarUrl);
  }

  // Email hoặc số điện thoại: Dùng để hiển thị hoặc hỗ trợ tính năng liên lạc.
  static Future<void> savePhone(String account) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_phoneLogin, account);
  }

  static Future<String> getPhone() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_phoneLogin) ?? '';
  }

  static Future<void> clearPhone() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_phoneLogin);
  }

  static Future<void> savePassword(String setPassword) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_password, setPassword);
  }

  static Future<String> getPassword() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_password) ?? '';
  }

  static Future<void> clearPassword() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_password);
  }

  static Future<void> saveUserId(String setUserId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userId, setUserId);
  }

  static Future<String> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userId) ?? '';
  }

  /// Trả về null nếu ko tìm thấy giá trị.
  static Future<String?> getUserIdV2() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userId);
  }

  static Future<void> clearUserId() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userId);
  }

  static Future<void> saveYearOfBirth(String yearOfBirth) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_yearOfBirth, yearOfBirth);
  }

  static Future<String> getYearOfBirth() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_yearOfBirth) ?? '';
  }

  static Future<void> clearYearOfBirth() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_yearOfBirth);
  }

  static Future<void> saveLop(int lopHoc) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_lop, lopHoc);
  }

  static Future<int> getLop() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_lop) ?? 12;
  }

  static Future<void> clearLop() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_lop);
  }

  static Future<void> clearAllAuth() async {
    clearToken();
    // clearSelectClass();
    clearUsername();
    clearAvatarUrl();
    clearPhone();
    clearPassword();
    clearUserId();
    clearYearOfBirth();
    await clearToken();
  }
}
