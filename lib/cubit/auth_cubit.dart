import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tenang_test/model/user_model.dart';
import 'package:tenang_test/services/auth_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void signUp(
      {required String email,
      required String password,
      required String fullname}) async {
    try {
      emit(AuthLoading());
      UserModel user = await AuthService()
          .signUp(email: email, password: password, fullname: fullname);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }
}
