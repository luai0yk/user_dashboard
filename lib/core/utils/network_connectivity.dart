// class NetworkConnectivity {
//   /// Checks for actual internet connectivity.
//   static Future<bool> isConnectedToInternet() async {
//     // Step 1: Check network availability (WiFi, mobile, etc.)
//     final connectivityResult = await Connectivity().checkConnectivity();
//     if (connectivityResult == ConnectivityResult.none) {
//       return false; // No network connection
//     }
//
//     // Step 2: Attempt to make a real HTTP request
//     try {
//       final response = await http
//           .get(Uri.parse('https://www.google.com'))
//           .timeout(const Duration(seconds: 5));
//       return response.statusCode == 200;
//     } catch (_) {
//       return false;
//     }
//   }
// }

import 'package:http/http.dart' as http;

class NetworkConnectivity {
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
