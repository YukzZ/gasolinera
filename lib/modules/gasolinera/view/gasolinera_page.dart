import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practica_gasolinera/widgets/button_widget.dart';

class GasolineraPage extends StatefulWidget {
  const GasolineraPage({super.key});

  @override
  State<GasolineraPage> createState() => _GasolineraPageState();
}

class _GasolineraPageState extends State<GasolineraPage> {
  int capMax = 200;
  int capMin = 20;
  int porcentaje = 200;
  int cantidad=0;
  
  bool isVisibleR= false;
  bool isVisibleE= false;
  final controllerCantidad = TextEditingController();
  final controllerNewCantidad = TextEditingController();
  final controllerNewCapacidadMax = TextEditingController();
  final controllerNewCapacidadMin = TextEditingController();

  Future<void> comprar()async{
    int por;
    por = porcentaje - cantidad;
    if(por < capMin){
      await showDialog<void>(
        context: context, 
        builder: (context){
          return AlertDialog(
            title: const Text('No se puede comprar'),
            content: Text(
              'Debes tener un minimo de $capMin del tanque de gasolina. Para comprar la cantidad de $cantidad de gasolina debes aumentar la capacidad o llenar el tanque. ',
              ),
            actions: [
              TextButton(
                onPressed: (){
                  Navigator.pop(context);
                  por = porcentaje;
                }, 
                child: const Text('Ok'),
              )
            ],
          );
        },
      );
    }else{
      porcentaje= por;
    }
    
    setState(() {
      
    });
    controllerCantidad.clear();
  }

  Future<void> rellenar() async {
    int por;
    por = porcentaje + cantidad;
    if(por > capMax){
      await showDialog<void>(
        context: context, 
        builder: (context){
          return AlertDialog(
            title: const Text('No se puede ingresar'),
            content: Text(
              'Debes ingresar una cantidad menor a la de $capMax de gasolina',
              ),
            actions: [
              TextButton(
                onPressed: (){
                  Navigator.pop(context);
                  por = porcentaje;
                }, 
                child: const Text('Ok'),
              )
            ],
          );
        },
      );
    }else{
      porcentaje = por;
    }
    controllerNewCantidad.clear();
    setState(() {
      
    });
  }
  Future<void>newCapacidad() async{

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Gasolinera'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  height: 150,
                  width: 500,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.onError,
                        width: 2,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const SizedBox(height: 10,),
                        Text(
                          'Gasolina disponible $porcentaje',
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(height: 10,),
                        Text(
                          'Capaciad maxima $capMax',
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(height: 10,),
                        Text(
                          'Capaciad minima $capMin',
                          style: const TextStyle(fontSize: 20),
                        ), 
                        const SizedBox(height: 10,),   
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              const Text(
                'Cuánta gasolina deseas comprar?',
                style: TextStyle(fontSize: 20),
              ),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Ingresa la cantidad que se va a comprar',
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                controller: controllerCantidad,
                onChanged: (value) {
                  cantidad = int.parse(value);
                },
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomButton(
                      text: 'Comprar', 
                      onPressed: comprar,
                    ),
                    CustomButton(
                      text: 'Rellenar', 
                      onPressed: (){
                        isVisibleR = !isVisibleR;
                        setState(() {
                          
                        });
                      },
                    ),
                    CustomButton(
                      text: 'Editar Capacidades', 
                      onPressed: (){
                        isVisibleE = !isVisibleE;
                        setState(() {
                          
                        });
                      },
                    ),
                  ],
                ),
              ),
              
              Visibility(
                visible: isVisibleR,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(children: [
                        TextField(
                          decoration: const InputDecoration(
                            hintText: 'Ingresa la cantidad',
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          controller: controllerNewCantidad,
                          onChanged: (value) {
                            cantidad = int.parse(value);
                          },
                        ),
                        CustomButton(
                          text: 'Aceptar', 
                          onPressed: rellenar,
                        ),
                      ],),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: isVisibleE,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          const Text('Capacidad Maxima'),
                          TextField(
                            decoration: const InputDecoration(
                              hintText: 'Ingresa la cantidad maxima',
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            controller: controllerNewCapacidadMax,
                            onChanged: (value) {
                              cantidad = int.parse(value);
                            },
                          ),
                          CustomButton(
                            text: 'Aceptar', 
                            onPressed: (){
                              capMax = cantidad;
                              controllerNewCapacidadMax.clear();
                              setState(() {
      
                              });
                            },
                          ),
                          const Text('Capacidad Minima'),
                          TextField(
                            decoration: const InputDecoration(
                              hintText: 'Ingresa la cantidad minima',
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            controller: controllerNewCapacidadMin,
                            onChanged: (value) {
                              cantidad = int.parse(value);
                            },
                          ),
                          CustomButton(
                            text: 'Aceptar', 
                            onPressed: (){
                              capMin = cantidad;
                              controllerNewCapacidadMin.clear();
                              setState(() {
      
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
