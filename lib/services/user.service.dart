import 'package:domining_app/model/iam/user.dart';
import 'package:domining_app/services/user_rest.service.dart';
import 'package:domining_app/utils/request.dart';
import 'package:get/get.dart';

class UserService {

  static var currentUser = defaultUser.obs;

  static var defaultUser = User(
    id: '1',
    username: '',
    email: 'N/A',
    names: '',
    lastNames: '',
    position: '',
    company: '',
    about: '',
  );

  static Future<User> getById(String id) async {
    try {
      final user = await UserRestServer(Request().dio).getById(id);
      return user;
    } catch (e) {
      rethrow;
    }
  }

  static setLocalUser(String id) async {
    try {
      final user = await getById(id);
      currentUser.value = user;
    } catch (e) {
      // rethrow;
    
    }
  }
}
