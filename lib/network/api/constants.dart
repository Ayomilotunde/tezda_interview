class ApiConstants {
  ApiConstants._();

  static String baseUrl = 'https://aino-tech-server.onrender.com/api/v1';

  static String login = '/user/login';
  static String createAccount = '/user/createAccount';
  static String profile = '/user/get-user-detail';
  static String updateProfile = '/user/update-user-details';
  static String updatePassword = '/user/update-password';
  static String updateToken = '/account/update-token';
  static String verifyAccount = '/user/verify-account';
  static String resendOTP = '/user/resend-otp';
  static String forgotPassword = '/user/forgot-password';
  static String resetPassword = '/user/reset-password';
  static String getReferralCode = '/user/get-my-referral-code';
  static String verifyReferralCode = '/user/verify-admin-referral/';
  static String subList = '/subscription/get';
  static String slider = '/settings/get-sliders';
  static String walletBalance = '/user/get-vendor-wallet-balance';

  // Products
  static String fetchAllProducts = '/product/get-products/';
  static String fetchAProduct = '/product/details/';

  // static String fetchAProduct = '/product/get-product-details/';
  static String fetchFlashSalesProduct = '/product/inventory/flashsales';

  // Reviews and Rating
  static String fetchAllReviews = '/product-reviews/reviews/';
  static String fetchAllRatings = '/product-reviews/ratings/';
  static String addReviews = '/product-reviews/reviews/';

  // Cart
  static String addToCart = "/cart/retailer/add";
  static String viewCart = "/cart/retailer";
  static String removeFromCart = "/cart/retailer/remove/";
  static String clearCart = "/cart/retailer/clear";
  static String cartEstimatedPrice = "/cart/est-delivery-price";

  // Cart
  static String order = "/orders/new-order";
  static String orderHistory = "/orders/my-orders";
  static String orderDetails = "/orders/";
  static String voucherDetails = "/vouchers/value/";
  static String cancelOrder = "/orders/";

  // Payment
  static String initiatePayment = '/payments/initiate-payment';

// Favourite
  static String addToFavourite = "/orders/add-to-favs/";
  static String viewFavourite = "/orders/favorites";
  static String removeFromFavourite = "/orders/remove-from-favs/";

  // Categories
  static String getCategories = "/category/";

  // PickUp Location
  static String getAllPickupLocation = "/settings/add-pickup-location/";
  static String getPickupLocationByLGA = "/settings/get-picklocation-by-lga/";

  // AddUserLocation
  static String addUserAddress = "/user/add-address";
  static String getUserAddress = "/user/get-addresses";
  static String removeUserAddress = "/user/remove-address";
  static String updateActiveAddress = '/user/update-active-address/';

  // Search product
  static String searchProductByCategory = "/product/get-products-by-category/";
  static String searchProductByName = "/product/search-products/";

  // Notification
  static String getAllNotification = "/account/my-notifications";
  static String sendSinglePushNotification = "/account/notification";

  // receiveTimeout
  static const Duration receiveTimeout = Duration(milliseconds: 60000);

  // connectTimeout
  static const Duration connectionTimeout = Duration(milliseconds: 60000);
}
