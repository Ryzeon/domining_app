import 'package:domining_app/model/iam/user.dart';
import 'package:domining_app/services/user_rest.service.dart';
import 'package:domining_app/utils/request.dart';

class UserServicer {
  static User? currentUser;

  static Future<User> getById(String id) async {
    try {
      final user = await UserRestServer(Request().dio).getById(id);
      return user;
    } catch (e) {
      rethrow;
    }
  }

  static setLocalUser(String id) async {
    User currentUser = await getById(id);
    UserServicer.currentUser = currentUser;
    print('UserServicer.currentUser: ${UserServicer.currentUser!.toJson()}');
  }
}
