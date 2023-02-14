class User {
  int id = 0;
  String name = '';
  String surname = '';
  int type = 0;
  String pol = '';
  bool online = false;
  String phoneNumber = '';
  //final DateTime birthDate;
  User.emptyConstructor() {

    //name = '';
  }

  User({
    required this.id,
    required this.name,
    required this.surname,
    required this.type,
    required this.phoneNumber,
    required this.pol,
    required this.online
  });

  factory User.fromMap(dynamic data){
    return User(
      id: data['id'],
      name: data['name'],
      surname: data['surname'],
      type: data['type'],
      pol: data['pol'],
      phoneNumber: data['phone'],
      online: data['online']
    );

  }

  Map<String, dynamic> toMap(){
    Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['surname'] = surname;
    data['type'] = type;
    data['pol'] = pol;
    data['phone'] = phoneNumber;
    data['online'] = online;
    return data;
  }
}