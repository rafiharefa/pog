// ignore_for_file: non_constant_identifier_names

class Organization {
  String organization_id;
  String organization_key;
  String organization_name;
  String organization_desc;
  String organization_address;
  String email;
  String phone_number;

  Organization(
      {required this.organization_id,
      required this.organization_key,
      required this.organization_name,
      required this.organization_desc,
      required this.organization_address,
      required this.email,
      required this.phone_number});

  factory Organization.fromJson(Map<String, dynamic> json) {
    return Organization(
        organization_id: json['organization_id'],
        organization_key: json['organization_key'],
        organization_name: json['organization_name'],
        organization_desc: json['organization_desc'],
        organization_address: json['organization_address'],
        email: json['email'],
        phone_number: json['phone_number']);
  }
}
