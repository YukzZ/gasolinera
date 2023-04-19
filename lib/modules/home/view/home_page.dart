
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:practica_gasolinera/modules/gasolinera/gasolinera_page.dart';
import 'package:practica_gasolinera/widgets/button_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children:  [
          const SizedBox(
            
            child: Image(
              image: AssetImage('assets/icons/logo.png'),
              
              fit: BoxFit.fill,
            ),

            
          ),
           CustomButton(          
              text: 'Ingresar',             
              onPressed: () async {
                await Navigator.push(
                  context, 
                  MaterialPageRoute<void>(
                    builder: (context) => const GasolineraPage(),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
