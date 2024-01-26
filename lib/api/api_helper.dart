import 'package:http/http.dart' as http;

Future get (String url, {bool retry = true})async{
  try{
    var response = await http.get(Uri.parse(url),);
return response;
  }
  catch(e){
if( retry){
  var response = await http.get(Uri.parse(url),);
  return response;

}
else{
  print(e);
}
  }

}