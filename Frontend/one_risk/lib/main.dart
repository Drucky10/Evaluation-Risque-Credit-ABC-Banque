import 'package:flutter/material.dart';
import 'package:one_risk/features/risk_assessment/risk_assessment_screen.dart';
import 'package:one_risk/features/prediction_history/prediction_history_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Évaluation du Risque de Crédit',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: RiskAssessmentScreen(),
      routes: {
        '/prediction-history': (context) => PredictionHistoryScreen(),
      },
    );
  }
}
