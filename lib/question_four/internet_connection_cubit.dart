import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:littlefish/question_four/internet_connection_state.dart';

class InternetConnectionCubit extends Cubit<InternetConnectionState> {
  final InternetConnectionChecker internetConnectionChecker;
  late StreamSubscription<InternetConnectionStatus> listener;

  InternetConnectionCubit(this.internetConnectionChecker)
      : super(const InternetConnectionState()) {
    listener = internetConnectionChecker.onStatusChange.listen((event) {
      if (event == InternetConnectionStatus.connected) {
        emit(const InternetConnectionState(InternetStatus.connected));
      } else if (event == InternetConnectionStatus.disconnected) {
        emit(const InternetConnectionState(InternetStatus.disconnected));
      } else {
        emit(const InternetConnectionState(InternetStatus.unKnown));
      }
    });
  }

  @override
  Future<void> close() {
    listener.cancel();
    return super.close();
  }
}
