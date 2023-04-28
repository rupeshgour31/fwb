import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  static const String _isUserLoggedIn = 'is_user_logged_in';
  static const String _userIDPrefKey = 'user_id_pref_key';
  static const String _authTokenPrefKey = 'auth_token_pref_key';
  static const String _emailPrefKey = 'email_key';
  static const String _usernamePrefKey = 'username_key';
  static const String _userRolePrefKey = 'first_role';
  static const String _fullNamePrefKey = 'full_name';
  static const String _mobilePrefKey = 'mobile_number';
  static const String _profilePrefKey = 'profile_img';
  static const String _passwordRemember = 'pass_remember';

  SharedPrefHelper._();

  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  ///userid
  static int? get userId {
    return _prefs.getInt(_userIDPrefKey);
  }

  static set userId(int? value) {
    if (value != null) {
      _prefs.setInt(_userIDPrefKey, value);
    } else {
      _prefs.remove(_userIDPrefKey);
    }
  }

  ///isLogged in
  static bool get isLoggedIn {
    return _prefs.getBool(_isUserLoggedIn) ?? false;
  }

  static set isLoggedIn(bool? value) {
    _prefs.setBool(_isUserLoggedIn, value!);
  }

  ///Pass Remember
  static bool get passRemember {
    return _prefs.getBool(_passwordRemember) ?? false;
  }

  static set passRemember(bool value) {
    _prefs.setBool(_passwordRemember, value);
  }

  ///auth token
  static String get authToken {
    return _prefs.getString(_authTokenPrefKey) ?? "";
  }

  static set authToken(String value) {
    _prefs.setString(_authTokenPrefKey, value);
  }

  ///username
  static String get username {
    return _prefs.getString(_usernamePrefKey) ?? "";
  }

  static set username(String value) {
    _prefs.setString(_usernamePrefKey, value);
  }

  ///user role
  static String? get userRole {
    return _prefs.getString(_userRolePrefKey);
  }

  static set userRole(String? value) {
    if (value != null) {
      _prefs.setString(_userRolePrefKey, value);
    } else {
      _prefs.remove(_userRolePrefKey);
    }
  }

  ///user fullName
  static String? get fullName {
    return _prefs.getString(_fullNamePrefKey);
  }

  static set fullName(String? value) {
    if (value != null) {
      _prefs.setString(_fullNamePrefKey, value);
    } else {
      _prefs.remove(_fullNamePrefKey);
    }
  }

  ///user email
  static String? get userEmail {
    return _prefs.getString(_emailPrefKey);
  }

  static set userEmail(String? value) {
    if (value != null) {
      _prefs.setString(_emailPrefKey, value);
    } else {
      _prefs.remove(_emailPrefKey);
    }
  }

  ///user mobile
  static String? get userMobile {
    return _prefs.getString(_mobilePrefKey);
  }

  static set userMobile(String? value) {
    if (value != null) {
      _prefs.setString(_mobilePrefKey, value);
    } else {
      _prefs.remove(_mobilePrefKey);
    }
  }

  ///user profile
  static String? get userProfile {
    return _prefs.getString(_profilePrefKey);
  }

  static set userProfile(String? value) {
    if (value != null) {
      _prefs.setString(_profilePrefKey, value);
    } else {
      _prefs.remove(_profilePrefKey);
    }
  }
}
