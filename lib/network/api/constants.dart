class ApiConstants {
  ApiConstants._();

  static String baseUrl = 'https://aino-tech-server.onrender.com/api/v1';

  static String login = '/user/login';
  static String createAccount = '/user/createAccount';


  // Products
  static String fetchAllProducts = '/product/get-products/';
  static String fetchAProduct = '/product/details/';

  // Reviews and Rating
  static String fetchAllReviews = '/product-reviews/reviews/';
  static String fetchAllRatings = '/product-reviews/ratings/';
  static String addReviews = '/product-reviews/reviews/';

// Favourite
  static String addToFavourite = "/orders/add-to-favs/";
  static String viewFavourite = "/orders/favorites";
  static String removeFromFavourite = "/orders/remove-from-favs/";

  // receiveTimeout
  static const Duration receiveTimeout = Duration(milliseconds: 60000);

  // connectTimeout
  static const Duration connectionTimeout = Duration(milliseconds: 60000);
}
