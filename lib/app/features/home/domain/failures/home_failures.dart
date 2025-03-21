class HomeFailure {
  final String message;
  final Object? error;

  HomeFailure({required this.message, this.error});

  @override
  String toString() => 'HomeFailure: $message';
}