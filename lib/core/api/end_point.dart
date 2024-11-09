class EndPoint {
  static const String baseUrl = 'http://walker-stores.com/api/';
  static const String login = 'login';
  static const String signUp = 'signup';
  static const String getCategories = 'categories';
  static const String getLatestOffers = 'latest_offers';
  static const String getBrands = 'brands';
  static const String getBrandsProduct = 'brands/products';
  static const String getSubCategories = 'categories/sub';
  static const String getSubCategoriesProduct = 'categories/products';
  static const String getMostVisited = 'most_visited';
  static const String getSlider = 'slider';
  static const String orderRequest = 'orderRequest';
  static const String getGovernments = 'governoratesdata';
  static const String getCitys = 'get_cities';
  static const String getZones = 'get_zones';
  static const String postAddress = 'address';
  static const String getMyOrders = 'mypurchases';
  static const String useraddresses = 'user/addresses';
  static const String updatePassword = 'myinfo/update_password';
}

class ApiKey {
  static const String token = 'Authorization';
  static const String decodedToken = 'decodedToken';
}
