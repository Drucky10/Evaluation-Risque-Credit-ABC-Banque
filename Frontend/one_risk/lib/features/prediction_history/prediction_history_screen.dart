import 'package:flutter/material.dart';
import 'package:one_risk/common/services/storage_service.dart';
import 'package:one_risk/models/prediction_history_model.dart';
import 'package:one_risk/features/client_info/client_info_screen.dart';

class PredictionHistoryScreen extends StatefulWidget {
  @override
  _PredictionHistoryScreenState createState() => _PredictionHistoryScreenState();
}

class _PredictionHistoryScreenState extends State<PredictionHistoryScreen> {
  List<PredictionHistory> predictionHistory = [];

  @override
  void initState() {
    super.initState();
    loadPredictions();
  }

  Future<void> loadPredictions() async {
    try {
      final predictions = await StorageService().loadPredictions();
      setState(() {
        predictionHistory = predictions;
      });
    } catch (e) {
      print('Erreur lors du chargement des prédictions : $e');
    }
  }



  Future<void> clearHistory() async {
    try {
      await StorageService().clearPredictions();
      setState(() {
        predictionHistory = [];
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Historique effacé avec succès')),
      );
    } catch (e) {
      print('Erreur lors de l\'effacement de l\'historique : $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur lors de l\'effacement de l\'historique')),
      );
    }
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historique des Prédictions'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Effacer l\'Historique'),
                  content: Text('Voulez-vous vraiment effacer l\'historique des prédictions ?'),
                  actions: [
                    TextButton(
                      child: Text('Annuler'),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    TextButton(
                      child: Text('Effacer'),
                      onPressed: () {
                        clearHistory();
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: predictionHistory.isEmpty
          ? Center(child: Text('Aucune prédiction enregistrée'))
          : ListView.builder(
              itemCount: predictionHistory.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${predictionHistory[index].clientName} ${predictionHistory[index].clientFirstName}'),
                  subtitle: Text('Prédiction : ${predictionHistory[index].rfPrediction}'),
                  onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ClientInfoScreen(predictionHistory[index])),
              );
            },

                );
              },
            ),
    );
  }
}