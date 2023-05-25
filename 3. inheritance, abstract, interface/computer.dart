import 'tangible_asset.dart';

class Computer extends TangibleAsset {
  String makerName;

  Computer(
    super.name,
    super.color,
    super.price,
    super.weight,
    this.makerName,
  );
}
