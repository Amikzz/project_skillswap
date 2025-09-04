/// A class that represents a category of skills.
class SkillCategory {
  /// The name of the category.
  final String name;

  /// A list of skills within the category.
  final List<String> skills;

  /// Creates a [SkillCategory] object.
  ///
  /// All parameters are required.
  SkillCategory({required this.name, required this.skills});
}