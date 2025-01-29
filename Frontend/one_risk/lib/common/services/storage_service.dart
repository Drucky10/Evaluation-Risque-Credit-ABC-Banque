import 'package:shared_preferences/shared_preferences.dart';
import 'package:one_risk/models/client_model.dart';
import 'package:one_risk/models/prediction_history_model.dart';
import 'dart:convert';

class StorageService {
  Future<void> savePrediction(
    Client myClient,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    

    // ceci est conserver pendant que se fait la verification d'une autre facon de faire
    Map<String, dynamic> json = {
      'Client_ID': myClient.clientID,
      'Nom_Client': myClient.clientName,
      'Prenom_Client': myClient.clientFirstName,
      'Revenu_Annuel': myClient.revenue,
      'Montant_Transactions': myClient.transaction,
      'Frequence_Achats': myClient.frequency,
      'Taux_Endettement': myClient.debtRate,
      'Age_Client': myClient.age,
      'Nombre_Enfants': myClient.children,
      'Duree_Emploi': myClient.employmentDuration,
      'Score_Credit': myClient.creditScore,
      'Retards_Paiement': myClient.paymentDelays,
      'Etat_Civil': myClient.maritalStatus,
      'Type_Emploi': myClient.employmentType,
      'Proprietaire_Maison': myClient.houseOwnership,
      'logistic_prediction': myClient.logisticPrediction,
      'rf_prediction': myClient.rfPrediction,
      'predictionDate': myClient.predictionDate,
    };
    prefs.setString('prediction_${myClient.clientName}_${myClient.clientFirstName}_${DateTime.now().toString()}', jsonEncode(json));
  }

  Future<List<PredictionHistory>> loadPredictions() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys();
    List<PredictionHistory> predictions = [];

    for (var key in keys) {
      if (key.startsWith('prediction_')) {
        final  json = prefs.getString(key);
        if (json != null) {

          final prediction = PredictionHistory.fromJson(jsonDecode(json));
          predictions.add(prediction);
        }
      }
    }

    return predictions;
  }



   Future<void> clearPredictions() async {
    // Code pour effacer les prédictions enregistrées
    // Par exemple, si vous utilisez SharedPreferences :
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }


}
