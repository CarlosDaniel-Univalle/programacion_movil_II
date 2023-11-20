import 'package:flutter/material.dart';
import 'package:flutter_application_mvvm/counter_view.dart';
import 'package:flutter_application_mvvm/counter_view_model.dart';

void main() {
  runApp(
    CounterView(
      viewModel: CounterViewModel(),
    ),
  );
}
