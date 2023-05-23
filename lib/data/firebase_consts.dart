class FirebaseConsts {
  static const String firebaseProject = 'cruud-b06af-default-rtdb';
  static const String apiKey = 'AIzaSyCc6xmcaKQqJ7hmTUImyantddlgNaQUOJo';

  static String authenticationUrl(String service) {
    return 'https://identitytoolkit.googleapis.com/v1/accounts:$service?key=${FirebaseConsts.apiKey}';
  }

  static String get orderUrl {
    return 'https://${FirebaseConsts.firebaseProject}.firebaseio.com/orders';
  }

  static String get productUrl {
    return 'https://${FirebaseConsts.firebaseProject}.firebaseio.com/products';
  }

  static String get favoriteUserProductUrl {
    return 'https://${FirebaseConsts.firebaseProject}.firebaseio.com/userFavoriteProducts';
  }
}
