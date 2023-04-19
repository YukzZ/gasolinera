import 'package:objectbox/objectbox.dart';

@Entity()
class GasolineraModel {
  GasolineraModel({
    this.id = 0,
    required this.capMax,
    required this.capMin,
    required this.porcentaje,
  });
  @Id(assignable: true)
  int id;
  final int capMax;
  final int capMin;
  final int porcentaje;
}
