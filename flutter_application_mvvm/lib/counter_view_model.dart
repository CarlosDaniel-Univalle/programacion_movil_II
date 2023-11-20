import 'dart:async';

import 'package:flutter_application_mvvm/counter_model.dart';

class CounterViewModel {
  CounterModel _counterModel = CounterModel();
  final _counterController = StreamController<int>();

  Stream<int> get counterStream => _counterController.stream;

  int get count => _counterModel.count;

  void increment() {
    _counterModel.increment();
    _counterController.add(_counterModel.count);
  }

  void decrement() {
    _counterModel.decrement();
    _counterController.add(_counterModel.count);
  }

  void dispose() {
    _counterController.close();
  }
}
