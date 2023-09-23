import 'package:flutter/cupertino.dart';

import '../controllers/status_controller.dart';
import '../models/status.dart';

enum StatusesState { initial, loading, complete, error }

class StatusProvider extends ChangeNotifier {
  StatusesState _state = StatusesState.initial;
  StatusesState get state => _state;
  List<Statuses>? _statuses;
  List<Statuses>? get statuses => _statuses;

  StatusProvider() {
    getStatus();
  }

  final StatusController _statuesApiController = StatusController();

  Future<void> getStatus() async {
    _state = StatusesState.loading;
    notifyListeners();

    try {
      final repo = await _statuesApiController.getAllStatues();
      _statuses = repo.data.statuses;
      _state = StatusesState.complete;
      notifyListeners();
    } catch (e) {
      _state = StatusesState.error;
      notifyListeners();
    }
  }
}
