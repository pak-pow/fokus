import 'package:hive/hive.dart';

part 'plant_type.g.dart';

@HiveType(typeId: 12)
enum PlantType {
  @HiveField(0) bamboo,    // Coding
  @HiveField(1) sunflower, // Math
  @HiveField(2) cherry,    // Language
  @HiveField(3) fern,      // Science
  @HiveField(4) rose,      // Writing
  @HiveField(5) orchid,    // Arts
  @HiveField(6) dandelion, // Other
}