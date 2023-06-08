// ignore_for_file: non_constant_identifier_names

class Event {
  String event_id;
  String event_name;
  String event_desc;
  String event_date;
  int committee_amount;
  int participant_amount;
  String image_url;
  String organization_id;

  Event(
      {required this.event_id,
      required this.event_name,
      required this.event_desc,
      required this.event_date,
      required this.committee_amount,
      required this.participant_amount,
      required this.image_url,
      required this.organization_id});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
        event_id: json['event_id'],
        event_name: json['event_name'],
        event_desc: json['event_desc'],
        event_date: json['event_date'],
        committee_amount: json['committee_amount'],
        participant_amount: json['participant_amount'],
        image_url: json['image_url'],
        organization_id: json['organization_id']);
  }
}
