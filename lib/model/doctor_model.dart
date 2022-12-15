class Doctor {
  int id;
  String name;
  String username;
  String email;
  Address address;
  String phone;
  String website;
  Company company;

  Doctor(
      {required this.id,
      this.name = '',
      this.username = '',
      this.email = '',
      required this.address,
      this.phone = '',
      this.website = '',
      required this.company});
  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
        id: json['id'],
        name: json['name'],
        username: json['username'],
        email: json['email'],
        address: Address.fromJson(json["address"]),
        phone: json['phone'],
        website: json['website'],
        company: Company.fromJson(json['company']));
  }
}

class Address {
  String street;
  String suite;
  String city;
  String zipcode;
  Geo geo;

  Address(
      {this.street = '',
      this.city = '',
      required this.geo,
      this.suite = '',
      this.zipcode = ''});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
        city: json['city'],
        geo: Geo.fromJson(json['geo']),
        street: json['street'],
        suite: json['suite'],
        zipcode: json['zipcode']);
  }
}

class Geo {
  String lat;
  String lng;

  Geo({this.lat = '', this.lng = ''});

  factory Geo.fromJson(Map<String, dynamic> json) {
    return Geo(lat: json['lat'], lng: json['lng']);
  }
}

class Company {
  String name;
  String catchPhrase;
  String bs;

  Company({this.name = '', this.catchPhrase = '', this.bs = ''});

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
        bs: json['bs'], catchPhrase: json['catchPhrase'], name: json['name']);
  }
}
