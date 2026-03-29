import 'package:freezed_annotation/freezed_annotation.dart';

part 'tour_models.freezed.dart';
part 'tour_models.g.dart';

// ─── TOUR TYPE ───
enum TourType { single, multi }

// ─── AUDIO STATUS ───
enum AudioStatus { pending, processing, ready, error }

// ─── COUNTRY ───
@freezed
abstract class Country with _$Country {
  const factory Country({
    required String id,
    required String name,
    required String description,
    required String heroImageUrl,
    String? flagEmoji,
    required int sortOrder,
    @Default([]) List<City> cities,
  }) = _Country;

  factory Country.fromJson(Map<String, dynamic> json) => _$CountryFromJson(json);
}

// ─── CITY ───
@freezed
abstract class City with _$City {
  const factory City({
    required String id,
    required String countryId,
    required String name,
    required String description,
    required String heroImageUrl,
    double? latitude,
    double? longitude,
    required int sortOrder,
  }) = _City;

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
}

// ─── TOUR CATEGORY ───
@freezed
abstract class TourCategory with _$TourCategory {
  const factory TourCategory({
    required String id,
    required String name,
    String? icon,
  }) = _TourCategory;

  factory TourCategory.fromJson(Map<String, dynamic> json) => _$TourCategoryFromJson(json);
}

// ─── TOUR (summary — used in list cards) ───
@freezed
abstract class TourSummary with _$TourSummary {
  const factory TourSummary({
    required String id,
    required String cityId,
    required TourType type,
    required String name,
    required String tagline,
    required String mainImageUrl,
    required int durationMinutes,
    required double priceUsd,
    required bool isFree,
    double? averageRating,
    required int reviewCount,
    required List<TourCategory> categories,
  }) = _TourSummary;

  factory TourSummary.fromJson(Map<String, dynamic> json) => _$TourSummaryFromJson(json);
}

// ─── TOUR DETAIL ───
@freezed
abstract class TourDetail with _$TourDetail {
  const factory TourDetail({
    required TourSummary summary,
    required String creatorId,
    String? creatorName,
    String? creatorAvatarUrl,
    required String fullDescription,
    required GuideContent guideContent,
    required List<TourWaypoint> waypoints,
    required List<AudioVersion> audioVersions,
    // For multi-tours only:
    List<TourSummary>? childTours,          // ordered single tours within this multi-tour
  }) = _TourDetail;

  factory TourDetail.fromJson(Map<String, dynamic> json) => _$TourDetailFromJson(json);
}

// ─── WAYPOINT ───
@freezed
abstract class TourWaypoint with _$TourWaypoint {
  const factory TourWaypoint({
    required String id,
    required String tourId,
    required int orderIndex,
    String? label,
    required double latitude,
    required double longitude,
    required int radiusMeters,
  }) = _TourWaypoint;

  factory TourWaypoint.fromJson(Map<String, dynamic> json) => _$TourWaypointFromJson(json);
}

// ─── MULTI-TOUR ITEM ───
@freezed
abstract class MultiTourItem with _$MultiTourItem {
  const factory MultiTourItem({
    required String id,
    required String multiTourId,
    required String singleTourId,
    required int orderIndex,
    double? triggerLatitude,
    double? triggerLongitude,
    required int triggerRadiusMeters,
    TourSummary? singleTourSummary,   // Populated when fetching
  }) = _MultiTourItem;

  factory MultiTourItem.fromJson(Map<String, dynamic> json) => _$MultiTourItemFromJson(json);
}

// ─── AUDIO VERSION ───
@freezed
abstract class AudioVersion with _$AudioVersion {
  const factory AudioVersion({
    required String id,
    required String tourId,
    required String languageCode,
    String? audioUrl,
    String? previewUrl,
    int? durationSeconds,
    required AudioStatus status,
  }) = _AudioVersion;

  factory AudioVersion.fromJson(Map<String, dynamic> json) => _$AudioVersionFromJson(json);
}

// ─────────────────────────────────────────────────────────────
// GUIDE CONTENT (structured rich-text guide)
// ─────────────────────────────────────────────────────────────

// Top-level container
@freezed
abstract class GuideContent with _$GuideContent {
  const factory GuideContent({
    required String tourId,
    required List<GuideSection> sections,
    required int version,
  }) = _GuideContent;

  factory GuideContent.fromJson(Map<String, dynamic> json) => _$GuideContentFromJson(json);
}

// One "section" = a chapter-like block. A tour can have 1–N sections.
@freezed
abstract class GuideSection with _$GuideSection {
  const factory GuideSection({
    required String id,
    required String chapterTitle,
    required List<GuideBlock> blocks,   // ordered content blocks
  }) = _GuideSection;

  factory GuideSection.fromJson(Map<String, dynamic> json) => _$GuideSectionFromJson(json);
}

// A single content block within a section
@freezed
abstract class GuideBlock with _$GuideBlock {
  // Plain paragraph text
  const factory GuideBlock.text({
    required String content,
  }) = GuideBlockText;

  // Pull quote or highlighted fact
  const factory GuideBlock.highlight({
    required String content,
  }) = GuideBlockHighlight;

  // Image with optional caption
  const factory GuideBlock.image({
    required String imageUrl,
    String? caption,
    @Default(false) bool isLeading,   // true = hero/leading image
  }) = GuideBlockImage;

  // Key fact chip (e.g. "Built in 1847")
  const factory GuideBlock.fact({
    required String label,
    required String value,
  }) = GuideBlockFact;

  // Location tag
  const factory GuideBlock.location({
    required String address,
    double? latitude,
    double? longitude,
  }) = GuideBlockLocation;

  // Year / historical date badge
  const factory GuideBlock.yearBadge({
    required String label,           // e.g. "Built in 1492"
  }) = GuideBlockYearBadge;

  factory GuideBlock.fromJson(Map<String, dynamic> json) => _$GuideBlockFromJson(json);
}

// ─── SAVED TOUR (user's purchased/saved tour) ───
@freezed
abstract class SavedTour with _$SavedTour {
  const factory SavedTour({
    required String id,
    required String tourId,
    required String userId,
    required DateTime savedAt,
    DateTime? lastOpenedAt,
    TourSummary? tourSummary,   // Populated on fetch
  }) = _SavedTour;

  factory SavedTour.fromJson(Map<String, dynamic> json) => _$SavedTourFromJson(json);
}

// ─── PLAYBACK PROGRESS ───
@freezed
abstract class PlaybackProgress with _$PlaybackProgress {
  const factory PlaybackProgress({
    required String tourId,
    required String userId,
    required int audioPositionMs,
    required int currentSection,
    required bool completed,
    required DateTime lastUpdatedAt,
  }) = _PlaybackProgress;

  factory PlaybackProgress.fromJson(Map<String, dynamic> json) => _$PlaybackProgressFromJson(json);
}

// ─── TOUR RATING ───
@freezed
abstract class TourRating with _$TourRating {
  const factory TourRating({
    required String id,
    required String tourId,
    required String userId,
    required int rating,
    String? reviewText,
    required DateTime createdAt,
  }) = _TourRating;

  factory TourRating.fromJson(Map<String, dynamic> json) => _$TourRatingFromJson(json);
}

// ─── SAVED TOURS CLUSTER (for saved tours screen) ───
@freezed
abstract class SavedTourCluster with _$SavedTourCluster {
  const factory SavedTourCluster({
    required City city,
    required List<SavedTour> tours,
    required DateTime mostRecentOpenedAt,
  }) = _SavedTourCluster;
}
