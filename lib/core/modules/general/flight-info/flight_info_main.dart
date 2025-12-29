import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FlightInfoMain extends StatelessWidget {
  const FlightInfoMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Image.asset(
            'assets/images/logo_talma_2.png',
            fit: BoxFit.contain,
          ),
          Text('Buscador Vuelos'),
          ElevatedButton(
            onPressed: () {
              context.push('/');
            },
            child: Text("Return"),
          ),
        ],
      )),
    );
  }
}
