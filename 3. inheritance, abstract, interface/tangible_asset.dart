import 'asset.dart';
import 'thing.dart';

abstract class TangibleAsset extends Asset implements Thing {
  int price;
  double _weight;

  TangibleAsset(
    super.name,
    super.color,
    this.price,
    double weight,
  ) : _weight = weight;

  @override
  double get weight => _weight;

  @override
  set(double value) {
    if (value < 0) {
      throw Exception('weight가 0보다 작을 수는 없습니다.');
    }
    _weight = value;
  }
}
