import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'connectivity_state.dart';

class ConnectivityCubit extends Cubit<ConnectivityState> {
  ConnectivityCubit({required Connectivity connectivity})
    : _connectivity = connectivity,
      super(const ConnectivityState.initial());

  final Connectivity _connectivity;
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  void startMonitoring() {
    _subscription ??= _connectivity.onConnectivityChanged.listen(
      _emitFromResults,
    );
  }

  Future<void> refresh() async {
    final results = await _connectivity.checkConnectivity();
    _emitFromResults(results);
  }

  void _emitFromResults(List<ConnectivityResult> results) {
    emit(
      ConnectivityState(
        isConnected: !results.contains(ConnectivityResult.none),
        activeConnections: results,
      ),
    );
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }
}
