class Applicants {
  String application_id;
  String application_type;
  String user_id;
  String event_id;

  Applicants({
    required this.application_id,
    required this.application_type,
    required this.user_id,
    required this.event_id,
  });

  factory Applicants.fromJson(Map<String, dynamic> json) {
    return Applicants(
        application_id: json['application_id'],
        application_type: json['application_type'],
        user_id: json['user_id'],
        event_id: json['event_id']);
  }
}
