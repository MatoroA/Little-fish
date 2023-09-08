import 'package:equatable/equatable.dart';

enum InternetStatus {
  connected,
  disconnected,
  unKnown,
}

class InternetConnectionState extends Equatable {
  final InternetStatus status;

  const InternetConnectionState([this.status = InternetStatus.unKnown]);

  @override
  List<Object?> get props => [
        status,
      ];
}
