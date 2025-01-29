import 'package:one_risk/common/services/storage_service.dart';
import 'package:one_risk/models/prediction_history_model.dart';
import 'package:one_risk/models/client_model.dart';



class PredictionHistoryService {
  Future<void> savePrediction(
    Client myClient,
  ) async {
    await StorageService().savePrediction(
      myClient,
    );
  }

  Future<List<PredictionHistory>> loadPredictions() async {
    return await StorageService().loadPredictions();
  }
}
