import '../models/product.dart';
import '../models/skin_profile.dart';

/// Mock seed data — sourced from caiacosmetics.se product names/prices.
class SeedService {
  static const mockProfile = SkinProfile(
    skinType: 'Normal till kombinerad',
    undertone: 'Neutral med varm underton',
    concerns: ['Lätt torrhet', 'Ojämn lyster'],
    matchScore: 92,
  );

  static const products = <Product>[
    Product(
      id: 'dewy-drops',
      name: 'Dewy Drops Serum Concealer',
      category: 'Concealer',
      priceKr: 295,
      imageAsset: 'assets/images/product_dewy_drops.jpg',
      description:
          'Samma serum-berikade formula som vår bästsäljande foundation, med lite mer täckning.',
      isNew: true,
      matchReason: 'Ger naturlig lyster utan att markera torra partier',
    ),
    Product(
      id: 'wake-me-up',
      name: 'Wake Me Up Cream',
      category: 'Color Corrector',
      priceKr: 295,
      imageAsset: 'assets/images/product_wake_me_up.jpg',
      description:
          'Din genväg till en utvilad, strålande look — perfekt för neutral underton.',
      matchReason: 'Utjämnar hudtonen och ger en fräsch glow',
    ),
    Product(
      id: 'soft-melt',
      name: 'Soft Melt Peptide Lip Balm',
      category: 'Läppvård',
      priceKr: 245,
      imageAsset: 'assets/images/product_lip_balm.jpg',
      description:
          'Kombinerar glansen från ett gloss med vården från ett balm.',
      matchReason: 'Återfuktar utan att kännas tung',
    ),
    Product(
      id: 'glow-blush',
      name: 'Glow Blush',
      category: 'Rouge',
      priceKr: 295,
      imageAsset: 'assets/images/product_glow_blush.jpg',
      description:
          'Mjuk, daggig finish som ger kinderna en naturlig rodnad.',
      matchReason: 'Milky Rose passar din varma underton',
    ),
  ];

  static Product getById(String id) =>
      products.firstWhere((p) => p.id == id, orElse: () => products.first);
}
