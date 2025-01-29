import 'package:flutter/material.dart';
import 'dart:math';
import 'package:one_risk/common/widgets/custom_app_bar.dart';
import 'package:one_risk/features/risk_assessment/risk_assessment_service.dart';
import 'package:one_risk/features/prediction_history/prediction_history_screen.dart';
import 'package:one_risk/models/client_model.dart';
import 'package:one_risk/common/widgets/search_bar.dart';



class RiskAssessmentScreen extends StatefulWidget {
  @override
  _RiskAssessmentScreenState createState() => _RiskAssessmentScreenState();
}

class _RiskAssessmentScreenState extends State<RiskAssessmentScreen> {  

  final _formKey = GlobalKey<FormState>();
  final TextEditingController revenueController = TextEditingController();
  final TextEditingController transactionController = TextEditingController();
  final TextEditingController frequencyController = TextEditingController();
  final TextEditingController debtRateController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController childrenController = TextEditingController();
  final TextEditingController employmentDurationController = TextEditingController();
  final TextEditingController creditScoreController = TextEditingController();
  final TextEditingController paymentDelaysController = TextEditingController();
  final TextEditingController clientNameController = TextEditingController();
  final TextEditingController clientFirstNameController = TextEditingController();

  String? maritalStatus;
  String? employmentType ;
  String? houseOwnership;

  String? logisticPrediction;
  String? rfPrediction ;

  


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(),
       drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Historique des Prédictions'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PredictionHistoryScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SearchSection(),
              SizedBox(height:20),

              // Formulaire pour saisir les données
              TextFormField(
                controller: clientNameController,
                decoration: InputDecoration(labelText: 'Nom du Client'),
                validator: (value) => value!.isEmpty ? 'Entrez un nom valide' : null,
              ),
              TextFormField(
                controller: clientFirstNameController,
                decoration: InputDecoration(labelText: 'Prénom du Client'),
                validator: (value) => value!.isEmpty ? 'Entrez un prénom valide' : null,
              ),
              TextFormField(
                controller: revenueController,
                decoration: InputDecoration(labelText: 'Revenu Annuel'),
                keyboardType: TextInputType.numberWithOptions(),
                validator: (value) => value!.isEmpty ? 'Entrez un revenu valide' : null,
              ),
              TextFormField(
                controller: transactionController,
                decoration: InputDecoration(labelText: 'Montant des Transactions'),
                keyboardType: TextInputType.numberWithOptions(),
                validator: (value) => value!.isEmpty ? 'Entrez un montant valide' : null,
              ),
              TextFormField(
                controller: frequencyController,
                decoration: InputDecoration(labelText: 'Fréquence des Achats'),
                keyboardType: TextInputType.numberWithOptions(),
                validator: (value) => value!.isEmpty ? 'Entrez une fréquence valide' : null,
              ),
              TextFormField(
                controller: debtRateController,
                decoration: InputDecoration(labelText: 'Taux d\'Endettement'),
                keyboardType: TextInputType.numberWithOptions(),
                validator: (value) => value!.isEmpty ? 'Entrez un taux valide' : null,
              ),
              TextFormField(
                controller: ageController,
                decoration: InputDecoration(labelText: 'Âge du Client'),
                keyboardType: TextInputType.numberWithOptions(),
                validator: (value) => value!.isEmpty ? 'Entrez un âge valide' : null,
              ),
               DropdownButtonFormField(
                decoration: InputDecoration(labelText: 'État Civil'),
                
                items: [
                  DropdownMenuItem(value: 'Célibataire', child: Text('Célibataire')),
                  DropdownMenuItem(value: 'Marié', child: Text('Marié')),
                  DropdownMenuItem(value: 'Divorcé', child: Text('Divorcé')),
                ],
                validator: (value) => value == 'none' ? 'Sélectionnez un état civil' : null,
                onChanged: (value) => setState(() => maritalStatus = value),
              ),
              TextFormField(
                controller: childrenController,
                decoration: InputDecoration(labelText: 'Nombre d\'Enfants'),
                keyboardType: TextInputType.numberWithOptions(),
                validator: (value) => value!.isEmpty ? 'Entrez un nombre d\'enfants valide' : null,
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(labelText: 'Type d\'Emploi'),
                items: [
                  DropdownMenuItem(value: 'Salarié', child: Text('Salarié')),
                  DropdownMenuItem(value: 'Indépendant', child: Text('Indépendant')),
                  DropdownMenuItem(value: 'Chômeur', child: Text('Chômeur')),
                ],
                validator: (value) => value == 'none' ? 'Sélectionnez un type d\'emploi' : null,
                onChanged: (value) => setState(() => employmentType = value),
              ),
              TextFormField(
                controller: employmentDurationController,
                decoration: InputDecoration(labelText: 'Durée d\'Emploi'),
                keyboardType: TextInputType.numberWithOptions(),
                validator: (value) => value!.isEmpty ? 'Entrez une durée d\'emploi valide' : null,
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(labelText: 'Propriétaire de la Maison'),
                items: [
                  DropdownMenuItem(value: 'Oui', child: Text('Oui')),
                  DropdownMenuItem(value: 'Non', child: Text('Non')),
                ],
                validator: (value) => value == 'none' ? 'Sélectionnez une option' : null,
                onChanged: (value) => setState(() => houseOwnership = value),
              ),
              TextFormField(
                controller: creditScoreController,
                decoration: InputDecoration(labelText: 'Score de Crédit'),
                keyboardType: TextInputType.numberWithOptions(),
                validator: (value) => value!.isEmpty ? 'Entrez un score de crédit valide' : null,
              ),
              TextFormField(
                controller: paymentDelaysController,
                decoration: InputDecoration(labelText: 'Retards de Paiement'),
                keyboardType: TextInputType.numberWithOptions(),
                validator: (value) => value!.isEmpty ? 'Entrez un nombre de retards valide' : null,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  final Random _random = Random();
                  int generatedClientID = _random.nextInt(900000000) + 100000000;
  
                  //initialisation du client remplissant le formulaire
                  final Client myClient = Client(
                    clientID: generatedClientID,
                    clientName: clientNameController.text, 
                    clientFirstName: clientFirstNameController.text,
                    revenue: double.parse(revenueController.text),
                    transaction: double.parse(transactionController.text),
                    frequency: double.parse(frequencyController.text),
                    debtRate: double.parse(debtRateController.text),
                    age: int.parse(ageController.text),
                    maritalStatus: maritalStatus,
                    children: int.parse(childrenController.text),
                    employmentType: employmentType,
                    employmentDuration: int.parse(employmentDurationController.text),
                    houseOwnership: houseOwnership,
                    creditScore: double.parse(creditScoreController.text),
                    paymentDelays: int.parse(paymentDelaysController.text),
                    );

                  await RiskAssessmentService().evaluateRisk(
                    myClient,
                    _formKey,
                  ).then((value) async {
                    
                    setState(() {
                    logisticPrediction = myClient.logisticPrediction;
                    rfPrediction = myClient.rfPrediction;
                    });
                  });
                },
                child: Text('Évaluer le Risque'),
              ),
              SizedBox(height: 30),
              if (logisticPrediction != null || rfPrediction != null)
                Column(
                  children: [
                    if (logisticPrediction != null)
                      Text('Régression Logistique : $logisticPrediction'),
                    if (rfPrediction != null)
                      Text('Forêt Aléatoire : $rfPrediction'),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
