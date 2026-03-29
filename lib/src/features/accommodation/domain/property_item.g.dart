// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PropertyItem _$PropertyItemFromJson(
  Map<String, dynamic> json,
) => _PropertyItem(
  id: json['id'] as String,
  providerId: json['providerId'] as String,
  externalId: json['externalId'] as String,
  name: json['name'] as String,
  type: $enumDecode(_$PropertyTypeEnumMap, json['type']),
  location: json['location'] as String,
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  starRating: (json['starRating'] as num?)?.toInt(),
  reviewScore: (json['reviewScore'] as num?)?.toDouble(),
  reviewCount: (json['reviewCount'] as num?)?.toInt(),
  thumbnailUrl: json['thumbnailUrl'] as String?,
  imageUrls:
      (json['imageUrls'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  amenities:
      (json['amenities'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  roomMatrix:
      (json['roomMatrix'] as List<dynamic>?)
          ?.map((e) => RoomOption.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  policies: json['policies'] == null
      ? null
      : Policies.fromJson(json['policies'] as Map<String, dynamic>),
  distanceToPoi: (json['distanceToPoi'] as num?)?.toInt(),
  etaToPoi: (json['etaToPoi'] as num?)?.toInt(),
  vendorUrl: json['vendorUrl'] as String?,
);

Map<String, dynamic> _$PropertyItemToJson(_PropertyItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'providerId': instance.providerId,
      'externalId': instance.externalId,
      'name': instance.name,
      'type': _$PropertyTypeEnumMap[instance.type]!,
      'location': instance.location,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'starRating': instance.starRating,
      'reviewScore': instance.reviewScore,
      'reviewCount': instance.reviewCount,
      'thumbnailUrl': instance.thumbnailUrl,
      'imageUrls': instance.imageUrls,
      'amenities': instance.amenities,
      'roomMatrix': instance.roomMatrix.map((e) => e.toJson()).toList(),
      'policies': instance.policies?.toJson(),
      'distanceToPoi': instance.distanceToPoi,
      'etaToPoi': instance.etaToPoi,
      'vendorUrl': instance.vendorUrl,
    };

const _$PropertyTypeEnumMap = {
  PropertyType.hotel: 'hotel',
  PropertyType.hostel: 'hostel',
  PropertyType.apartment: 'apartment',
  PropertyType.resort: 'resort',
  PropertyType.villa: 'villa',
  PropertyType.guesthouse: 'guesthouse',
  PropertyType.bedAndBreakfast: 'bedAndBreakfast',
  PropertyType.motel: 'motel',
};

_RoomOption _$RoomOptionFromJson(Map<String, dynamic> json) => _RoomOption(
  id: json['id'] as String,
  name: json['name'] as String,
  boardPlan: json['boardPlan'] as String,
  maxOccupancy: (json['maxOccupancy'] as num).toInt(),
  bedConfig: json['bedConfig'] as String?,
  price: PriceBreakdown.fromJson(json['price'] as Map<String, dynamic>),
  availability: (json['availability'] as num?)?.toInt(),
  refundable: json['refundable'] as bool? ?? false,
  cancellationDeadline: json['cancellationDeadline'] == null
      ? null
      : DateTime.parse(json['cancellationDeadline'] as String),
);

Map<String, dynamic> _$RoomOptionToJson(_RoomOption instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'boardPlan': instance.boardPlan,
      'maxOccupancy': instance.maxOccupancy,
      'bedConfig': instance.bedConfig,
      'price': instance.price.toJson(),
      'availability': instance.availability,
      'refundable': instance.refundable,
      'cancellationDeadline': instance.cancellationDeadline?.toIso8601String(),
    };

_PriceBreakdown _$PriceBreakdownFromJson(Map<String, dynamic> json) =>
    _PriceBreakdown(
      basePrice: (json['basePrice'] as num).toDouble(),
      taxes: (json['taxes'] as num?)?.toDouble() ?? 0,
      fees: (json['fees'] as num?)?.toDouble() ?? 0,
      total: (json['total'] as num).toDouble(),
      currency: json['currency'] as String,
      pricePerNight: (json['pricePerNight'] as num?)?.toDouble(),
      nights: (json['nights'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PriceBreakdownToJson(_PriceBreakdown instance) =>
    <String, dynamic>{
      'basePrice': instance.basePrice,
      'taxes': instance.taxes,
      'fees': instance.fees,
      'total': instance.total,
      'currency': instance.currency,
      'pricePerNight': instance.pricePerNight,
      'nights': instance.nights,
    };

_Policies _$PoliciesFromJson(Map<String, dynamic> json) => _Policies(
  cancellation: json['cancellation'] == null
      ? null
      : CancellationPolicy.fromJson(
          json['cancellation'] as Map<String, dynamic>,
        ),
  payment: json['payment'] == null
      ? null
      : PaymentPolicy.fromJson(json['payment'] as Map<String, dynamic>),
  houseRules: json['houseRules'] == null
      ? null
      : HouseRules.fromJson(json['houseRules'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PoliciesToJson(_Policies instance) => <String, dynamic>{
  'cancellation': instance.cancellation?.toJson(),
  'payment': instance.payment?.toJson(),
  'houseRules': instance.houseRules?.toJson(),
};

_CancellationPolicy _$CancellationPolicyFromJson(Map<String, dynamic> json) =>
    _CancellationPolicy(
      freeCancellation: json['freeCancellation'] as bool? ?? false,
      deadline: json['deadline'] == null
          ? null
          : DateTime.parse(json['deadline'] as String),
      penaltyAmount: (json['penaltyAmount'] as num?)?.toDouble(),
      penaltyPercentage: (json['penaltyPercentage'] as num?)?.toDouble(),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$CancellationPolicyToJson(_CancellationPolicy instance) =>
    <String, dynamic>{
      'freeCancellation': instance.freeCancellation,
      'deadline': instance.deadline?.toIso8601String(),
      'penaltyAmount': instance.penaltyAmount,
      'penaltyPercentage': instance.penaltyPercentage,
      'description': instance.description,
    };

_PaymentPolicy _$PaymentPolicyFromJson(Map<String, dynamic> json) =>
    _PaymentPolicy(
      prepay: json['prepay'] as bool? ?? false,
      payAtProperty: json['payAtProperty'] as bool? ?? false,
      acceptedMethods:
          (json['acceptedMethods'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      depositAmount: (json['depositAmount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PaymentPolicyToJson(_PaymentPolicy instance) =>
    <String, dynamic>{
      'prepay': instance.prepay,
      'payAtProperty': instance.payAtProperty,
      'acceptedMethods': instance.acceptedMethods,
      'depositAmount': instance.depositAmount,
    };

_HouseRules _$HouseRulesFromJson(Map<String, dynamic> json) => _HouseRules(
  checkInTime: json['checkInTime'] as String?,
  checkOutTime: json['checkOutTime'] as String?,
  petsAllowed: json['petsAllowed'] as bool? ?? false,
  smokingAllowed: json['smokingAllowed'] as bool? ?? false,
  partiesAllowed: json['partiesAllowed'] as bool? ?? false,
  additionalRules:
      (json['additionalRules'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
);

Map<String, dynamic> _$HouseRulesToJson(_HouseRules instance) =>
    <String, dynamic>{
      'checkInTime': instance.checkInTime,
      'checkOutTime': instance.checkOutTime,
      'petsAllowed': instance.petsAllowed,
      'smokingAllowed': instance.smokingAllowed,
      'partiesAllowed': instance.partiesAllowed,
      'additionalRules': instance.additionalRules,
    };
