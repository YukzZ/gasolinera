part of 'gasolinera_cubit.dart';

class GasolineraState extends Equatable {
  const GasolineraState({
    this.status = GasolineraEstatus.none, 
    this.lsGasolinera = const <GasolineraModel>[], 
    this.gasolineraModel,
  });

  final GasolineraEstatus status;
  final List<GasolineraModel> lsGasolinera;
  final GasolineraModel? gasolineraModel;

  GasolineraState copyWith({
    GasolineraEstatus? status,
    List<GasolineraModel>? lsGasolinera,
    GasolineraModel? gasolineraModel,
  }){
    return GasolineraState(
      status: status ?? this.status, 
      lsGasolinera: lsGasolinera ?? this.lsGasolinera, 
      gasolineraModel: gasolineraModel ?? this.gasolineraModel,
    );
  }
  @override
  List<Object> get props => [status];
}

enum GasolineraEstatus {none, loading, success, failure, saveOk, saveError}
