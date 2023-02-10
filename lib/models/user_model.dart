class User {
  late String name;
  late String surname;
  late String userType;
  late String sexuality;
  late String phoneNumber;
  //final DateTime birthDate;
  User.emptyConstructor() {

  }

  User({
    required this.name,
    required this.surname,
    required this.userType,
    required this.phoneNumber,
    required this.sexuality,
  });

  factory User.fromMap(dynamic data){
    return User(
      name: data['name'],
      surname: data['surname'],
      userType: data['userType'],
      sexuality: data['sexuality'],
      phoneNumber: data['phoneNumber'],
    );

  }

  Map<String, dynamic> toMap(){
    Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['surname'] = surname;
    data['userType'] = userType;
    data['sexuality'] = sexuality;
    data['phoneNumber'] = phoneNumber;
    return data;
  }
}