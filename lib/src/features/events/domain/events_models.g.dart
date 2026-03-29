// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EventPlace _$EventPlaceFromJson(Map<String, dynamic> json) => _EventPlace(
  granularity: $enumDecode(_$PlaceGranularityEnumMap, json['granularity']),
  value: json['value'] as String,
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
);

Map<String, dynamic> _$EventPlaceToJson(_EventPlace instance) =>
    <String, dynamic>{
      'granularity': _$PlaceGranularityEnumMap[instance.granularity]!,
      'value': instance.value,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

const _$PlaceGranularityEnumMap = {
  PlaceGranularity.city: 'city',
  PlaceGranularity.neighborhood: 'neighborhood',
  PlaceGranularity.poi: 'poi',
  PlaceGranularity.region: 'region',
};

_EventDateWindow _$EventDateWindowFromJson(Map<String, dynamic> json) =>
    _EventDateWindow(
      start: DateTime.parse(json['start'] as String),
      end: DateTime.parse(json['end'] as String),
    );

Map<String, dynamic> _$EventDateWindowToJson(_EventDateWindow instance) =>
    <String, dynamic>{
      'start': instance.start.toIso8601String(),
      'end': instance.end.toIso8601String(),
    };

_EventVenue _$EventVenueFromJson(Map<String, dynamic> json) => _EventVenue(
  name: json['name'] as String,
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  address: json['address'] as String?,
  city: json['city'] as String?,
);

Map<String, dynamic> _$EventVenueToJson(_EventVenue instance) =>
    <String, dynamic>{
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'address': instance.address,
      'city': instance.city,
    };

_EventsFilters _$EventsFiltersFromJson(Map<String, dynamic> json) =>
    _EventsFilters(
      categories:
          (json['categories'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$EventCategoryEnumMap, e))
              .toList() ??
          const [],
      duringMyDates: json['duringMyDates'] as bool?,
      free: json['free'] as bool?,
      familyFriendly: json['familyFriendly'] as bool?,
      thisWeekend: json['thisWeekend'] as bool?,
      today: json['today'] as bool?,
    );

Map<String, dynamic> _$EventsFiltersToJson(_EventsFilters instance) =>
    <String, dynamic>{
      'categories': instance.categories
          .map((e) => _$EventCategoryEnumMap[e]!)
          .toList(),
      'duringMyDates': instance.duringMyDates,
      'free': instance.free,
      'familyFriendly': instance.familyFriendly,
      'thisWeekend': instance.thisWeekend,
      'today': instance.today,
    };

const _$EventCategoryEnumMap = {
  EventCategory.concert: 'concert',
  EventCategory.theatre: 'theatre',
  EventCategory.sports: 'sports',
  EventCategory.festival: 'festival',
  EventCategory.exhibition: 'exhibition',
  EventCategory.conference: 'conference',
  EventCategory.comedy: 'comedy',
  EventCategory.film: 'film',
  EventCategory.food: 'food',
  EventCategory.nightlife: 'nightlife',
  EventCategory.community: 'community',
  EventCategory.other: 'other',
};

_EventsSearchRequest _$EventsSearchRequestFromJson(
  Map<String, dynamic> json,
) => _EventsSearchRequest(
  itineraryId: json['itineraryId'] as String,
  place: EventPlace.fromJson(json['place'] as Map<String, dynamic>),
  dateWindow: json['dateWindow'] == null
      ? null
      : EventDateWindow.fromJson(json['dateWindow'] as Map<String, dynamic>),
  filters: json['filters'] == null
      ? const EventsFilters()
      : EventsFilters.fromJson(json['filters'] as Map<String, dynamic>),
  sort:
      $enumDecodeNullable(_$EventsSortEnumMap, json['sort']) ?? EventsSort.date,
);

Map<String, dynamic> _$EventsSearchRequestToJson(
  _EventsSearchRequest instance,
) => <String, dynamic>{
  'itineraryId': instance.itineraryId,
  'place': instance.place.toJson(),
  'dateWindow': instance.dateWindow?.toJson(),
  'filters': instance.filters?.toJson(),
  'sort': _$EventsSortEnumMap[instance.sort]!,
};

const _$EventsSortEnumMap = {
  EventsSort.date: 'date',
  EventsSort.distance: 'distance',
  EventsSort.popularity: 'popularity',
  EventsSort.recommended: 'recommended',
};

_EventCard _$EventCardFromJson(Map<String, dynamic> json) => _EventCard(
  id: json['id'] as String,
  providerId: json['providerId'] as String,
  externalId: json['externalId'] as String,
  title: json['title'] as String,
  category: $enumDecode(_$EventCategoryEnumMap, json['category']),
  start: DateTime.parse(json['start'] as String),
  end: json['end'] == null ? null : DateTime.parse(json['end'] as String),
  venue: EventVenue.fromJson(json['venue'] as Map<String, dynamic>),
  leadImage: json['leadImage'] as String,
  distance: (json['distance'] as num?)?.toInt(),
  price: json['price'] as String?,
  isFree: json['isFree'] as bool?,
  familyFriendly: json['familyFriendly'] as bool?,
  website: json['website'] as String?,
  ticketUrl: json['ticketUrl'] as String?,
  shortDescription: json['shortDescription'] as String?,
);

Map<String, dynamic> _$EventCardToJson(_EventCard instance) =>
    <String, dynamic>{
      'id': instance.id,
      'providerId': instance.providerId,
      'externalId': instance.externalId,
      'title': instance.title,
      'category': _$EventCategoryEnumMap[instance.category]!,
      'start': instance.start.toIso8601String(),
      'end': instance.end?.toIso8601String(),
      'venue': instance.venue.toJson(),
      'leadImage': instance.leadImage,
      'distance': instance.distance,
      'price': instance.price,
      'isFree': instance.isFree,
      'familyFriendly': instance.familyFriendly,
      'website': instance.website,
      'ticketUrl': instance.ticketUrl,
      'shortDescription': instance.shortDescription,
    };

_EventDetail _$EventDetailFromJson(Map<String, dynamic> json) => _EventDetail(
  id: json['id'] as String,
  providerId: json['providerId'] as String,
  externalId: json['externalId'] as String,
  title: json['title'] as String,
  category: $enumDecode(_$EventCategoryEnumMap, json['category']),
  start: DateTime.parse(json['start'] as String),
  end: json['end'] == null ? null : DateTime.parse(json['end'] as String),
  venue: EventVenue.fromJson(json['venue'] as Map<String, dynamic>),
  photos:
      (json['photos'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  descriptionShort: json['descriptionShort'] as String?,
  descriptionFull: json['descriptionFull'] as String?,
  website: json['website'] as String?,
  ticketUrl: json['ticketUrl'] as String?,
  price: json['price'] as String?,
  isFree: json['isFree'] as bool?,
  familyFriendly: json['familyFriendly'] as bool?,
  organizer: json['organizer'] as String?,
  attendeeCount: (json['attendeeCount'] as num?)?.toInt(),
);

Map<String, dynamic> _$EventDetailToJson(_EventDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'providerId': instance.providerId,
      'externalId': instance.externalId,
      'title': instance.title,
      'category': _$EventCategoryEnumMap[instance.category]!,
      'start': instance.start.toIso8601String(),
      'end': instance.end?.toIso8601String(),
      'venue': instance.venue.toJson(),
      'photos': instance.photos,
      'descriptionShort': instance.descriptionShort,
      'descriptionFull': instance.descriptionFull,
      'website': instance.website,
      'ticketUrl': instance.ticketUrl,
      'price': instance.price,
      'isFree': instance.isFree,
      'familyFriendly': instance.familyFriendly,
      'organizer': instance.organizer,
      'attendeeCount': instance.attendeeCount,
    };

_EventsSearchResult _$EventsSearchResultFromJson(Map<String, dynamic> json) =>
    _EventsSearchResult(
      items: (json['items'] as List<dynamic>)
          .map((e) => EventCard.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: (json['totalCount'] as num).toInt(),
      nextCursor: json['nextCursor'] as String?,
      fromCache: json['fromCache'] as bool? ?? false,
    );

Map<String, dynamic> _$EventsSearchResultToJson(_EventsSearchResult instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
      'totalCount': instance.totalCount,
      'nextCursor': instance.nextCursor,
      'fromCache': instance.fromCache,
    };
