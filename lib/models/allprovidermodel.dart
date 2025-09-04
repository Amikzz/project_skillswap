/// A class that represents a service provider.
class Provider {
  /// The path to the provider's profile photo.
  final String profilePhoto;

  /// The name of the provider.
  final String name;

  /// The skill that the provider offers.
  final String skill;

  /// Creates a [Provider] object.
  ///
  /// All parameters are required.
  Provider({
    required this.profilePhoto,
    required this.name,
    required this.skill,
  });
}
