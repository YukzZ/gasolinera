import 'package:practica_gasolinera/core/data_base_controller.dart';
import 'package:practica_gasolinera/data/model/gasolinera_model.dart';

class GasolineraController{
  Future<List<GasolineraModel>> getAll() async{
    final box = DataBaseController.store.box<GasolineraModel>();
    final lsGasolinera = box.getAll();
    return lsGasolinera;
  }

  GasolineraModel? getById(int id){
    final box = DataBaseController.store.box<GasolineraModel>();
    final gasolinera = box.get(id);
    return gasolinera;
  }

  Future <bool> insert ({required GasolineraModel gasolineraModel}) async{
    final box = DataBaseController.store.box<GasolineraModel>();
    final id = box.put(gasolineraModel);
    return id > 0;
  }
}
