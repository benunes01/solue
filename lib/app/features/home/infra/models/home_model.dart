class HomeResponse {
  final String message;
  final String status;

  HomeResponse({required this.message, required this.status});

  factory HomeResponse.fromJson(Map<String, dynamic> json) {
    return HomeResponse(
      message: json['message'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'status': status,
    };
  }
}
