import 'package:http/http.dart' as http;

abstract class NetworkConnectivity {
  /// Checks if there is actual internet access using an HTTP GET request.
  static Future<bool> isConnectedToInternet() async {
    try {
      final response = await http
          .get(Uri.parse('https://www.google.com'))
          .timeout(const Duration(seconds: 5));
      return response.statusCode == 200;
    } catch (e) {
      // Could be TimeoutException, SocketException, etc.
      return false;
    }
  }
}
