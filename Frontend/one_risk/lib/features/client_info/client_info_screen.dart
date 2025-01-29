import 'package:flutter/material.dart';
import 'package:one_risk/models/prediction_history_model.dart';

class ClientInfoScreen extends StatelessWidget {
  final PredictionHistory prediction;

  const ClientInfoScreen(this.prediction);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informations Client'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('ID : ${prediction.clientID}'),
            Text('Nom : ${prediction.clientName}'),
            Text('Prénom : ${prediction.clientFirstName}'),
            Text('Revenu Annuel : ${prediction.revenue}'),
            Text('Montant Transactions : ${prediction.transaction}'),
            Text('Frequence Achats : ${prediction.frequency}'),
            Text('Taux Endettement : ${prediction.debtRate}'),
            Text('Age Client : ${prediction.age}'),
            Text('Nombre Enfants : ${prediction.children}'),
            Text('Duree Emploi : ${prediction.employmentDuration}'),
            Text('Score Credit : ${prediction.creditScore}'),
            Text('Retards Paiement : ${prediction.paymentDelays}'),
            Text('Etat Civil: ${prediction.maritalStatus}'),
            Text('Type Emploi : ${prediction.employmentType}'),  
            Text('Proprietaire Maison : ${prediction.houseOwnership}'),          
            Text('Prédiction Logistique : ${prediction.logisticPrediction}'),
            Text('Prédiction Forêt Aléatoire : ${prediction.rfPrediction}'),
            Text('Date de Prédiction : ${prediction.predictionDate}'),
            // Ajoutez d'autres informations ici...
          ],
        ),
      ),
    );
  }
}
