import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  getData();
}

void getData() async {
  http.Response response = await http.get(
      'https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22');

  if (response.statusCode == 200) {
    print(response.body);

    var town = jsonDecode(response.body)['name'];
    var id = jsonDecode(response.body)['weather'][0]['id'];
    var temp = jsonDecode(response.body)['main']['temp'];

    print(town);
    print(id);
    print(temp);
  } else {
    print(response.statusCode);
  }
}
