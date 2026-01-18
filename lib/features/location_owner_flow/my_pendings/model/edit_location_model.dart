// rename this class (controller file or wherever you put it)
class EditWorkspaceData {           // ← changed name
  final String name;
  final String description;
  final String rule;
  final String noiseLevel;
  final int maxReservationsPerDay;

  EditWorkspaceData({
    required this.name,
    required this.description,
    required this.rule,
    required this.noiseLevel,
    required this.maxReservationsPerDay,
  });
}