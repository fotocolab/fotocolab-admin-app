import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fotocolab_admin/route/navigation_service.dart';

abstract class InternetManager {
  static Future<bool> checkConnection() async {
    final connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult.contains(ConnectivityResult.none)) {
      NavigationService.showErrorSnackbar(message: 'No Internet Connection');
      return false;
    } else {
      return true;
    }
  }
}
