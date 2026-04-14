import 'package:hive/hive.dart';
import '../../domain/enums/skill_tag.dart';
import '../../domain/enums/task_status.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  SkillTag skillTag;

  @HiveField(3)
  TaskStatus status;

  @HiveField(4)
  final DateTime createdAt;

  @HiveField(5)
  DateTime? completedAt;

  @HiveField(6)
  int pomodoroCount;

  TaskModel({
    required this.id,
    required this.title,
    required this.skillTag,
    this.status = TaskStatus.todo,
    required this.createdAt,
    this.completedAt,
    this.pomodoroCount = 0,
  });
}