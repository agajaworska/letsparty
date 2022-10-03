enum Flavor {
  development,
  production,
}

class Config {
  static Flavor appFlavor = Flavor.development;

  static String get helloMessage {
    switch (appFlavor) {
      case Flavor.production:
        return 'Users version';
      case Flavor.development:
      default:
        return 'Developers version';
    }
  }

  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.production:
        return 'http://api.weatherapi.com/v1/';
      case Flavor.development:
        return 'http://api.weatherapi.com/v1/';
    }
  }
}
