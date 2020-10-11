import "package:http/http.dart" as http;
import 'dart:convert';

class RequestResult {
  bool ok;
  dynamic data;
  RequestResult(this.ok, this.data);
}

const PROTOCOL = "http";
var DOMAIN = "192.168.1.4:4000";
// var reponse = "192.168.1.3:4000";

// _onPressed() async {
//   await Firestore.instance
//       .collection("localhostaddress")
//       .getDocuments()
//       .then((querySnapshot) {
//     querySnapshot.documents.forEach((result) {
//       DOMAIN = result.data['ip'];
//     });
//   });
// }

// final localhost = Firestore.instance.collection("localhostaddress").snapshots();

Future<RequestResult> http_get(String route, [dynamic data]) async {
  var dataStr = jsonEncode(data);
  // await _onPressed();
  var url = "$PROTOCOL://$DOMAIN/$route?data=$dataStr";
  var result = await http.get(
    url,
  );
  return RequestResult(true, jsonDecode(result.body));
}

Future<RequestResult> http_post(String route, [dynamic data]) async {
  // await _onPressed();
  var url = "$PROTOCOL://$DOMAIN/$route";
  print("$url");

  var dataStr = jsonEncode(data);
  print(dataStr);
  var result = await http
      .post(url, body: dataStr, headers: {"Content-Type": "application/json"});
  return RequestResult(true, jsonDecode(result.body));
}
