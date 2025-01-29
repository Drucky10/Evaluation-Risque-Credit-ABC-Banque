

class PredictionHistory {
  int clientID ;
  int age;
  int children;
  int employmentDuration;
  int paymentDelays;

  double revenue;
  double transaction;
  double frequency;
  double debtRate;
  double creditScore;

  String? maritalStatus;
  String? employmentType;  
  String? houseOwnership;
  

  String clientName;
  String clientFirstName; 
  String logisticPrediction;
  String rfPrediction;
  String predictionDate;

  PredictionHistory({
    required this.clientID,
    required this.clientName,
    required this.clientFirstName,
    required this.revenue,
    required this.transaction,
    required this.frequency,
    required this.debtRate,
    required this.age,
    required this.maritalStatus,
    required this.children,
    required this.employmentType,
    required this.employmentDuration,
    required this.houseOwnership,
    required this.creditScore,
    required this.paymentDelays,
    required this.logisticPrediction,
    required this.rfPrediction,
    required this.predictionDate,
  });

  factory PredictionHistory.fromJson(Map<String, dynamic> json) {
    return PredictionHistory(
      
      clientID : json['Client_ID'],
      clientName: json['Nom_Client'],
      clientFirstName: json['Prenom_Client'],
      revenue: json['Revenu_Annuel'],
      transaction: json['Montant_Transactions'],
      frequency: json['Frequence_Achats'],
      debtRate: json['Taux_Endettement'],
      age: json['Age_Client'],
      maritalStatus: json['Etat_Civil'],
      children: json['Nombre_Enfants'],
      employmentType: json['Type_Emploi'],
      employmentDuration: json['Duree_Emploi'],
      houseOwnership: json['Proprietaire_Maison'],
      creditScore: json['Score_Credit'],
      paymentDelays: json['Retards_Paiement'],
      logisticPrediction: json['logistic_prediction'],
      rfPrediction: json['rf_prediction'],
      predictionDate: json['predictionDate'],
    );
  }

}
