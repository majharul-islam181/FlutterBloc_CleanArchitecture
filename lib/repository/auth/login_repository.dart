import 'package:flutterbloc_cleanarchitecture/config/app_url.dart';
import 'package:flutterbloc_cleanarchitecture/data/network/network_services_api.dart';
import 'package:flutterbloc_cleanarchitecture/models/user/user_model.dart';

class LoginRepository {
  final api = NetworkServicesApi();
  Future<UserModel> loginApi(dynamic data) async {
    final response = await api.postApi(AppUrl.loginApi, data);
    return UserModel.fromJson(response);
  }
}
