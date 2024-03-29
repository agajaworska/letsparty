import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'root_state.dart';

class RootCubit extends Cubit<RootState> {
  RootCubit()
      : super(
          const RootState(
            user: null,
            isLoading: false,
            errorMessage: '',
            isCreatingAccount: false,
          ),
        );

  StreamSubscription? _streamSubscription;

  Future<void> createAccountButtonPressed() async {
    emit(
      const RootState(
        user: null,
        isLoading: false,
        errorMessage: '',
        isCreatingAccount: true,
      ),
    );
  }

  Future<void> signInButtonPressed() async {
    emit(
      const RootState(
        user: null,
        isLoading: false,
        errorMessage: '',
        isCreatingAccount: false,
      ),
    );
  }

  Future<void> register({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (error) {
      if (error.code == 'email-already-in-use') {
        emit(
          const RootState(
              errorMessage: 'The account already exist for that email! ',
              isLoading: false,
              user: null,
              isCreatingAccount: false),
        );
      }
    }
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (error) {
      if (error.code == 'user-not-found') {
        emit(
          const RootState(
              errorMessage: 'No user found for that email, try again :) ',
              isLoading: false,
              user: null,
              isCreatingAccount: false),
        );
      } else if (error.code == 'wrong-password') {
        emit(
          const RootState(
              errorMessage: 'Wrong password, try again :) ',
              isLoading: false,
              user: null,
              isCreatingAccount: false),
        );
      }
    }
    print(state);
  }

  Future<void> start() async {
    emit(
      const RootState(
        user: null,
        isLoading: true,
        errorMessage: '',
        isCreatingAccount: false,
      ),
    );
    _streamSubscription =
        FirebaseAuth.instance.authStateChanges().listen((user) {
      emit(
        RootState(
          user: user,
          isLoading: false,
          errorMessage: '',
          isCreatingAccount: false,
        ),
      );
    })
          ..onError(
            (error) {
              emit(
                RootState(
                  user: null,
                  isLoading: false,
                  errorMessage: error.toString(),
                  isCreatingAccount: false,
                ),
              );
            },
          );
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
