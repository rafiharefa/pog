// ignore_for_file: non_constant_identifier_names

class Person {
  String user_id;
  String lastname;
  String firstname;
  String email;
  String password;
  String address;
  String birth_date;
  String phone_number;
  String sex;

  Person(
      {required this.user_id,
      required this.lastname,
      required this.firstname,
      required this.email,
      required this.password,
      required this.phone_number,
      required this.address,
      required this.birth_date,
      required this.sex});

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
        user_id: json['user_id'],
        lastname: json['lastname'],
        firstname: json['firstname'],
        password: json['password'],
        phone_number: json['phone_number'],
        birth_date: json['birth_date'],
        sex: json['sex'],
        address: json['address'],
        email: json['email']);
  }
}
