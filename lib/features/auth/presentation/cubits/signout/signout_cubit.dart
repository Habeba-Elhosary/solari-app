import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:solari/core/errors/failures.dart';
import 'package:solari/core/usecases/no_params.dart';
import 'package:solari/core/widgets/toast.dart';
import 'package:solari/features/home/presentation/cubit/nav_bar/nav_bar_cubit.dart';
import '../../../../../injection_container.dart';
import '../../../domain/usecases/signout.dart';
import '../auto_signin/auto_signin_cubit.dart';
part 'signout_state.dart';

class SignOutCubit extends Cubit<SignOutState> {
  final SignOutUseCase signOutUseCase;
  SignOutCubit({required this.signOutUseCase}) : super(SignOutInitial());

  Future<void> signOutEvent() async {
    emit(SignOutLoading());
    final Either<Failure, Unit> response = await signOutUseCase(NoParams());
    response.fold((Failure failure) {
      emit(SignOutError(message: failure.message));
      showErrorToast(failure.message);
    }, (Unit success) {
      showSuccessToast(tr('sign_out_success'));
      sl<AutoSignInCubit>().signOut();
      emit(SignOutSuccess());
      sl<NavBarCubit>().updateIndex(0);
      // appNavigator.pop();
    });
  }
}
