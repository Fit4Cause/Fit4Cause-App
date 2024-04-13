import 'package:http/http.dart' as http;

class NGOServices {
  // write a http function to get map of all ngos from http://localhost:3000/api/ngo

  String url = 'https://fit4cause-backend.onrender.com/api/ngo';

  void getNGOs() async {
    var ngoUrl = Uri.parse(url);
    http.Response response = await http.get(ngoUrl);
    print(response.body);
  }
}
