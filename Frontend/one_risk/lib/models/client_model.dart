class Client {
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
  String logisticPrediction = 'none';
  String rfPrediction = 'none';
  String predictionDate = DateTime.now().toString();

  
  Client({
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
  });


  void fromJson(Map<String, dynamic> jsonPrediction){
      logisticPrediction = (jsonPrediction['logistic_prediction'] ?? "le model ne peut rien predire");
      rfPrediction = (jsonPrediction['rf_prediction'] ?? "le model ne peut rien predire");
      predictionDate = DateTime.now().toString();
    
  }

  Map<String, dynamic> toJson() {
    // Encodage one-hot des variables catégorielles
      List<int> maritalStatusDummies = [
        maritalStatus == 'Célibataire' ? 1 : 0,
        maritalStatus == 'Marié' ? 1 : 0,
        maritalStatus == 'Divorcé' ? 1 : 0,
      ];

      List<int> employmentTypeDummies = [
        employmentType == 'Chômeur' ? 1 : 0,
        employmentType == 'Salarié' ? 1 : 0,
        employmentType == 'Indépendant' ? 1 : 0,
      ];

      int houseOwnershipDummy = houseOwnership == 'Oui' ? 1 : 0;
      
    return {
        'Client_ID': clientID,
        'Nom_Client': clientName,
        'Prenom_Client': clientFirstName,
        'Revenu_Annuel': revenue,
        'Montant_Transactions': transaction,
        'Frequence_Achats': frequency,
        'Taux_Endettement': debtRate,
        'Age_Client': age,
        'Nombre_Enfants': children,
        'Duree_Emploi': employmentDuration,
        'Score_Credit': creditScore,
        'Retards_Paiement': paymentDelays,
        'Etat_Civil_Divorcé': maritalStatusDummies[2],
        'Etat_Civil_Marié': maritalStatusDummies[1],
        'Type_Emploi_Indépendant': employmentTypeDummies[2],
        'Type_Emploi_Salarié': employmentTypeDummies[1],
        'Proprietaire_Maison_Oui': houseOwnershipDummy,
        'predictionDate' : predictionDate,
    };
  }



}
