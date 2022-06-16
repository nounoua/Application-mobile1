class UserModel {
  String? sub;
  bool? emailVerified;
  String? name;
  String? preferredUsername;
  String? givenName;
  String? familyName;
  String? email;
  String? picture;
  String? phoneNumber;
  String? birthDate;

  UserModel({
    this.sub,
    this.emailVerified,
    this.name,
    this.preferredUsername,
    this.givenName,
    this.familyName,
    this.email,
    this.picture,
    this.phoneNumber,
    this.birthDate,
    //this.about
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    sub = json['sub'];
    emailVerified = json['email_verified'];
    name = json['name'];
    preferredUsername = json['preferred_username'];
    givenName = json['given_name'];
    familyName = json['family_name'];
    email = json['email'];
    picture = json['picture'];
    phoneNumber = json['phoneNumber'];
    birthDate = json['birthDate'];
    //about = json['about'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sub'] = this.sub;
    data['email_verified'] = this.emailVerified;
    data['name'] = this.name;
    data['preferred_username'] = this.preferredUsername;
    data['given_name'] = this.givenName;
    data['family_name'] = this.familyName;
    data['email'] = this.email;
    data['picture'] = this.picture;
    data['phoneNumber'] = this.phoneNumber;
    data['birthDate'] = this.birthDate;
    return data;
  }
}
