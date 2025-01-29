import 'package:flutter/material.dart';
import 'package:one_risk/common/utils/constants.dart';
import 'package:one_risk/common/services/api_service.dart';
import 'package:one_risk/models/client_model.dart';

class RiskAssessmentService {
final ApiService _apiService = ApiService();
  Future<void> evaluateRisk(Client myClient, GlobalKey<FormState> _formKey,
  ) async {
    if (_formKey.currentState!.validate()){

 await _apiService.makePostRequest(
      Constants.API_URL,
      myClient,
    );

  }
}

}
