import 'package:json_annotation/json_annotation.dart';

enum MedidaCaseira {
  @JsonValue(0)
  Grama,
  @JsonValue(1)
  MeiaXicara,
  @JsonValue(2)
  ColherArrozCheia,
  @JsonValue(3)
  ColherArrozRasa,
  @JsonValue(4)
  ColherSopaCheia,
  @JsonValue(5)
  ColhersopaRasa,
  @JsonValue(6)
  Colher;
}
