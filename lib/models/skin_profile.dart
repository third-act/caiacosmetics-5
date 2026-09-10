class SkinProfile {
  const SkinProfile({
    required this.skinType,
    required this.undertone,
    required this.concerns,
    required this.matchScore,
  });

  final String skinType;
  final String undertone;
  final List<String> concerns;
  final int matchScore;
}
