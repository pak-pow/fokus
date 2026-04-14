import 'package:hive/hive.dart';

part 'skill_tag.g.dart';

@HiveType(typeId: 11)
enum SkillTag {
  @HiveField(0) coding,
  @HiveField(1) math,
  @HiveField(2) language,
  @HiveField(3) science,
  @HiveField(4) writing,
  @HiveField(5) arts,
  @HiveField(6) other,
}