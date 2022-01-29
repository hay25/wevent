enum AppNotifyPlayform {
  ANDROID,
  IOS,
  WEB,
}

extension AppNotifyPlayformExtension on AppNotifyPlayform {
  int get val {
    switch (this) {
      case AppNotifyPlayform.ANDROID:
        return 1;
      case AppNotifyPlayform.IOS:
        return 2;
      case AppNotifyPlayform.WEB:
        return 3;
      default:
        return 0;
    }
  }
}

const String BASE_URL = "https://wwmsoft.com/";

enum APILinks {
  SESSIONS,
}

extension APILinksExtension on APILinks {
  String get url {
    switch (this) {
      case APILinks.SESSIONS:
        return BASE_URL + "api.json";
      default:
        return "";
    }
  }
}

enum ProfileEdit { PROFIL, SOCIALMEDIA }
enum AppEnums { FACEBOOK, TWITTER, INSTAGRAM, PINTEREST, CLUBHOUSE, WEB, EPOSTA }
