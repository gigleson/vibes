
import 'package:vibes/models/user_model.dart';
import 'package:vibes/repo/auth_service.dart';


class AuthViewModel {
  final AuthRepository _repository = AuthRepository();

  Future<bool> signIn(AuthModel authModel) async {
    return await _repository.signInWithEmailAndPassword(authModel.email, authModel.password);
  }

  Future<bool> signUp(AuthModel authModel) async {
    return await _repository.createUserWithEmailAndPassword(authModel.email, authModel.password);
  }
}
