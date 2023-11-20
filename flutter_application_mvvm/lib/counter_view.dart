import 'package:flutter/material.dart';
import 'counter_view_model.dart';

class CounterView extends StatefulWidget {
  final CounterViewModel viewModel;

  CounterView({required this.viewModel});

  @override
  _CounterViewState createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('MVVM Counter App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Contador:',
                style: TextStyle(fontSize: 20),
              ),
              StreamBuilder<int>(
                stream: widget.viewModel.counterStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      '${snapshot.data}',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    );
                  } else {
                    return Text(
                      'Cargando...', // Puedes personalizar el mensaje de carga
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    );
                  }
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      widget.viewModel.increment();
                    },
                    child: Text('Incrementar'),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      widget.viewModel.decrement();
                    },
                    child: Text('Decrementar'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
