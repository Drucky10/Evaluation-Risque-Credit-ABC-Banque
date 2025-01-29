import 'package:http/http.dart' as http;
import 'package:one_risk/common/services/storage_service.dart';
import 'package:one_risk/models/client_model.dart';

import 'dart:convert';

class ApiService {


  Future<void> makePostRequest(String url,  Client myClient, ) async {
    var response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(myClient.toJson()),
    );
    
    if (response.statusCode == 307) {
      // Récupérer l'URL de redirection
      String redirectUrl = response.headers['location']!;
      // Envoyer une nouvelle requête à l'URL redirigée
      response = await http.post(
        Uri.parse(redirectUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(myClient.toJson()),
      );
    }


    if (response.statusCode == 200) {
      myClient.fromJson(json.decode(response.body));

      // Sauvegarder les résultats dans l'historique
      await StorageService().savePrediction(
        myClient,
      );

      
    } else {
      throw Exception('Failed to load data statuCode : ${response.statusCode}');
    }

  }


}
