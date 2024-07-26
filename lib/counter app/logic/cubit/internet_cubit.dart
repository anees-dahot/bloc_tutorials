import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_practice/constants/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  late StreamSubscription streamSubscription;

  InternetCubit({required this.connectivity}) : super(InternetLoading()) {
    subscription();

  }

  void subscription() {
    streamSubscription =
        connectivity.onConnectivityChanged.listen((connectvityResult) {
      if (connectvityResult == ConnectivityResult.mobile) {
        emitInternetConnection(ConnectionType.mobile);
      } else if (connectvityResult == ConnectivityResult.wifi) {
        emitInternetConnection(ConnectionType.wifi);
      } else if (connectvityResult == ConnectivityResult.none) {
        emitInternetDisconnection();
      }
    });
  }

  void emitInternetConnection(ConnectionType connectionType) =>
      emit(InternetConnected(connectionType: connectionType));

  void emitInternetDisconnection() => emit(InternetDisconnected());

  
    @override
    Future<void> close() {
      // TODO: implement close
      streamSubscription.cancel();
      return super.close();
    }
}
