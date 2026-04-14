import 'package:hive/hive.dart';
import '../../domain/enums/plant_type.dart';
import '../../domain/enums/skill_tag.dart';

part 'plant_model.g.dart';

@HiveType(typeId: 1)
class PlantModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String taskId; 

  @HiveField(2)
  final PlantType plantType;

  @HiveField(3)
  int growthStage; // e.g., 0 (seed) to 4 (fully grown)

  @HiveField(4)
  bool isWilting;

  @HiveField(5)
  DateTime lastWateredAt;

  @HiveField(6)
  final SkillTag skillTag;

  PlantModel({
    required this.id,
    required this.taskId,
    required this.plantType,
    this.growthStage = 0,
    this.isWilting = false,
    required this.lastWateredAt,
    required this.skillTag,
  });
}