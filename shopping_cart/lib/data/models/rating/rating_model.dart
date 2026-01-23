import 'package:shopping_cart/domain/entities/rating/rating_entity.dart';

class RatingModel {
  final double rate;
  final int count;

  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
      rate: (json['rate'] as num).toDouble(),
      count: json['count'] as int,
    );
  }

  RatingEntity toEntity () {
    return RatingEntity(
      rate: rate,
      count: count);
  }
}