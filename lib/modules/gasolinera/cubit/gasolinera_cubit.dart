import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:practica_gasolinera/core/controllers/gasolinera_controller.dart';
import 'package:practica_gasolinera/data/model/gasolinera_model.dart';

part 'gasolinera_state.dart';

class GasolineraCubit extends Cubit<GasolineraState> {
  GasolineraCubit() : super(const GasolineraState());
  final ctrl = GasolineraController();

  Future<void> getAll() async{
    emit(state.copyWith(status: GasolineraEstatus.loading));

    try{
      await Future<void>.delayed(const Duration(seconds: 1));
      final lsGasolinera = await ctrl.getAll();

      emit(state.copyWith(
          status: GasolineraEstatus.success,
          lsGasolinera: lsGasolinera,
        ),
      );
    } catch(e){
      emit(state.copyWith(status: GasolineraEstatus.failure));
    }
  }

  Future<void> init ({required int id}) async{
    final gasolinera = GasolineraController().getById(id);
    emit(state.copyWith(gasolineraModel: gasolinera));
    await getAll();
  }

  Future<void> save({
    required int capMax,
    required int capMin,
    required int porcentaje,
  }) async {
    emit(state.copyWith(status: GasolineraEstatus.loading));

    final gasolinera = GasolineraModel(
      capMax: capMax,
      capMin: capMin,
      porcentaje: porcentaje,
    );
    final result = await ctrl.insert(gasolineraModel: gasolinera);
    if(result){
      await getAll();
    }
    else{
      emit(state.copyWith(status: GasolineraEstatus.failure));
    }
  }
}
