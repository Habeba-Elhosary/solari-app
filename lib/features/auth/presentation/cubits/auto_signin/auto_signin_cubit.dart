import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:solari/core/errors/failures.dart';
import 'package:solari/core/usecases/no_params.dart';
import 'package:solari/features/auth/data/models/signin_response.dart';
import 'package:solari/features/auth/presentation/cubits/signin/signin_cubit.dart';
import '../../../../../injection_container.dart';
import '../../../domain/usecases/auto_signin.dart';
part 'auto_signin_state.dart';

class AutoSignInCubit extends Cubit<AutoSignInState> {
  final AutoSignInUseCase autoSignInUseCase;
  AutoSignInCubit({required this.autoSignInUseCase})
      : super(AutoSignInInitial());

  Future<void> autoSignInEvent() async {
    emit(AutoSignInLoading());
    final Either<Failure, SignInResponse> response =
        await autoSignInUseCase(NoParams());
    response.fold(
      (Failure failure) async {
        await Future<dynamic>.delayed(const Duration(seconds: 2));
        emit(AutoSignInNoUser());
      },
      (SignInResponse response) async {
        await Future<dynamic>.delayed(const Duration(seconds: 2));
        if (response.data?.otpVerified == 1) {
          sl<SignInCubit>().setUser = response.data!;
          emit(AutoSignInHasUser());
        } else {
          emitSeenIntro();
        }
      },
    );
  }

  void emitHasUserAsState() {
    emit(AutoSignInInitial());
    emit(AutoSignInHasUser());
  }

  void emitSeenIntro() {
    emit(AutoSignInInitial());
    emit(AutoSignInSeenIntro());
  }

  void signOut() {
    emit(AutoSignInInitial());
    emit(AutoSignInNoUser());
  }
}
