class SignupModel {
  SignupModel({
    this.name,
    this.email,
    this.phone,
    this.country,
    this.bestWayToContact,
    this.currency,
  });

  String name;
  String email;
  String phone;
  String country;
  String bestWayToContact;
  String currency;

  factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        country: json["country"],
        bestWayToContact: json["best_way_to_contact"],
        currency: json["currency"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone": phone,
        "country": country,
        "best_way_to_contact": bestWayToContact,
        "currency": currency,
      };
}
