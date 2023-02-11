class User {
  String name = '';
  String surname = '';
  int type = 0;
  String pol = '';
  String phoneNumber = '';
  //final DateTime birthDate;
  User.emptyConstructor() {

    //name = '';
  }

  User({
    required this.name,
    required this.surname,
    required this.type,
    required this.phoneNumber,
    required this.pol,
  });

  factory User.fromMap(dynamic data){
    return User(
      name: data['name'],
      surname: data['surname'],
      type: data['type'],
      pol: data['pol'],
      phoneNumber: data['phone'],
    );

  }

  Map<String, dynamic> toMap(){
    Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['surname'] = surname;
    data['type'] = type;
    data['pol'] = pol;
    data['phone'] = phoneNumber;
    return data;
  }
}