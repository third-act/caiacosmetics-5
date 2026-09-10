/// Spacing tokens — screen ≥20, section between blocks, card pad 16–20.
abstract final class AppSpace {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 20;
  static const double xxl = 24;
  static const double xxxl = 32;

  /// Horizontal screen padding — minimum 20.
  static const double screen = 20;

  /// Vertical gap between content blocks.
  static const double section = 24;

  /// Card interior padding.
  static const double card = 16;

  /// Bottom inset so content clears floating TabPill.
  static const double tabClearance = 120;
}
