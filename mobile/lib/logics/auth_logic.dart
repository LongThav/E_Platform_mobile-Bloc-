import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/utils/rests/snack_bar.dart';
import 'package:mobile/views/auth_views/welcome_view.dart';

import '../utils/rests/logger.dart';
import '../services/auth_sevice.dart';
import '../utils/rests/handle_push_view.dart';
import '../views/auth_views/check_opt_view.dart';
import '../views/auth_views/create_new_password.dart';
import '../views/auth_views/password_reset_successfully_view.dart';
import '../views/dashboard_views/index_view.dart';

import '../models/auth_models/sign_up_model.dart';

abstract class UserState {}

abstract class UserEvent {}

class UserLoadingSignUp extends UserState {}

class UserErrorLoadingSignUp extends UserState {}

class UserLoadingDoneSignUp extends UserState {
  SignUpModel signUpModel = SignUpModel(data: SignUp(user: User()));
  UserLoadingDoneSignUp(this.signUpModel);
}

class SetLoadingSingUp extends UserState {
  bool isLoading = false;
  SetLoadingSingUp(this.isLoading);
}

class UserInitialize extends UserState {}

class UserEventSignUp extends UserEvent {
  final String username;
  final String email;
  final String password;
  final BuildContext context;
  UserEventSignUp(this.email, this.password, this.username, this.context);
}

class UserEventSignIn extends UserEvent {
  final String email;
  final String password;
  final BuildContext context;
  UserEventSignIn(this.email, this.password, this.context);
}

class SetLoadingUserSignIn extends UserState {
  bool isLoading = false;
  SetLoadingUserSignIn(this.isLoading);
}


class UserLogoutEvent extends UserEvent {
  final BuildContext context;
  UserLogoutEvent(this.context);
}

class UserForgotPasswordEvent extends UserEvent {
  final String email;
  final BuildContext context;
  UserForgotPasswordEvent(this.email, this.context);
}

class UserForgotPasswordCheckLoading extends UserState {
  final bool isLoading;
  UserForgotPasswordCheckLoading(this.isLoading);
}

class UserVerifyPinEvent extends UserEvent {
  final String email;
  final String token;
  final BuildContext context;
  UserVerifyPinEvent(this.email, this.token, this.context);
}

class VerifyPinCheckLoading extends UserState {
  bool isLoading = false;
  VerifyPinCheckLoading(this.isLoading);
}

class UserResetPasswordEvent extends UserEvent {
  final String email;
  final String password;
  final String passwordConfirm;
  final BuildContext context;
  UserResetPasswordEvent(
      this.email, this.password, this.passwordConfirm, this.context);
}

class LoadingResetPassword extends UserState {
  final bool isLoading;
  LoadingResetPassword(this.isLoading);
}

class AuthLogic extends Bloc<UserEvent, UserState> {
  final AuthService authService;
  AuthLogic(this.authService) : super(UserInitialize()) {
    //SignUp
    on<UserEventSignUp>((event, emit) async {
      emit(UserInitialize());
      try {
        var data = await authService.singUpService(
            event.username, event.email, event.password);
        emit(UserLoadingDoneSignUp(data));
        await Future.delayed(const Duration(milliseconds: 600), () {
          pusReplaceView(event.context, IndexView());
        });
        emit(SetLoadingSingUp(true));
      } catch (err) {
        "Error in catch in logic: $err".log();
        emit(SetLoadingSingUp(false));
      }
    });

    //SignIn
    on<UserEventSignIn>((event, emit) async {
      emit(SetLoadingUserSignIn(true));
      bool data = await authService.loginService(
          event.email, event.password, event.context);
      if (data != true) {
        snackBar(event.context, "Incorrect email or passsword");
        "IsLoading".log();
        emit(SetLoadingUserSignIn(false));
      } else {
        Future.delayed(const Duration(milliseconds: 5), () {
          pusReplaceView(event.context, IndexView());
        });
        emit(SetLoadingUserSignIn(false));
      }
    });

    //log out
    on<UserLogoutEvent>((event, emit) async {
      try {
        await authService.logoutService();
        Future.delayed(const Duration(milliseconds: 600), () {
          pusReplaceView(event.context, WelcomeView());
        });
      } catch (err) {
        "Error in Logic: $err".log();
      }
    });

    //forgot password
    on<UserForgotPasswordEvent>((event, emit) async {
      emit(UserInitialize());
      try {
        bool check = await authService.forgotPasswordService(event.email);
        if (check != true) {
          snackBar(event.context, "Email not found");
          emit(UserForgotPasswordCheckLoading(false));
        } else {
          snackBar(event.context, "Code sent to your Email");
          Future.delayed(const Duration(milliseconds: 600), () {
            "Event email: ${event.email}".log();
            pushView(
                event.context,
                CheckOTPView(
                  email: event.email,
                ));
          });
          emit(UserForgotPasswordCheckLoading(true));
        }
      } catch (e) {
        "Error in logic: $e".log();
        emit(UserForgotPasswordCheckLoading(false));
      }
    });

    //verfiy Pin
    on<UserVerifyPinEvent>((event, emit) async {
      try {
        await authService
            .verifyPinService(event.token, event.email)
            .then((value) {
          if (value == true) {
            Future.delayed(const Duration(milliseconds: 600), () {
              pushView(
                  event.context,
                  CreateNewPasswordNew(
                    email: event.email,
                  ));
            });
          } else {
            snackBar(event.context, "Verify fails");
            emit(VerifyPinCheckLoading(false));
          }
        });
      } catch (err) {
        "Error in Logic: $err".log();
        emit(VerifyPinCheckLoading(false));
      }
    });

    // Reset Password
    on<UserResetPasswordEvent>((event, emit) async {
      try {
        await authService
            .resetPasswordService(
                event.email, event.password, event.passwordConfirm)
            .then((value) {
          if (value) {
            Future.delayed(
                const Duration(
                  milliseconds: 600,
                ), () {
              pushView(event.context, PasswordResetSuccessfullyView());
            });
            emit(LoadingResetPassword(true));
          } else {
            emit(LoadingResetPassword(false));
          }
        });
      } catch (err) {
        "Error in Logic: $err".log();
        emit(LoadingResetPassword(false));
      }
    });
  }
}
