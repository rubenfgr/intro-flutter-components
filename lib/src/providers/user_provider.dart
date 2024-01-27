import 'dart:convert';
import 'dart:io';

class Users {
  int page;
  int perPage;
  int total;
  int totalPages;
  List<User> data;
  UsersSupport support;

  Users({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
    required this.support,
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        page: json["page"],
        perPage: json["per_page"],
        total: json["total"],
        totalPages: json["total_pages"],
        data: List<User>.from(json["data"].map((x) => User.fromJson(x))),
        support: UsersSupport.fromJson(json["support"]),
      );
}

class User {
  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
      );

  @override
  String toString() {
    // TODO: implement toString

    return 'id: $id, email: $email, firstName: $firstName, lastName: $lastName, avatar: $avatar';
  }
}

class UsersSupport {
  String url;
  String text;

  UsersSupport({
    required this.url,
    required this.text,
  });

  factory UsersSupport.fromJson(Map<String, dynamic> json) => UsersSupport(
        url: json["url"],
        text: json["text"],
      );
}

class UserProvider {
  Future<List<User>> obtenerUsuarios() async {
    String url = 'https://reqres.in/api/users?page=1';
    // String url = 'https://reqres.in/api/users/23';
    // String url = 'https://reqres.in/api/users/23xxx';
    // String url = 'https://reqres.in/api/users/23';
    HttpClient httpClient = HttpClient();
    HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
    HttpClientResponse response = await request.close();
    String responseBody = await response.transform(utf8.decoder).join();
    httpClient.close();
    Users respuestaUsuarios = Users.fromJson(json.decode(responseBody));
    //print(respuestaUsuarios);
    return respuestaUsuarios.data;
  }

  Future<User> obtenerUsuarioPorId(int id) async {
    String url = 'https://reqres.in/api/users/$id';
    HttpClient httpClient = HttpClient();
    HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
    HttpClientResponse response = await request.close();
    String responseBody = await response.transform(utf8.decoder).join();
    httpClient.close();
    User respuestaUsuario = User.fromJson(json.decode(responseBody)['data']);
    //print(respuestaUsuario);
    return respuestaUsuario;
  }
}

final userProvider = UserProvider();
