import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloccomplete/core/constants/enums.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity conectibity;
  final Connectivity conectibityInside = Connectivity();
  
  late StreamSubscription streamSubscription;

  InternetCubit({required this.conectibity}) : super(InternetLoadingState()) {
    monitorInternetConnection();
  }

  StreamSubscription<ConnectivityResult> monitorInternetConnection() {
    return streamSubscription =
        conectibity.onConnectivityChanged.listen((connectivityResult) {
      if (connectivityResult == ConnectivityResult.mobile) {
        emitIntenetConnected(ConnectionType.mobile);
      } else if (connectivityResult == ConnectivityResult.wifi) {
        emitIntenetConnected(ConnectionType.wifi);
      } else if (connectivityResult == ConnectivityResult.none) {
        emitIntenetDisonnected();
      } else {
        emitIntenetConnected(ConnectionType.other);
      }
    });
  }

  void emitIntenetConnected(ConnectionType connectionType) =>
      emit(InternetConnectedState(connectionType: connectionType));
  void emitIntenetDisonnected() => emit(InternetDisconnectedState());


  @override
  Future<void> close() {
    print('InternetCubit Closed');
    streamSubscription.cancel();
    return super.close();
  }
}
