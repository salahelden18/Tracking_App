abstract class Failure {
  final String message;

  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class InternalAppFailure extends Failure {
  const InternalAppFailure(super.message);
}

class NoInternetConnectionFailure extends Failure {
  const NoInternetConnectionFailure(super.message);
}

class TimeoutFailure extends Failure {
  const TimeoutFailure(super.message);
}
