import 'package:flavor/api_client/urls.dart';

import '../flavour/flavour_config.dart';

class ApiClient {
  static buildUrl(String partialUrl) {
    String baseUrl = FlavorConfig.isDevelopment() ? kBaseUrDev : kBaseUrlProd;
    return baseUrl + partialUrl;
  }
}
