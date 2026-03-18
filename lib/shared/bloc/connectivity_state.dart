part of 'connectivity_cubit.dart';

class ConnectivityState extends Equatable {
  const ConnectivityState({
    required this.isConnected,
    required this.activeConnections,
  });

  const ConnectivityState.initial()
    : isConnected = true,
      activeConnections = const [];

  final bool isConnected;
  final List<ConnectivityResult> activeConnections;

  @override
  List<Object?> get props => [isConnected, activeConnections];
}
