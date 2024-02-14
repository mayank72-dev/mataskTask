class DataModel{
  int ? id;
  String?email;
  String? password;


  DataModel({this.password,this.id,this.email,});

  DataModel.fromJson(Map<String,dynamic>data):
        id=data['id'],
        email=data['email'],
        password=data['password'];

  Map<String, Object?> toMap(){
    return{
      "id":id,
      "email;":email,
      "password":password,

    };
  }
}