import 'package:dastan/src/features/tours/domain/tour_models.dart';

class TourDto {
  // mapping from Supabase (Map<String, dynamic>) to Domain models

  static Country countryFromSupabase(Map<String, dynamic> json) {
    final map = _toCamelCase(json, {
      'hero_image_url': 'heroImageUrl',
      'flag_emoji': 'flagEmoji',
      'sort_order': 'sortOrder',
    });
    
    if (json['cities'] != null) {
      map['cities'] = (json['cities'] as List)
          .map((c) => cityFromSupabase(c as Map<String, dynamic>).toJson())
          .toList();
    }
    
    return Country.fromJson(map);
  }

  static City cityFromSupabase(Map<String, dynamic> json) {
    final map = _toCamelCase(json, {
      'country_id': 'countryId',
      'hero_image_url': 'heroImageUrl',
      'sort_order': 'sortOrder',
    });
    return City.fromJson(map);
  }

  static TourCategory categoryFromSupabase(Map<String, dynamic> json) {
    return TourCategory.fromJson(json);
  }

  static TourSummary tourSummaryFromSupabase(Map<String, dynamic> json) {
    final map = _toCamelCase(json, {
      'city_id': 'cityId',
      'main_image_url': 'mainImageUrl',
      'duration_minutes': 'durationMinutes',
      'price_usd': 'priceUsd',
      'is_free': 'isFree',
      'average_rating': 'averageRating',
      'review_count': 'reviewCount',
    });
    
    if (map['reviewCount'] == null) map['reviewCount'] = 0;
    
    // Categories are expected as a List<TourCategory>
    if (map['categories'] == null) {
      if (json['tour_categories'] != null) {
         map['categories'] = (json['tour_categories'] as List).toList();
      } else {
         map['categories'] = [];
      }
    }
    
    return TourSummary.fromJson(map);
  }

  static TourDetail tourDetailFromSupabase(Map<String, dynamic> json) {
    final map = _toCamelCase(json, {
      'creator_id': 'creatorId',
      'creator_name': 'creatorName',
      'creator_avatar_url': 'creatorAvatarUrl',
      'full_description': 'fullDescription',
    });
    
    // Summary
    map['summary'] = tourSummaryFromSupabase(json).toJson();
    
    // Guide Content
    if (json['tour_guide_content'] != null) {
      final guide = json['tour_guide_content'] is List 
          ? (json['tour_guide_content'] as List).first 
          : json['tour_guide_content'];
      map['guideContent'] = guideContentFromSupabase(guide as Map<String, dynamic>).toJson();
    }
    
    // Waypoints
    if (json['tour_waypoints'] != null) {
      map['waypoints'] = (json['tour_waypoints'] as List)
          .map((w) => waypointFromSupabase(w as Map<String, dynamic>).toJson())
          .toList();
    }
    
    // Audio Versions
    if (json['tour_audio_versions'] != null) {
      map['audioVersions'] = (json['tour_audio_versions'] as List)
          .map((a) => audioVersionFromSupabase(a as Map<String, dynamic>).toJson())
          .toList();
    }
    
    return TourDetail.fromJson(map);
  }

  static TourWaypoint waypointFromSupabase(Map<String, dynamic> json) {
    final map = _toCamelCase(json, {
      'tour_id': 'tourId',
      'order_index': 'orderIndex',
      'radius_meters': 'radiusMeters',
    });
    if (map['radiusMeters'] == null) map['radiusMeters'] = 50;
    return TourWaypoint.fromJson(map);
  }

  static AudioVersion audioVersionFromSupabase(Map<String, dynamic> json) {
    final map = _toCamelCase(json, {
      'tour_id': 'tourId',
      'language_code': 'languageCode',
      'audio_url': 'audioUrl',
      'preview_url': 'previewUrl',
      'duration_seconds': 'durationSeconds',
    });
    return AudioVersion.fromJson(map);
  }

  static GuideContent guideContentFromSupabase(Map<String, dynamic> json) {
     // Database has 'content' (List of sections) and 'version'
     // Domain has 'sections' (List of sections) and 'version'
     final sections = (json['content'] as List).map((s) {
       final section = Map<String, dynamic>.from(s as Map<String, dynamic>);
       section['chapterTitle'] = section['chapter_title'] ?? section['chapterTitle'];
       
       // Blocks in each section
       if (section['blocks'] != null) {
         section['blocks'] = (section['blocks'] as List).map((b) {
           final block = Map<String, dynamic>.from(b as Map<String, dynamic>);
           
           // Fix Freezed Union discriminator if 'type' is used instead of 'runtimeType'
           if (block.containsKey('type') && !block.containsKey('runtimeType')) {
             block['runtimeType'] = block['type'];
           }
           
           // Field mappings
           block['imageUrl'] = block['image_url'] ?? block['imageUrl'];
           block['isLeading'] = block['is_leading'] ?? block['isLeading'];
           block['address'] = block['address'] ?? block['label']; // Map label/address for location block
           
           return block;
         }).toList();
       }
       return section;
     }).toList();

     return GuideContent(
       tourId: json['tour_id'] ?? '',
       version: json['version'] ?? 1,
       sections: sections.map((s) => GuideSection.fromJson(s)).toList(),
     );
  }

  static SavedTour savedTourFromSupabase(Map<String, dynamic> json) {
    final map = _toCamelCase(json, {
      'tour_id': 'tourId',
      'user_id': 'userId',
      'saved_at': 'savedAt',
      'last_opened_at': 'lastOpenedAt',
    });
    
    if (json['tours'] != null) {
      map['tourSummary'] = tourSummaryFromSupabase(json['tours'] as Map<String, dynamic>).toJson();
    }
    
    return SavedTour.fromJson(map);
  }

  static PlaybackProgress progressFromSupabase(Map<String, dynamic> json) {
    final map = _toCamelCase(json, {
      'tour_id': 'tourId',
      'user_id': 'userId',
      'audio_position_ms': 'audioPositionMs',
      'current_section': 'currentSection',
      'last_updated_at': 'lastUpdatedAt',
    });
    return PlaybackProgress.fromJson(map);
  }

  // Helper to clone map and rename keys
  static Map<String, dynamic> _toCamelCase(Map<String, dynamic> json, Map<String, String> mappings) {
    final map = Map<String, dynamic>.from(json);
    mappings.forEach((snake, camel) {
      if (json.containsKey(snake)) {
        map[camel] = json[snake];
      }
    });
    return map;
  }
}
