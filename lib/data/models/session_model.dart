import 'package:hive/hive.dart';

part 'session_model.g.dart';

@HiveType(typeId: 2)
class SessionModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String? taskId; // Nullable in case they run a generic session without a task

  @HiveField(2)
  final DateTime startTime;

  @HiveField(3)
  final DateTime endTime;

  @HiveField(4)
  final int durationMinutes;

  @HiveField(5)
  final bool wasCompleted;

  SessionModel({
    required this.id,
    this.taskId,
    required this.startTime,
    required this.endTime,
    required this.durationMinutes,
    required this.wasCompleted,
  });
}