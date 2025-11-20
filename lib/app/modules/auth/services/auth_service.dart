
import 'package:getx_clean_architecture/app/models/user_model.dart';

abstract class AuthService {
  Future<void> performAuth(User user);
}
