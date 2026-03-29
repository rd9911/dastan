// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// ignore_for_file: type=lint
class $ItinerariesTable extends Itineraries
    with TableInfo<$ItinerariesTable, ItineraryRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ItinerariesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _destinationMeta = const VerificationMeta(
    'destination',
  );
  @override
  late final GeneratedColumn<String> destination = GeneratedColumn<String>(
    'destination',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
    'start_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _endDateMeta = const VerificationMeta(
    'endDate',
  );
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
    'end_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _travelersMeta = const VerificationMeta(
    'travelers',
  );
  @override
  late final GeneratedColumn<int> travelers = GeneratedColumn<int>(
    'travelers',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    destination,
    startDate,
    endDate,
    travelers,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'itineraries';
  @override
  VerificationContext validateIntegrity(
    Insertable<ItineraryRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('destination')) {
      context.handle(
        _destinationMeta,
        destination.isAcceptableOrUnknown(
          data['destination']!,
          _destinationMeta,
        ),
      );
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    }
    if (data.containsKey('end_date')) {
      context.handle(
        _endDateMeta,
        endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta),
      );
    }
    if (data.containsKey('travelers')) {
      context.handle(
        _travelersMeta,
        travelers.isAcceptableOrUnknown(data['travelers']!, _travelersMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ItineraryRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ItineraryRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      destination: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}destination'],
      ),
      startDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_date'],
      ),
      endDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_date'],
      ),
      travelers: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}travelers'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $ItinerariesTable createAlias(String alias) {
    return $ItinerariesTable(attachedDatabase, alias);
  }
}

class ItineraryRow extends DataClass implements Insertable<ItineraryRow> {
  final String id;
  final String title;
  final String? destination;
  final DateTime? startDate;
  final DateTime? endDate;
  final int travelers;
  final DateTime createdAt;
  final DateTime updatedAt;
  const ItineraryRow({
    required this.id,
    required this.title,
    this.destination,
    this.startDate,
    this.endDate,
    required this.travelers,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || destination != null) {
      map['destination'] = Variable<String>(destination);
    }
    if (!nullToAbsent || startDate != null) {
      map['start_date'] = Variable<DateTime>(startDate);
    }
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<DateTime>(endDate);
    }
    map['travelers'] = Variable<int>(travelers);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ItinerariesCompanion toCompanion(bool nullToAbsent) {
    return ItinerariesCompanion(
      id: Value(id),
      title: Value(title),
      destination: destination == null && nullToAbsent
          ? const Value.absent()
          : Value(destination),
      startDate: startDate == null && nullToAbsent
          ? const Value.absent()
          : Value(startDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
      travelers: Value(travelers),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory ItineraryRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ItineraryRow(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      destination: serializer.fromJson<String?>(json['destination']),
      startDate: serializer.fromJson<DateTime?>(json['startDate']),
      endDate: serializer.fromJson<DateTime?>(json['endDate']),
      travelers: serializer.fromJson<int>(json['travelers']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'destination': serializer.toJson<String?>(destination),
      'startDate': serializer.toJson<DateTime?>(startDate),
      'endDate': serializer.toJson<DateTime?>(endDate),
      'travelers': serializer.toJson<int>(travelers),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  ItineraryRow copyWith({
    String? id,
    String? title,
    Value<String?> destination = const Value.absent(),
    Value<DateTime?> startDate = const Value.absent(),
    Value<DateTime?> endDate = const Value.absent(),
    int? travelers,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => ItineraryRow(
    id: id ?? this.id,
    title: title ?? this.title,
    destination: destination.present ? destination.value : this.destination,
    startDate: startDate.present ? startDate.value : this.startDate,
    endDate: endDate.present ? endDate.value : this.endDate,
    travelers: travelers ?? this.travelers,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  ItineraryRow copyWithCompanion(ItinerariesCompanion data) {
    return ItineraryRow(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      destination: data.destination.present
          ? data.destination.value
          : this.destination,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      travelers: data.travelers.present ? data.travelers.value : this.travelers,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ItineraryRow(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('destination: $destination, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('travelers: $travelers, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    destination,
    startDate,
    endDate,
    travelers,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ItineraryRow &&
          other.id == this.id &&
          other.title == this.title &&
          other.destination == this.destination &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.travelers == this.travelers &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ItinerariesCompanion extends UpdateCompanion<ItineraryRow> {
  final Value<String> id;
  final Value<String> title;
  final Value<String?> destination;
  final Value<DateTime?> startDate;
  final Value<DateTime?> endDate;
  final Value<int> travelers;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const ItinerariesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.destination = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.travelers = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ItinerariesCompanion.insert({
    required String id,
    required String title,
    this.destination = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.travelers = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<ItineraryRow> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? destination,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<int>? travelers,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (destination != null) 'destination': destination,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (travelers != null) 'travelers': travelers,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ItinerariesCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<String?>? destination,
    Value<DateTime?>? startDate,
    Value<DateTime?>? endDate,
    Value<int>? travelers,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return ItinerariesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      destination: destination ?? this.destination,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      travelers: travelers ?? this.travelers,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (destination.present) {
      map['destination'] = Variable<String>(destination.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (travelers.present) {
      map['travelers'] = Variable<int>(travelers.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ItinerariesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('destination: $destination, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('travelers: $travelers, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SavedItemsTable extends SavedItems
    with TableInfo<$SavedItemsTable, SavedItemRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SavedItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _itineraryIdMeta = const VerificationMeta(
    'itineraryId',
  );
  @override
  late final GeneratedColumn<String> itineraryId = GeneratedColumn<String>(
    'itinerary_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES itineraries (id)',
    ),
  );
  static const VerificationMeta _sectionMeta = const VerificationMeta(
    'section',
  );
  @override
  late final GeneratedColumn<String> section = GeneratedColumn<String>(
    'section',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dedupeKeyMeta = const VerificationMeta(
    'dedupeKey',
  );
  @override
  late final GeneratedColumn<String> dedupeKey = GeneratedColumn<String>(
    'dedupe_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    itineraryId,
    section,
    dedupeKey,
    content,
    createdAt,
    updatedAt,
    isSynced,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'saved_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<SavedItemRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('itinerary_id')) {
      context.handle(
        _itineraryIdMeta,
        itineraryId.isAcceptableOrUnknown(
          data['itinerary_id']!,
          _itineraryIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_itineraryIdMeta);
    }
    if (data.containsKey('section')) {
      context.handle(
        _sectionMeta,
        section.isAcceptableOrUnknown(data['section']!, _sectionMeta),
      );
    } else if (isInserting) {
      context.missing(_sectionMeta);
    }
    if (data.containsKey('dedupe_key')) {
      context.handle(
        _dedupeKeyMeta,
        dedupeKey.isAcceptableOrUnknown(data['dedupe_key']!, _dedupeKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_dedupeKeyMeta);
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SavedItemRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SavedItemRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      itineraryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}itinerary_id'],
      )!,
      section: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}section'],
      )!,
      dedupeKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dedupe_key'],
      )!,
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
    );
  }

  @override
  $SavedItemsTable createAlias(String alias) {
    return $SavedItemsTable(attachedDatabase, alias);
  }
}

class SavedItemRow extends DataClass implements Insertable<SavedItemRow> {
  final String id;
  final String itineraryId;
  final String section;
  final String dedupeKey;
  final String content;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isSynced;
  const SavedItemRow({
    required this.id,
    required this.itineraryId,
    required this.section,
    required this.dedupeKey,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    required this.isSynced,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['itinerary_id'] = Variable<String>(itineraryId);
    map['section'] = Variable<String>(section);
    map['dedupe_key'] = Variable<String>(dedupeKey);
    map['content'] = Variable<String>(content);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  SavedItemsCompanion toCompanion(bool nullToAbsent) {
    return SavedItemsCompanion(
      id: Value(id),
      itineraryId: Value(itineraryId),
      section: Value(section),
      dedupeKey: Value(dedupeKey),
      content: Value(content),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isSynced: Value(isSynced),
    );
  }

  factory SavedItemRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SavedItemRow(
      id: serializer.fromJson<String>(json['id']),
      itineraryId: serializer.fromJson<String>(json['itineraryId']),
      section: serializer.fromJson<String>(json['section']),
      dedupeKey: serializer.fromJson<String>(json['dedupeKey']),
      content: serializer.fromJson<String>(json['content']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'itineraryId': serializer.toJson<String>(itineraryId),
      'section': serializer.toJson<String>(section),
      'dedupeKey': serializer.toJson<String>(dedupeKey),
      'content': serializer.toJson<String>(content),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  SavedItemRow copyWith({
    String? id,
    String? itineraryId,
    String? section,
    String? dedupeKey,
    String? content,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isSynced,
  }) => SavedItemRow(
    id: id ?? this.id,
    itineraryId: itineraryId ?? this.itineraryId,
    section: section ?? this.section,
    dedupeKey: dedupeKey ?? this.dedupeKey,
    content: content ?? this.content,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    isSynced: isSynced ?? this.isSynced,
  );
  SavedItemRow copyWithCompanion(SavedItemsCompanion data) {
    return SavedItemRow(
      id: data.id.present ? data.id.value : this.id,
      itineraryId: data.itineraryId.present
          ? data.itineraryId.value
          : this.itineraryId,
      section: data.section.present ? data.section.value : this.section,
      dedupeKey: data.dedupeKey.present ? data.dedupeKey.value : this.dedupeKey,
      content: data.content.present ? data.content.value : this.content,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SavedItemRow(')
          ..write('id: $id, ')
          ..write('itineraryId: $itineraryId, ')
          ..write('section: $section, ')
          ..write('dedupeKey: $dedupeKey, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    itineraryId,
    section,
    dedupeKey,
    content,
    createdAt,
    updatedAt,
    isSynced,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SavedItemRow &&
          other.id == this.id &&
          other.itineraryId == this.itineraryId &&
          other.section == this.section &&
          other.dedupeKey == this.dedupeKey &&
          other.content == this.content &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isSynced == this.isSynced);
}

class SavedItemsCompanion extends UpdateCompanion<SavedItemRow> {
  final Value<String> id;
  final Value<String> itineraryId;
  final Value<String> section;
  final Value<String> dedupeKey;
  final Value<String> content;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> isSynced;
  final Value<int> rowid;
  const SavedItemsCompanion({
    this.id = const Value.absent(),
    this.itineraryId = const Value.absent(),
    this.section = const Value.absent(),
    this.dedupeKey = const Value.absent(),
    this.content = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SavedItemsCompanion.insert({
    required String id,
    required String itineraryId,
    required String section,
    required String dedupeKey,
    required String content,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       itineraryId = Value(itineraryId),
       section = Value(section),
       dedupeKey = Value(dedupeKey),
       content = Value(content),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<SavedItemRow> custom({
    Expression<String>? id,
    Expression<String>? itineraryId,
    Expression<String>? section,
    Expression<String>? dedupeKey,
    Expression<String>? content,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isSynced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (itineraryId != null) 'itinerary_id': itineraryId,
      if (section != null) 'section': section,
      if (dedupeKey != null) 'dedupe_key': dedupeKey,
      if (content != null) 'content': content,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSynced != null) 'is_synced': isSynced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SavedItemsCompanion copyWith({
    Value<String>? id,
    Value<String>? itineraryId,
    Value<String>? section,
    Value<String>? dedupeKey,
    Value<String>? content,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<bool>? isSynced,
    Value<int>? rowid,
  }) {
    return SavedItemsCompanion(
      id: id ?? this.id,
      itineraryId: itineraryId ?? this.itineraryId,
      section: section ?? this.section,
      dedupeKey: dedupeKey ?? this.dedupeKey,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (itineraryId.present) {
      map['itinerary_id'] = Variable<String>(itineraryId.value);
    }
    if (section.present) {
      map['section'] = Variable<String>(section.value);
    }
    if (dedupeKey.present) {
      map['dedupe_key'] = Variable<String>(dedupeKey.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SavedItemsCompanion(')
          ..write('id: $id, ')
          ..write('itineraryId: $itineraryId, ')
          ..write('section: $section, ')
          ..write('dedupeKey: $dedupeKey, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SyncQueueTable extends SyncQueue
    with TableInfo<$SyncQueueTable, SyncQueueData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncQueueTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _operationMeta = const VerificationMeta(
    'operation',
  );
  @override
  late final GeneratedColumn<String> operation = GeneratedColumn<String>(
    'operation',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _payloadMeta = const VerificationMeta(
    'payload',
  );
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
    'payload',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    operation,
    payload,
    createdAt,
    status,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_queue';
  @override
  VerificationContext validateIntegrity(
    Insertable<SyncQueueData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('operation')) {
      context.handle(
        _operationMeta,
        operation.isAcceptableOrUnknown(data['operation']!, _operationMeta),
      );
    } else if (isInserting) {
      context.missing(_operationMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SyncQueueData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncQueueData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      operation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}operation'],
      )!,
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
    );
  }

  @override
  $SyncQueueTable createAlias(String alias) {
    return $SyncQueueTable(attachedDatabase, alias);
  }
}

class SyncQueueData extends DataClass implements Insertable<SyncQueueData> {
  final int id;
  final String operation;
  final String payload;
  final DateTime createdAt;
  final String status;
  const SyncQueueData({
    required this.id,
    required this.operation,
    required this.payload,
    required this.createdAt,
    required this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['operation'] = Variable<String>(operation);
    map['payload'] = Variable<String>(payload);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['status'] = Variable<String>(status);
    return map;
  }

  SyncQueueCompanion toCompanion(bool nullToAbsent) {
    return SyncQueueCompanion(
      id: Value(id),
      operation: Value(operation),
      payload: Value(payload),
      createdAt: Value(createdAt),
      status: Value(status),
    );
  }

  factory SyncQueueData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncQueueData(
      id: serializer.fromJson<int>(json['id']),
      operation: serializer.fromJson<String>(json['operation']),
      payload: serializer.fromJson<String>(json['payload']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'operation': serializer.toJson<String>(operation),
      'payload': serializer.toJson<String>(payload),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'status': serializer.toJson<String>(status),
    };
  }

  SyncQueueData copyWith({
    int? id,
    String? operation,
    String? payload,
    DateTime? createdAt,
    String? status,
  }) => SyncQueueData(
    id: id ?? this.id,
    operation: operation ?? this.operation,
    payload: payload ?? this.payload,
    createdAt: createdAt ?? this.createdAt,
    status: status ?? this.status,
  );
  SyncQueueData copyWithCompanion(SyncQueueCompanion data) {
    return SyncQueueData(
      id: data.id.present ? data.id.value : this.id,
      operation: data.operation.present ? data.operation.value : this.operation,
      payload: data.payload.present ? data.payload.value : this.payload,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueueData(')
          ..write('id: $id, ')
          ..write('operation: $operation, ')
          ..write('payload: $payload, ')
          ..write('createdAt: $createdAt, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, operation, payload, createdAt, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncQueueData &&
          other.id == this.id &&
          other.operation == this.operation &&
          other.payload == this.payload &&
          other.createdAt == this.createdAt &&
          other.status == this.status);
}

class SyncQueueCompanion extends UpdateCompanion<SyncQueueData> {
  final Value<int> id;
  final Value<String> operation;
  final Value<String> payload;
  final Value<DateTime> createdAt;
  final Value<String> status;
  const SyncQueueCompanion({
    this.id = const Value.absent(),
    this.operation = const Value.absent(),
    this.payload = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.status = const Value.absent(),
  });
  SyncQueueCompanion.insert({
    this.id = const Value.absent(),
    required String operation,
    required String payload,
    required DateTime createdAt,
    this.status = const Value.absent(),
  }) : operation = Value(operation),
       payload = Value(payload),
       createdAt = Value(createdAt);
  static Insertable<SyncQueueData> custom({
    Expression<int>? id,
    Expression<String>? operation,
    Expression<String>? payload,
    Expression<DateTime>? createdAt,
    Expression<String>? status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (operation != null) 'operation': operation,
      if (payload != null) 'payload': payload,
      if (createdAt != null) 'created_at': createdAt,
      if (status != null) 'status': status,
    });
  }

  SyncQueueCompanion copyWith({
    Value<int>? id,
    Value<String>? operation,
    Value<String>? payload,
    Value<DateTime>? createdAt,
    Value<String>? status,
  }) {
    return SyncQueueCompanion(
      id: id ?? this.id,
      operation: operation ?? this.operation,
      payload: payload ?? this.payload,
      createdAt: createdAt ?? this.createdAt,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (operation.present) {
      map['operation'] = Variable<String>(operation.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueueCompanion(')
          ..write('id: $id, ')
          ..write('operation: $operation, ')
          ..write('payload: $payload, ')
          ..write('createdAt: $createdAt, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class $TransportCacheTable extends TransportCache
    with TableInfo<$TransportCacheTable, TransportCacheRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransportCacheTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
    'data',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _expiresAtMeta = const VerificationMeta(
    'expiresAt',
  );
  @override
  late final GeneratedColumn<DateTime> expiresAt = GeneratedColumn<DateTime>(
    'expires_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [key, data, createdAt, expiresAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transport_cache';
  @override
  VerificationContext validateIntegrity(
    Insertable<TransportCacheRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('data')) {
      context.handle(
        _dataMeta,
        this.data.isAcceptableOrUnknown(data['data']!, _dataMeta),
      );
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('expires_at')) {
      context.handle(
        _expiresAtMeta,
        expiresAt.isAcceptableOrUnknown(data['expires_at']!, _expiresAtMeta),
      );
    } else if (isInserting) {
      context.missing(_expiresAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  TransportCacheRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransportCacheRow(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      data: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}data'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      expiresAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}expires_at'],
      )!,
    );
  }

  @override
  $TransportCacheTable createAlias(String alias) {
    return $TransportCacheTable(attachedDatabase, alias);
  }
}

class TransportCacheRow extends DataClass
    implements Insertable<TransportCacheRow> {
  final String key;
  final String data;
  final DateTime createdAt;
  final DateTime expiresAt;
  const TransportCacheRow({
    required this.key,
    required this.data,
    required this.createdAt,
    required this.expiresAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['data'] = Variable<String>(data);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['expires_at'] = Variable<DateTime>(expiresAt);
    return map;
  }

  TransportCacheCompanion toCompanion(bool nullToAbsent) {
    return TransportCacheCompanion(
      key: Value(key),
      data: Value(data),
      createdAt: Value(createdAt),
      expiresAt: Value(expiresAt),
    );
  }

  factory TransportCacheRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransportCacheRow(
      key: serializer.fromJson<String>(json['key']),
      data: serializer.fromJson<String>(json['data']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      expiresAt: serializer.fromJson<DateTime>(json['expiresAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'data': serializer.toJson<String>(data),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'expiresAt': serializer.toJson<DateTime>(expiresAt),
    };
  }

  TransportCacheRow copyWith({
    String? key,
    String? data,
    DateTime? createdAt,
    DateTime? expiresAt,
  }) => TransportCacheRow(
    key: key ?? this.key,
    data: data ?? this.data,
    createdAt: createdAt ?? this.createdAt,
    expiresAt: expiresAt ?? this.expiresAt,
  );
  TransportCacheRow copyWithCompanion(TransportCacheCompanion data) {
    return TransportCacheRow(
      key: data.key.present ? data.key.value : this.key,
      data: data.data.present ? data.data.value : this.data,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      expiresAt: data.expiresAt.present ? data.expiresAt.value : this.expiresAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransportCacheRow(')
          ..write('key: $key, ')
          ..write('data: $data, ')
          ..write('createdAt: $createdAt, ')
          ..write('expiresAt: $expiresAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, data, createdAt, expiresAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransportCacheRow &&
          other.key == this.key &&
          other.data == this.data &&
          other.createdAt == this.createdAt &&
          other.expiresAt == this.expiresAt);
}

class TransportCacheCompanion extends UpdateCompanion<TransportCacheRow> {
  final Value<String> key;
  final Value<String> data;
  final Value<DateTime> createdAt;
  final Value<DateTime> expiresAt;
  final Value<int> rowid;
  const TransportCacheCompanion({
    this.key = const Value.absent(),
    this.data = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.expiresAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TransportCacheCompanion.insert({
    required String key,
    required String data,
    required DateTime createdAt,
    required DateTime expiresAt,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       data = Value(data),
       createdAt = Value(createdAt),
       expiresAt = Value(expiresAt);
  static Insertable<TransportCacheRow> custom({
    Expression<String>? key,
    Expression<String>? data,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? expiresAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (data != null) 'data': data,
      if (createdAt != null) 'created_at': createdAt,
      if (expiresAt != null) 'expires_at': expiresAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TransportCacheCompanion copyWith({
    Value<String>? key,
    Value<String>? data,
    Value<DateTime>? createdAt,
    Value<DateTime>? expiresAt,
    Value<int>? rowid,
  }) {
    return TransportCacheCompanion(
      key: key ?? this.key,
      data: data ?? this.data,
      createdAt: createdAt ?? this.createdAt,
      expiresAt: expiresAt ?? this.expiresAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (data.present) {
      map['data'] = Variable<String>(data.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (expiresAt.present) {
      map['expires_at'] = Variable<DateTime>(expiresAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransportCacheCompanion(')
          ..write('key: $key, ')
          ..write('data: $data, ')
          ..write('createdAt: $createdAt, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CalendarCacheTable extends CalendarCache
    with TableInfo<$CalendarCacheTable, CalendarCacheRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CalendarCacheTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
    'data',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _expiresAtMeta = const VerificationMeta(
    'expiresAt',
  );
  @override
  late final GeneratedColumn<DateTime> expiresAt = GeneratedColumn<DateTime>(
    'expires_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [key, data, expiresAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'calendar_cache';
  @override
  VerificationContext validateIntegrity(
    Insertable<CalendarCacheRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('data')) {
      context.handle(
        _dataMeta,
        this.data.isAcceptableOrUnknown(data['data']!, _dataMeta),
      );
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    if (data.containsKey('expires_at')) {
      context.handle(
        _expiresAtMeta,
        expiresAt.isAcceptableOrUnknown(data['expires_at']!, _expiresAtMeta),
      );
    } else if (isInserting) {
      context.missing(_expiresAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  CalendarCacheRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CalendarCacheRow(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      data: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}data'],
      )!,
      expiresAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}expires_at'],
      )!,
    );
  }

  @override
  $CalendarCacheTable createAlias(String alias) {
    return $CalendarCacheTable(attachedDatabase, alias);
  }
}

class CalendarCacheRow extends DataClass
    implements Insertable<CalendarCacheRow> {
  final String key;
  final String data;
  final DateTime expiresAt;
  const CalendarCacheRow({
    required this.key,
    required this.data,
    required this.expiresAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['data'] = Variable<String>(data);
    map['expires_at'] = Variable<DateTime>(expiresAt);
    return map;
  }

  CalendarCacheCompanion toCompanion(bool nullToAbsent) {
    return CalendarCacheCompanion(
      key: Value(key),
      data: Value(data),
      expiresAt: Value(expiresAt),
    );
  }

  factory CalendarCacheRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CalendarCacheRow(
      key: serializer.fromJson<String>(json['key']),
      data: serializer.fromJson<String>(json['data']),
      expiresAt: serializer.fromJson<DateTime>(json['expiresAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'data': serializer.toJson<String>(data),
      'expiresAt': serializer.toJson<DateTime>(expiresAt),
    };
  }

  CalendarCacheRow copyWith({String? key, String? data, DateTime? expiresAt}) =>
      CalendarCacheRow(
        key: key ?? this.key,
        data: data ?? this.data,
        expiresAt: expiresAt ?? this.expiresAt,
      );
  CalendarCacheRow copyWithCompanion(CalendarCacheCompanion data) {
    return CalendarCacheRow(
      key: data.key.present ? data.key.value : this.key,
      data: data.data.present ? data.data.value : this.data,
      expiresAt: data.expiresAt.present ? data.expiresAt.value : this.expiresAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CalendarCacheRow(')
          ..write('key: $key, ')
          ..write('data: $data, ')
          ..write('expiresAt: $expiresAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, data, expiresAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CalendarCacheRow &&
          other.key == this.key &&
          other.data == this.data &&
          other.expiresAt == this.expiresAt);
}

class CalendarCacheCompanion extends UpdateCompanion<CalendarCacheRow> {
  final Value<String> key;
  final Value<String> data;
  final Value<DateTime> expiresAt;
  final Value<int> rowid;
  const CalendarCacheCompanion({
    this.key = const Value.absent(),
    this.data = const Value.absent(),
    this.expiresAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CalendarCacheCompanion.insert({
    required String key,
    required String data,
    required DateTime expiresAt,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       data = Value(data),
       expiresAt = Value(expiresAt);
  static Insertable<CalendarCacheRow> custom({
    Expression<String>? key,
    Expression<String>? data,
    Expression<DateTime>? expiresAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (data != null) 'data': data,
      if (expiresAt != null) 'expires_at': expiresAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CalendarCacheCompanion copyWith({
    Value<String>? key,
    Value<String>? data,
    Value<DateTime>? expiresAt,
    Value<int>? rowid,
  }) {
    return CalendarCacheCompanion(
      key: key ?? this.key,
      data: data ?? this.data,
      expiresAt: expiresAt ?? this.expiresAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (data.present) {
      map['data'] = Variable<String>(data.value);
    }
    if (expiresAt.present) {
      map['expires_at'] = Variable<DateTime>(expiresAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CalendarCacheCompanion(')
          ..write('key: $key, ')
          ..write('data: $data, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AccommodationCacheTable extends AccommodationCache
    with TableInfo<$AccommodationCacheTable, AccommodationCacheRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AccommodationCacheTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _itineraryIdMeta = const VerificationMeta(
    'itineraryId',
  );
  @override
  late final GeneratedColumn<String> itineraryId = GeneratedColumn<String>(
    'itinerary_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
    'data',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _expiresAtMeta = const VerificationMeta(
    'expiresAt',
  );
  @override
  late final GeneratedColumn<DateTime> expiresAt = GeneratedColumn<DateTime>(
    'expires_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    key,
    itineraryId,
    data,
    createdAt,
    expiresAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'accommodation_cache';
  @override
  VerificationContext validateIntegrity(
    Insertable<AccommodationCacheRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('itinerary_id')) {
      context.handle(
        _itineraryIdMeta,
        itineraryId.isAcceptableOrUnknown(
          data['itinerary_id']!,
          _itineraryIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_itineraryIdMeta);
    }
    if (data.containsKey('data')) {
      context.handle(
        _dataMeta,
        this.data.isAcceptableOrUnknown(data['data']!, _dataMeta),
      );
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('expires_at')) {
      context.handle(
        _expiresAtMeta,
        expiresAt.isAcceptableOrUnknown(data['expires_at']!, _expiresAtMeta),
      );
    } else if (isInserting) {
      context.missing(_expiresAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  AccommodationCacheRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AccommodationCacheRow(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      itineraryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}itinerary_id'],
      )!,
      data: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}data'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      expiresAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}expires_at'],
      )!,
    );
  }

  @override
  $AccommodationCacheTable createAlias(String alias) {
    return $AccommodationCacheTable(attachedDatabase, alias);
  }
}

class AccommodationCacheRow extends DataClass
    implements Insertable<AccommodationCacheRow> {
  final String key;
  final String itineraryId;
  final String data;
  final DateTime createdAt;
  final DateTime expiresAt;
  const AccommodationCacheRow({
    required this.key,
    required this.itineraryId,
    required this.data,
    required this.createdAt,
    required this.expiresAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['itinerary_id'] = Variable<String>(itineraryId);
    map['data'] = Variable<String>(data);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['expires_at'] = Variable<DateTime>(expiresAt);
    return map;
  }

  AccommodationCacheCompanion toCompanion(bool nullToAbsent) {
    return AccommodationCacheCompanion(
      key: Value(key),
      itineraryId: Value(itineraryId),
      data: Value(data),
      createdAt: Value(createdAt),
      expiresAt: Value(expiresAt),
    );
  }

  factory AccommodationCacheRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AccommodationCacheRow(
      key: serializer.fromJson<String>(json['key']),
      itineraryId: serializer.fromJson<String>(json['itineraryId']),
      data: serializer.fromJson<String>(json['data']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      expiresAt: serializer.fromJson<DateTime>(json['expiresAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'itineraryId': serializer.toJson<String>(itineraryId),
      'data': serializer.toJson<String>(data),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'expiresAt': serializer.toJson<DateTime>(expiresAt),
    };
  }

  AccommodationCacheRow copyWith({
    String? key,
    String? itineraryId,
    String? data,
    DateTime? createdAt,
    DateTime? expiresAt,
  }) => AccommodationCacheRow(
    key: key ?? this.key,
    itineraryId: itineraryId ?? this.itineraryId,
    data: data ?? this.data,
    createdAt: createdAt ?? this.createdAt,
    expiresAt: expiresAt ?? this.expiresAt,
  );
  AccommodationCacheRow copyWithCompanion(AccommodationCacheCompanion data) {
    return AccommodationCacheRow(
      key: data.key.present ? data.key.value : this.key,
      itineraryId: data.itineraryId.present
          ? data.itineraryId.value
          : this.itineraryId,
      data: data.data.present ? data.data.value : this.data,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      expiresAt: data.expiresAt.present ? data.expiresAt.value : this.expiresAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AccommodationCacheRow(')
          ..write('key: $key, ')
          ..write('itineraryId: $itineraryId, ')
          ..write('data: $data, ')
          ..write('createdAt: $createdAt, ')
          ..write('expiresAt: $expiresAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, itineraryId, data, createdAt, expiresAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AccommodationCacheRow &&
          other.key == this.key &&
          other.itineraryId == this.itineraryId &&
          other.data == this.data &&
          other.createdAt == this.createdAt &&
          other.expiresAt == this.expiresAt);
}

class AccommodationCacheCompanion
    extends UpdateCompanion<AccommodationCacheRow> {
  final Value<String> key;
  final Value<String> itineraryId;
  final Value<String> data;
  final Value<DateTime> createdAt;
  final Value<DateTime> expiresAt;
  final Value<int> rowid;
  const AccommodationCacheCompanion({
    this.key = const Value.absent(),
    this.itineraryId = const Value.absent(),
    this.data = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.expiresAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AccommodationCacheCompanion.insert({
    required String key,
    required String itineraryId,
    required String data,
    required DateTime createdAt,
    required DateTime expiresAt,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       itineraryId = Value(itineraryId),
       data = Value(data),
       createdAt = Value(createdAt),
       expiresAt = Value(expiresAt);
  static Insertable<AccommodationCacheRow> custom({
    Expression<String>? key,
    Expression<String>? itineraryId,
    Expression<String>? data,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? expiresAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (itineraryId != null) 'itinerary_id': itineraryId,
      if (data != null) 'data': data,
      if (createdAt != null) 'created_at': createdAt,
      if (expiresAt != null) 'expires_at': expiresAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AccommodationCacheCompanion copyWith({
    Value<String>? key,
    Value<String>? itineraryId,
    Value<String>? data,
    Value<DateTime>? createdAt,
    Value<DateTime>? expiresAt,
    Value<int>? rowid,
  }) {
    return AccommodationCacheCompanion(
      key: key ?? this.key,
      itineraryId: itineraryId ?? this.itineraryId,
      data: data ?? this.data,
      createdAt: createdAt ?? this.createdAt,
      expiresAt: expiresAt ?? this.expiresAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (itineraryId.present) {
      map['itinerary_id'] = Variable<String>(itineraryId.value);
    }
    if (data.present) {
      map['data'] = Variable<String>(data.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (expiresAt.present) {
      map['expires_at'] = Variable<DateTime>(expiresAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccommodationCacheCompanion(')
          ..write('key: $key, ')
          ..write('itineraryId: $itineraryId, ')
          ..write('data: $data, ')
          ..write('createdAt: $createdAt, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PropertyDetailCacheTable extends PropertyDetailCache
    with TableInfo<$PropertyDetailCacheTable, PropertyDetailCacheRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PropertyDetailCacheTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _propertyIdMeta = const VerificationMeta(
    'propertyId',
  );
  @override
  late final GeneratedColumn<String> propertyId = GeneratedColumn<String>(
    'property_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
    'data',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _expiresAtMeta = const VerificationMeta(
    'expiresAt',
  );
  @override
  late final GeneratedColumn<DateTime> expiresAt = GeneratedColumn<DateTime>(
    'expires_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [propertyId, data, expiresAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'property_detail_cache';
  @override
  VerificationContext validateIntegrity(
    Insertable<PropertyDetailCacheRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('property_id')) {
      context.handle(
        _propertyIdMeta,
        propertyId.isAcceptableOrUnknown(data['property_id']!, _propertyIdMeta),
      );
    } else if (isInserting) {
      context.missing(_propertyIdMeta);
    }
    if (data.containsKey('data')) {
      context.handle(
        _dataMeta,
        this.data.isAcceptableOrUnknown(data['data']!, _dataMeta),
      );
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    if (data.containsKey('expires_at')) {
      context.handle(
        _expiresAtMeta,
        expiresAt.isAcceptableOrUnknown(data['expires_at']!, _expiresAtMeta),
      );
    } else if (isInserting) {
      context.missing(_expiresAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {propertyId};
  @override
  PropertyDetailCacheRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PropertyDetailCacheRow(
      propertyId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}property_id'],
      )!,
      data: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}data'],
      )!,
      expiresAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}expires_at'],
      )!,
    );
  }

  @override
  $PropertyDetailCacheTable createAlias(String alias) {
    return $PropertyDetailCacheTable(attachedDatabase, alias);
  }
}

class PropertyDetailCacheRow extends DataClass
    implements Insertable<PropertyDetailCacheRow> {
  final String propertyId;
  final String data;
  final DateTime expiresAt;
  const PropertyDetailCacheRow({
    required this.propertyId,
    required this.data,
    required this.expiresAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['property_id'] = Variable<String>(propertyId);
    map['data'] = Variable<String>(data);
    map['expires_at'] = Variable<DateTime>(expiresAt);
    return map;
  }

  PropertyDetailCacheCompanion toCompanion(bool nullToAbsent) {
    return PropertyDetailCacheCompanion(
      propertyId: Value(propertyId),
      data: Value(data),
      expiresAt: Value(expiresAt),
    );
  }

  factory PropertyDetailCacheRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PropertyDetailCacheRow(
      propertyId: serializer.fromJson<String>(json['propertyId']),
      data: serializer.fromJson<String>(json['data']),
      expiresAt: serializer.fromJson<DateTime>(json['expiresAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'propertyId': serializer.toJson<String>(propertyId),
      'data': serializer.toJson<String>(data),
      'expiresAt': serializer.toJson<DateTime>(expiresAt),
    };
  }

  PropertyDetailCacheRow copyWith({
    String? propertyId,
    String? data,
    DateTime? expiresAt,
  }) => PropertyDetailCacheRow(
    propertyId: propertyId ?? this.propertyId,
    data: data ?? this.data,
    expiresAt: expiresAt ?? this.expiresAt,
  );
  PropertyDetailCacheRow copyWithCompanion(PropertyDetailCacheCompanion data) {
    return PropertyDetailCacheRow(
      propertyId: data.propertyId.present
          ? data.propertyId.value
          : this.propertyId,
      data: data.data.present ? data.data.value : this.data,
      expiresAt: data.expiresAt.present ? data.expiresAt.value : this.expiresAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PropertyDetailCacheRow(')
          ..write('propertyId: $propertyId, ')
          ..write('data: $data, ')
          ..write('expiresAt: $expiresAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(propertyId, data, expiresAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PropertyDetailCacheRow &&
          other.propertyId == this.propertyId &&
          other.data == this.data &&
          other.expiresAt == this.expiresAt);
}

class PropertyDetailCacheCompanion
    extends UpdateCompanion<PropertyDetailCacheRow> {
  final Value<String> propertyId;
  final Value<String> data;
  final Value<DateTime> expiresAt;
  final Value<int> rowid;
  const PropertyDetailCacheCompanion({
    this.propertyId = const Value.absent(),
    this.data = const Value.absent(),
    this.expiresAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PropertyDetailCacheCompanion.insert({
    required String propertyId,
    required String data,
    required DateTime expiresAt,
    this.rowid = const Value.absent(),
  }) : propertyId = Value(propertyId),
       data = Value(data),
       expiresAt = Value(expiresAt);
  static Insertable<PropertyDetailCacheRow> custom({
    Expression<String>? propertyId,
    Expression<String>? data,
    Expression<DateTime>? expiresAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (propertyId != null) 'property_id': propertyId,
      if (data != null) 'data': data,
      if (expiresAt != null) 'expires_at': expiresAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PropertyDetailCacheCompanion copyWith({
    Value<String>? propertyId,
    Value<String>? data,
    Value<DateTime>? expiresAt,
    Value<int>? rowid,
  }) {
    return PropertyDetailCacheCompanion(
      propertyId: propertyId ?? this.propertyId,
      data: data ?? this.data,
      expiresAt: expiresAt ?? this.expiresAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (propertyId.present) {
      map['property_id'] = Variable<String>(propertyId.value);
    }
    if (data.present) {
      map['data'] = Variable<String>(data.value);
    }
    if (expiresAt.present) {
      map['expires_at'] = Variable<DateTime>(expiresAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PropertyDetailCacheCompanion(')
          ..write('propertyId: $propertyId, ')
          ..write('data: $data, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EntertainmentCacheTable extends EntertainmentCache
    with TableInfo<$EntertainmentCacheTable, EntertainmentCacheRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EntertainmentCacheTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _itineraryIdMeta = const VerificationMeta(
    'itineraryId',
  );
  @override
  late final GeneratedColumn<String> itineraryId = GeneratedColumn<String>(
    'itinerary_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
    'data',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _expiresAtMeta = const VerificationMeta(
    'expiresAt',
  );
  @override
  late final GeneratedColumn<DateTime> expiresAt = GeneratedColumn<DateTime>(
    'expires_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    key,
    itineraryId,
    data,
    createdAt,
    expiresAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'entertainment_cache';
  @override
  VerificationContext validateIntegrity(
    Insertable<EntertainmentCacheRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('itinerary_id')) {
      context.handle(
        _itineraryIdMeta,
        itineraryId.isAcceptableOrUnknown(
          data['itinerary_id']!,
          _itineraryIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_itineraryIdMeta);
    }
    if (data.containsKey('data')) {
      context.handle(
        _dataMeta,
        this.data.isAcceptableOrUnknown(data['data']!, _dataMeta),
      );
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('expires_at')) {
      context.handle(
        _expiresAtMeta,
        expiresAt.isAcceptableOrUnknown(data['expires_at']!, _expiresAtMeta),
      );
    } else if (isInserting) {
      context.missing(_expiresAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  EntertainmentCacheRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EntertainmentCacheRow(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      itineraryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}itinerary_id'],
      )!,
      data: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}data'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      expiresAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}expires_at'],
      )!,
    );
  }

  @override
  $EntertainmentCacheTable createAlias(String alias) {
    return $EntertainmentCacheTable(attachedDatabase, alias);
  }
}

class EntertainmentCacheRow extends DataClass
    implements Insertable<EntertainmentCacheRow> {
  final String key;
  final String itineraryId;
  final String data;
  final DateTime createdAt;
  final DateTime expiresAt;
  const EntertainmentCacheRow({
    required this.key,
    required this.itineraryId,
    required this.data,
    required this.createdAt,
    required this.expiresAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['itinerary_id'] = Variable<String>(itineraryId);
    map['data'] = Variable<String>(data);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['expires_at'] = Variable<DateTime>(expiresAt);
    return map;
  }

  EntertainmentCacheCompanion toCompanion(bool nullToAbsent) {
    return EntertainmentCacheCompanion(
      key: Value(key),
      itineraryId: Value(itineraryId),
      data: Value(data),
      createdAt: Value(createdAt),
      expiresAt: Value(expiresAt),
    );
  }

  factory EntertainmentCacheRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EntertainmentCacheRow(
      key: serializer.fromJson<String>(json['key']),
      itineraryId: serializer.fromJson<String>(json['itineraryId']),
      data: serializer.fromJson<String>(json['data']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      expiresAt: serializer.fromJson<DateTime>(json['expiresAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'itineraryId': serializer.toJson<String>(itineraryId),
      'data': serializer.toJson<String>(data),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'expiresAt': serializer.toJson<DateTime>(expiresAt),
    };
  }

  EntertainmentCacheRow copyWith({
    String? key,
    String? itineraryId,
    String? data,
    DateTime? createdAt,
    DateTime? expiresAt,
  }) => EntertainmentCacheRow(
    key: key ?? this.key,
    itineraryId: itineraryId ?? this.itineraryId,
    data: data ?? this.data,
    createdAt: createdAt ?? this.createdAt,
    expiresAt: expiresAt ?? this.expiresAt,
  );
  EntertainmentCacheRow copyWithCompanion(EntertainmentCacheCompanion data) {
    return EntertainmentCacheRow(
      key: data.key.present ? data.key.value : this.key,
      itineraryId: data.itineraryId.present
          ? data.itineraryId.value
          : this.itineraryId,
      data: data.data.present ? data.data.value : this.data,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      expiresAt: data.expiresAt.present ? data.expiresAt.value : this.expiresAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EntertainmentCacheRow(')
          ..write('key: $key, ')
          ..write('itineraryId: $itineraryId, ')
          ..write('data: $data, ')
          ..write('createdAt: $createdAt, ')
          ..write('expiresAt: $expiresAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, itineraryId, data, createdAt, expiresAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EntertainmentCacheRow &&
          other.key == this.key &&
          other.itineraryId == this.itineraryId &&
          other.data == this.data &&
          other.createdAt == this.createdAt &&
          other.expiresAt == this.expiresAt);
}

class EntertainmentCacheCompanion
    extends UpdateCompanion<EntertainmentCacheRow> {
  final Value<String> key;
  final Value<String> itineraryId;
  final Value<String> data;
  final Value<DateTime> createdAt;
  final Value<DateTime> expiresAt;
  final Value<int> rowid;
  const EntertainmentCacheCompanion({
    this.key = const Value.absent(),
    this.itineraryId = const Value.absent(),
    this.data = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.expiresAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EntertainmentCacheCompanion.insert({
    required String key,
    required String itineraryId,
    required String data,
    required DateTime createdAt,
    required DateTime expiresAt,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       itineraryId = Value(itineraryId),
       data = Value(data),
       createdAt = Value(createdAt),
       expiresAt = Value(expiresAt);
  static Insertable<EntertainmentCacheRow> custom({
    Expression<String>? key,
    Expression<String>? itineraryId,
    Expression<String>? data,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? expiresAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (itineraryId != null) 'itinerary_id': itineraryId,
      if (data != null) 'data': data,
      if (createdAt != null) 'created_at': createdAt,
      if (expiresAt != null) 'expires_at': expiresAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EntertainmentCacheCompanion copyWith({
    Value<String>? key,
    Value<String>? itineraryId,
    Value<String>? data,
    Value<DateTime>? createdAt,
    Value<DateTime>? expiresAt,
    Value<int>? rowid,
  }) {
    return EntertainmentCacheCompanion(
      key: key ?? this.key,
      itineraryId: itineraryId ?? this.itineraryId,
      data: data ?? this.data,
      createdAt: createdAt ?? this.createdAt,
      expiresAt: expiresAt ?? this.expiresAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (itineraryId.present) {
      map['itinerary_id'] = Variable<String>(itineraryId.value);
    }
    if (data.present) {
      map['data'] = Variable<String>(data.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (expiresAt.present) {
      map['expires_at'] = Variable<DateTime>(expiresAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EntertainmentCacheCompanion(')
          ..write('key: $key, ')
          ..write('itineraryId: $itineraryId, ')
          ..write('data: $data, ')
          ..write('createdAt: $createdAt, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $GastronomyCacheTable extends GastronomyCache
    with TableInfo<$GastronomyCacheTable, GastronomyCacheRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GastronomyCacheTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _itineraryIdMeta = const VerificationMeta(
    'itineraryId',
  );
  @override
  late final GeneratedColumn<String> itineraryId = GeneratedColumn<String>(
    'itinerary_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
    'data',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _expiresAtMeta = const VerificationMeta(
    'expiresAt',
  );
  @override
  late final GeneratedColumn<DateTime> expiresAt = GeneratedColumn<DateTime>(
    'expires_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    key,
    itineraryId,
    data,
    createdAt,
    expiresAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'gastronomy_cache';
  @override
  VerificationContext validateIntegrity(
    Insertable<GastronomyCacheRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('itinerary_id')) {
      context.handle(
        _itineraryIdMeta,
        itineraryId.isAcceptableOrUnknown(
          data['itinerary_id']!,
          _itineraryIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_itineraryIdMeta);
    }
    if (data.containsKey('data')) {
      context.handle(
        _dataMeta,
        this.data.isAcceptableOrUnknown(data['data']!, _dataMeta),
      );
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('expires_at')) {
      context.handle(
        _expiresAtMeta,
        expiresAt.isAcceptableOrUnknown(data['expires_at']!, _expiresAtMeta),
      );
    } else if (isInserting) {
      context.missing(_expiresAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  GastronomyCacheRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GastronomyCacheRow(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      itineraryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}itinerary_id'],
      )!,
      data: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}data'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      expiresAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}expires_at'],
      )!,
    );
  }

  @override
  $GastronomyCacheTable createAlias(String alias) {
    return $GastronomyCacheTable(attachedDatabase, alias);
  }
}

class GastronomyCacheRow extends DataClass
    implements Insertable<GastronomyCacheRow> {
  final String key;
  final String itineraryId;
  final String data;
  final DateTime createdAt;
  final DateTime expiresAt;
  const GastronomyCacheRow({
    required this.key,
    required this.itineraryId,
    required this.data,
    required this.createdAt,
    required this.expiresAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['itinerary_id'] = Variable<String>(itineraryId);
    map['data'] = Variable<String>(data);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['expires_at'] = Variable<DateTime>(expiresAt);
    return map;
  }

  GastronomyCacheCompanion toCompanion(bool nullToAbsent) {
    return GastronomyCacheCompanion(
      key: Value(key),
      itineraryId: Value(itineraryId),
      data: Value(data),
      createdAt: Value(createdAt),
      expiresAt: Value(expiresAt),
    );
  }

  factory GastronomyCacheRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GastronomyCacheRow(
      key: serializer.fromJson<String>(json['key']),
      itineraryId: serializer.fromJson<String>(json['itineraryId']),
      data: serializer.fromJson<String>(json['data']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      expiresAt: serializer.fromJson<DateTime>(json['expiresAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'itineraryId': serializer.toJson<String>(itineraryId),
      'data': serializer.toJson<String>(data),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'expiresAt': serializer.toJson<DateTime>(expiresAt),
    };
  }

  GastronomyCacheRow copyWith({
    String? key,
    String? itineraryId,
    String? data,
    DateTime? createdAt,
    DateTime? expiresAt,
  }) => GastronomyCacheRow(
    key: key ?? this.key,
    itineraryId: itineraryId ?? this.itineraryId,
    data: data ?? this.data,
    createdAt: createdAt ?? this.createdAt,
    expiresAt: expiresAt ?? this.expiresAt,
  );
  GastronomyCacheRow copyWithCompanion(GastronomyCacheCompanion data) {
    return GastronomyCacheRow(
      key: data.key.present ? data.key.value : this.key,
      itineraryId: data.itineraryId.present
          ? data.itineraryId.value
          : this.itineraryId,
      data: data.data.present ? data.data.value : this.data,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      expiresAt: data.expiresAt.present ? data.expiresAt.value : this.expiresAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GastronomyCacheRow(')
          ..write('key: $key, ')
          ..write('itineraryId: $itineraryId, ')
          ..write('data: $data, ')
          ..write('createdAt: $createdAt, ')
          ..write('expiresAt: $expiresAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, itineraryId, data, createdAt, expiresAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GastronomyCacheRow &&
          other.key == this.key &&
          other.itineraryId == this.itineraryId &&
          other.data == this.data &&
          other.createdAt == this.createdAt &&
          other.expiresAt == this.expiresAt);
}

class GastronomyCacheCompanion extends UpdateCompanion<GastronomyCacheRow> {
  final Value<String> key;
  final Value<String> itineraryId;
  final Value<String> data;
  final Value<DateTime> createdAt;
  final Value<DateTime> expiresAt;
  final Value<int> rowid;
  const GastronomyCacheCompanion({
    this.key = const Value.absent(),
    this.itineraryId = const Value.absent(),
    this.data = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.expiresAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GastronomyCacheCompanion.insert({
    required String key,
    required String itineraryId,
    required String data,
    required DateTime createdAt,
    required DateTime expiresAt,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       itineraryId = Value(itineraryId),
       data = Value(data),
       createdAt = Value(createdAt),
       expiresAt = Value(expiresAt);
  static Insertable<GastronomyCacheRow> custom({
    Expression<String>? key,
    Expression<String>? itineraryId,
    Expression<String>? data,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? expiresAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (itineraryId != null) 'itinerary_id': itineraryId,
      if (data != null) 'data': data,
      if (createdAt != null) 'created_at': createdAt,
      if (expiresAt != null) 'expires_at': expiresAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GastronomyCacheCompanion copyWith({
    Value<String>? key,
    Value<String>? itineraryId,
    Value<String>? data,
    Value<DateTime>? createdAt,
    Value<DateTime>? expiresAt,
    Value<int>? rowid,
  }) {
    return GastronomyCacheCompanion(
      key: key ?? this.key,
      itineraryId: itineraryId ?? this.itineraryId,
      data: data ?? this.data,
      createdAt: createdAt ?? this.createdAt,
      expiresAt: expiresAt ?? this.expiresAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (itineraryId.present) {
      map['itinerary_id'] = Variable<String>(itineraryId.value);
    }
    if (data.present) {
      map['data'] = Variable<String>(data.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (expiresAt.present) {
      map['expires_at'] = Variable<DateTime>(expiresAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GastronomyCacheCompanion(')
          ..write('key: $key, ')
          ..write('itineraryId: $itineraryId, ')
          ..write('data: $data, ')
          ..write('createdAt: $createdAt, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EventsCacheTable extends EventsCache
    with TableInfo<$EventsCacheTable, EventsCacheRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EventsCacheTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _itineraryIdMeta = const VerificationMeta(
    'itineraryId',
  );
  @override
  late final GeneratedColumn<String> itineraryId = GeneratedColumn<String>(
    'itinerary_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
    'data',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _expiresAtMeta = const VerificationMeta(
    'expiresAt',
  );
  @override
  late final GeneratedColumn<DateTime> expiresAt = GeneratedColumn<DateTime>(
    'expires_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    key,
    itineraryId,
    data,
    createdAt,
    expiresAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'events_cache';
  @override
  VerificationContext validateIntegrity(
    Insertable<EventsCacheRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('itinerary_id')) {
      context.handle(
        _itineraryIdMeta,
        itineraryId.isAcceptableOrUnknown(
          data['itinerary_id']!,
          _itineraryIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_itineraryIdMeta);
    }
    if (data.containsKey('data')) {
      context.handle(
        _dataMeta,
        this.data.isAcceptableOrUnknown(data['data']!, _dataMeta),
      );
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('expires_at')) {
      context.handle(
        _expiresAtMeta,
        expiresAt.isAcceptableOrUnknown(data['expires_at']!, _expiresAtMeta),
      );
    } else if (isInserting) {
      context.missing(_expiresAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  EventsCacheRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EventsCacheRow(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      itineraryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}itinerary_id'],
      )!,
      data: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}data'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      expiresAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}expires_at'],
      )!,
    );
  }

  @override
  $EventsCacheTable createAlias(String alias) {
    return $EventsCacheTable(attachedDatabase, alias);
  }
}

class EventsCacheRow extends DataClass implements Insertable<EventsCacheRow> {
  final String key;
  final String itineraryId;
  final String data;
  final DateTime createdAt;
  final DateTime expiresAt;
  const EventsCacheRow({
    required this.key,
    required this.itineraryId,
    required this.data,
    required this.createdAt,
    required this.expiresAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['itinerary_id'] = Variable<String>(itineraryId);
    map['data'] = Variable<String>(data);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['expires_at'] = Variable<DateTime>(expiresAt);
    return map;
  }

  EventsCacheCompanion toCompanion(bool nullToAbsent) {
    return EventsCacheCompanion(
      key: Value(key),
      itineraryId: Value(itineraryId),
      data: Value(data),
      createdAt: Value(createdAt),
      expiresAt: Value(expiresAt),
    );
  }

  factory EventsCacheRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EventsCacheRow(
      key: serializer.fromJson<String>(json['key']),
      itineraryId: serializer.fromJson<String>(json['itineraryId']),
      data: serializer.fromJson<String>(json['data']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      expiresAt: serializer.fromJson<DateTime>(json['expiresAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'itineraryId': serializer.toJson<String>(itineraryId),
      'data': serializer.toJson<String>(data),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'expiresAt': serializer.toJson<DateTime>(expiresAt),
    };
  }

  EventsCacheRow copyWith({
    String? key,
    String? itineraryId,
    String? data,
    DateTime? createdAt,
    DateTime? expiresAt,
  }) => EventsCacheRow(
    key: key ?? this.key,
    itineraryId: itineraryId ?? this.itineraryId,
    data: data ?? this.data,
    createdAt: createdAt ?? this.createdAt,
    expiresAt: expiresAt ?? this.expiresAt,
  );
  EventsCacheRow copyWithCompanion(EventsCacheCompanion data) {
    return EventsCacheRow(
      key: data.key.present ? data.key.value : this.key,
      itineraryId: data.itineraryId.present
          ? data.itineraryId.value
          : this.itineraryId,
      data: data.data.present ? data.data.value : this.data,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      expiresAt: data.expiresAt.present ? data.expiresAt.value : this.expiresAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EventsCacheRow(')
          ..write('key: $key, ')
          ..write('itineraryId: $itineraryId, ')
          ..write('data: $data, ')
          ..write('createdAt: $createdAt, ')
          ..write('expiresAt: $expiresAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, itineraryId, data, createdAt, expiresAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EventsCacheRow &&
          other.key == this.key &&
          other.itineraryId == this.itineraryId &&
          other.data == this.data &&
          other.createdAt == this.createdAt &&
          other.expiresAt == this.expiresAt);
}

class EventsCacheCompanion extends UpdateCompanion<EventsCacheRow> {
  final Value<String> key;
  final Value<String> itineraryId;
  final Value<String> data;
  final Value<DateTime> createdAt;
  final Value<DateTime> expiresAt;
  final Value<int> rowid;
  const EventsCacheCompanion({
    this.key = const Value.absent(),
    this.itineraryId = const Value.absent(),
    this.data = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.expiresAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EventsCacheCompanion.insert({
    required String key,
    required String itineraryId,
    required String data,
    required DateTime createdAt,
    required DateTime expiresAt,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       itineraryId = Value(itineraryId),
       data = Value(data),
       createdAt = Value(createdAt),
       expiresAt = Value(expiresAt);
  static Insertable<EventsCacheRow> custom({
    Expression<String>? key,
    Expression<String>? itineraryId,
    Expression<String>? data,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? expiresAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (itineraryId != null) 'itinerary_id': itineraryId,
      if (data != null) 'data': data,
      if (createdAt != null) 'created_at': createdAt,
      if (expiresAt != null) 'expires_at': expiresAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EventsCacheCompanion copyWith({
    Value<String>? key,
    Value<String>? itineraryId,
    Value<String>? data,
    Value<DateTime>? createdAt,
    Value<DateTime>? expiresAt,
    Value<int>? rowid,
  }) {
    return EventsCacheCompanion(
      key: key ?? this.key,
      itineraryId: itineraryId ?? this.itineraryId,
      data: data ?? this.data,
      createdAt: createdAt ?? this.createdAt,
      expiresAt: expiresAt ?? this.expiresAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (itineraryId.present) {
      map['itinerary_id'] = Variable<String>(itineraryId.value);
    }
    if (data.present) {
      map['data'] = Variable<String>(data.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (expiresAt.present) {
      map['expires_at'] = Variable<DateTime>(expiresAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EventsCacheCompanion(')
          ..write('key: $key, ')
          ..write('itineraryId: $itineraryId, ')
          ..write('data: $data, ')
          ..write('createdAt: $createdAt, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TrailsCacheTable extends TrailsCache
    with TableInfo<$TrailsCacheTable, TrailsCacheRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TrailsCacheTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _itineraryIdMeta = const VerificationMeta(
    'itineraryId',
  );
  @override
  late final GeneratedColumn<String> itineraryId = GeneratedColumn<String>(
    'itinerary_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
    'data',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _expiresAtMeta = const VerificationMeta(
    'expiresAt',
  );
  @override
  late final GeneratedColumn<DateTime> expiresAt = GeneratedColumn<DateTime>(
    'expires_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    key,
    itineraryId,
    data,
    createdAt,
    expiresAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'trails_cache';
  @override
  VerificationContext validateIntegrity(
    Insertable<TrailsCacheRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('itinerary_id')) {
      context.handle(
        _itineraryIdMeta,
        itineraryId.isAcceptableOrUnknown(
          data['itinerary_id']!,
          _itineraryIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_itineraryIdMeta);
    }
    if (data.containsKey('data')) {
      context.handle(
        _dataMeta,
        this.data.isAcceptableOrUnknown(data['data']!, _dataMeta),
      );
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('expires_at')) {
      context.handle(
        _expiresAtMeta,
        expiresAt.isAcceptableOrUnknown(data['expires_at']!, _expiresAtMeta),
      );
    } else if (isInserting) {
      context.missing(_expiresAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  TrailsCacheRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TrailsCacheRow(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      itineraryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}itinerary_id'],
      )!,
      data: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}data'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      expiresAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}expires_at'],
      )!,
    );
  }

  @override
  $TrailsCacheTable createAlias(String alias) {
    return $TrailsCacheTable(attachedDatabase, alias);
  }
}

class TrailsCacheRow extends DataClass implements Insertable<TrailsCacheRow> {
  final String key;
  final String itineraryId;
  final String data;
  final DateTime createdAt;
  final DateTime expiresAt;
  const TrailsCacheRow({
    required this.key,
    required this.itineraryId,
    required this.data,
    required this.createdAt,
    required this.expiresAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['itinerary_id'] = Variable<String>(itineraryId);
    map['data'] = Variable<String>(data);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['expires_at'] = Variable<DateTime>(expiresAt);
    return map;
  }

  TrailsCacheCompanion toCompanion(bool nullToAbsent) {
    return TrailsCacheCompanion(
      key: Value(key),
      itineraryId: Value(itineraryId),
      data: Value(data),
      createdAt: Value(createdAt),
      expiresAt: Value(expiresAt),
    );
  }

  factory TrailsCacheRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TrailsCacheRow(
      key: serializer.fromJson<String>(json['key']),
      itineraryId: serializer.fromJson<String>(json['itineraryId']),
      data: serializer.fromJson<String>(json['data']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      expiresAt: serializer.fromJson<DateTime>(json['expiresAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'itineraryId': serializer.toJson<String>(itineraryId),
      'data': serializer.toJson<String>(data),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'expiresAt': serializer.toJson<DateTime>(expiresAt),
    };
  }

  TrailsCacheRow copyWith({
    String? key,
    String? itineraryId,
    String? data,
    DateTime? createdAt,
    DateTime? expiresAt,
  }) => TrailsCacheRow(
    key: key ?? this.key,
    itineraryId: itineraryId ?? this.itineraryId,
    data: data ?? this.data,
    createdAt: createdAt ?? this.createdAt,
    expiresAt: expiresAt ?? this.expiresAt,
  );
  TrailsCacheRow copyWithCompanion(TrailsCacheCompanion data) {
    return TrailsCacheRow(
      key: data.key.present ? data.key.value : this.key,
      itineraryId: data.itineraryId.present
          ? data.itineraryId.value
          : this.itineraryId,
      data: data.data.present ? data.data.value : this.data,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      expiresAt: data.expiresAt.present ? data.expiresAt.value : this.expiresAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TrailsCacheRow(')
          ..write('key: $key, ')
          ..write('itineraryId: $itineraryId, ')
          ..write('data: $data, ')
          ..write('createdAt: $createdAt, ')
          ..write('expiresAt: $expiresAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, itineraryId, data, createdAt, expiresAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TrailsCacheRow &&
          other.key == this.key &&
          other.itineraryId == this.itineraryId &&
          other.data == this.data &&
          other.createdAt == this.createdAt &&
          other.expiresAt == this.expiresAt);
}

class TrailsCacheCompanion extends UpdateCompanion<TrailsCacheRow> {
  final Value<String> key;
  final Value<String> itineraryId;
  final Value<String> data;
  final Value<DateTime> createdAt;
  final Value<DateTime> expiresAt;
  final Value<int> rowid;
  const TrailsCacheCompanion({
    this.key = const Value.absent(),
    this.itineraryId = const Value.absent(),
    this.data = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.expiresAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TrailsCacheCompanion.insert({
    required String key,
    required String itineraryId,
    required String data,
    required DateTime createdAt,
    required DateTime expiresAt,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       itineraryId = Value(itineraryId),
       data = Value(data),
       createdAt = Value(createdAt),
       expiresAt = Value(expiresAt);
  static Insertable<TrailsCacheRow> custom({
    Expression<String>? key,
    Expression<String>? itineraryId,
    Expression<String>? data,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? expiresAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (itineraryId != null) 'itinerary_id': itineraryId,
      if (data != null) 'data': data,
      if (createdAt != null) 'created_at': createdAt,
      if (expiresAt != null) 'expires_at': expiresAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TrailsCacheCompanion copyWith({
    Value<String>? key,
    Value<String>? itineraryId,
    Value<String>? data,
    Value<DateTime>? createdAt,
    Value<DateTime>? expiresAt,
    Value<int>? rowid,
  }) {
    return TrailsCacheCompanion(
      key: key ?? this.key,
      itineraryId: itineraryId ?? this.itineraryId,
      data: data ?? this.data,
      createdAt: createdAt ?? this.createdAt,
      expiresAt: expiresAt ?? this.expiresAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (itineraryId.present) {
      map['itinerary_id'] = Variable<String>(itineraryId.value);
    }
    if (data.present) {
      map['data'] = Variable<String>(data.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (expiresAt.present) {
      map['expires_at'] = Variable<DateTime>(expiresAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TrailsCacheCompanion(')
          ..write('key: $key, ')
          ..write('itineraryId: $itineraryId, ')
          ..write('data: $data, ')
          ..write('createdAt: $createdAt, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MapTilesCacheTable extends MapTilesCache
    with TableInfo<$MapTilesCacheTable, MapTilesCacheRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MapTilesCacheTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedColumn<Uint8List> data = GeneratedColumn<Uint8List>(
    'data',
    aliasedName,
    false,
    type: DriftSqlType.blob,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _expiresAtMeta = const VerificationMeta(
    'expiresAt',
  );
  @override
  late final GeneratedColumn<DateTime> expiresAt = GeneratedColumn<DateTime>(
    'expires_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [key, data, expiresAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'map_tiles_cache';
  @override
  VerificationContext validateIntegrity(
    Insertable<MapTilesCacheRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('data')) {
      context.handle(
        _dataMeta,
        this.data.isAcceptableOrUnknown(data['data']!, _dataMeta),
      );
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    if (data.containsKey('expires_at')) {
      context.handle(
        _expiresAtMeta,
        expiresAt.isAcceptableOrUnknown(data['expires_at']!, _expiresAtMeta),
      );
    } else if (isInserting) {
      context.missing(_expiresAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  MapTilesCacheRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MapTilesCacheRow(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      data: attachedDatabase.typeMapping.read(
        DriftSqlType.blob,
        data['${effectivePrefix}data'],
      )!,
      expiresAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}expires_at'],
      )!,
    );
  }

  @override
  $MapTilesCacheTable createAlias(String alias) {
    return $MapTilesCacheTable(attachedDatabase, alias);
  }
}

class MapTilesCacheRow extends DataClass
    implements Insertable<MapTilesCacheRow> {
  final String key;
  final Uint8List data;
  final DateTime expiresAt;
  const MapTilesCacheRow({
    required this.key,
    required this.data,
    required this.expiresAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['data'] = Variable<Uint8List>(data);
    map['expires_at'] = Variable<DateTime>(expiresAt);
    return map;
  }

  MapTilesCacheCompanion toCompanion(bool nullToAbsent) {
    return MapTilesCacheCompanion(
      key: Value(key),
      data: Value(data),
      expiresAt: Value(expiresAt),
    );
  }

  factory MapTilesCacheRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MapTilesCacheRow(
      key: serializer.fromJson<String>(json['key']),
      data: serializer.fromJson<Uint8List>(json['data']),
      expiresAt: serializer.fromJson<DateTime>(json['expiresAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'data': serializer.toJson<Uint8List>(data),
      'expiresAt': serializer.toJson<DateTime>(expiresAt),
    };
  }

  MapTilesCacheRow copyWith({
    String? key,
    Uint8List? data,
    DateTime? expiresAt,
  }) => MapTilesCacheRow(
    key: key ?? this.key,
    data: data ?? this.data,
    expiresAt: expiresAt ?? this.expiresAt,
  );
  MapTilesCacheRow copyWithCompanion(MapTilesCacheCompanion data) {
    return MapTilesCacheRow(
      key: data.key.present ? data.key.value : this.key,
      data: data.data.present ? data.data.value : this.data,
      expiresAt: data.expiresAt.present ? data.expiresAt.value : this.expiresAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MapTilesCacheRow(')
          ..write('key: $key, ')
          ..write('data: $data, ')
          ..write('expiresAt: $expiresAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(key, $driftBlobEquality.hash(data), expiresAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MapTilesCacheRow &&
          other.key == this.key &&
          $driftBlobEquality.equals(other.data, this.data) &&
          other.expiresAt == this.expiresAt);
}

class MapTilesCacheCompanion extends UpdateCompanion<MapTilesCacheRow> {
  final Value<String> key;
  final Value<Uint8List> data;
  final Value<DateTime> expiresAt;
  final Value<int> rowid;
  const MapTilesCacheCompanion({
    this.key = const Value.absent(),
    this.data = const Value.absent(),
    this.expiresAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MapTilesCacheCompanion.insert({
    required String key,
    required Uint8List data,
    required DateTime expiresAt,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       data = Value(data),
       expiresAt = Value(expiresAt);
  static Insertable<MapTilesCacheRow> custom({
    Expression<String>? key,
    Expression<Uint8List>? data,
    Expression<DateTime>? expiresAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (data != null) 'data': data,
      if (expiresAt != null) 'expires_at': expiresAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MapTilesCacheCompanion copyWith({
    Value<String>? key,
    Value<Uint8List>? data,
    Value<DateTime>? expiresAt,
    Value<int>? rowid,
  }) {
    return MapTilesCacheCompanion(
      key: key ?? this.key,
      data: data ?? this.data,
      expiresAt: expiresAt ?? this.expiresAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (data.present) {
      map['data'] = Variable<Uint8List>(data.value);
    }
    if (expiresAt.present) {
      map['expires_at'] = Variable<DateTime>(expiresAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MapTilesCacheCompanion(')
          ..write('key: $key, ')
          ..write('data: $data, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MapItemsCacheTable extends MapItemsCache
    with TableInfo<$MapItemsCacheTable, MapItemsCacheRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MapItemsCacheTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
    'data',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _expiresAtMeta = const VerificationMeta(
    'expiresAt',
  );
  @override
  late final GeneratedColumn<DateTime> expiresAt = GeneratedColumn<DateTime>(
    'expires_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [key, data, expiresAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'map_items_cache';
  @override
  VerificationContext validateIntegrity(
    Insertable<MapItemsCacheRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('data')) {
      context.handle(
        _dataMeta,
        this.data.isAcceptableOrUnknown(data['data']!, _dataMeta),
      );
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    if (data.containsKey('expires_at')) {
      context.handle(
        _expiresAtMeta,
        expiresAt.isAcceptableOrUnknown(data['expires_at']!, _expiresAtMeta),
      );
    } else if (isInserting) {
      context.missing(_expiresAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  MapItemsCacheRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MapItemsCacheRow(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      data: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}data'],
      )!,
      expiresAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}expires_at'],
      )!,
    );
  }

  @override
  $MapItemsCacheTable createAlias(String alias) {
    return $MapItemsCacheTable(attachedDatabase, alias);
  }
}

class MapItemsCacheRow extends DataClass
    implements Insertable<MapItemsCacheRow> {
  final String key;
  final String data;
  final DateTime expiresAt;
  const MapItemsCacheRow({
    required this.key,
    required this.data,
    required this.expiresAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['data'] = Variable<String>(data);
    map['expires_at'] = Variable<DateTime>(expiresAt);
    return map;
  }

  MapItemsCacheCompanion toCompanion(bool nullToAbsent) {
    return MapItemsCacheCompanion(
      key: Value(key),
      data: Value(data),
      expiresAt: Value(expiresAt),
    );
  }

  factory MapItemsCacheRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MapItemsCacheRow(
      key: serializer.fromJson<String>(json['key']),
      data: serializer.fromJson<String>(json['data']),
      expiresAt: serializer.fromJson<DateTime>(json['expiresAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'data': serializer.toJson<String>(data),
      'expiresAt': serializer.toJson<DateTime>(expiresAt),
    };
  }

  MapItemsCacheRow copyWith({String? key, String? data, DateTime? expiresAt}) =>
      MapItemsCacheRow(
        key: key ?? this.key,
        data: data ?? this.data,
        expiresAt: expiresAt ?? this.expiresAt,
      );
  MapItemsCacheRow copyWithCompanion(MapItemsCacheCompanion data) {
    return MapItemsCacheRow(
      key: data.key.present ? data.key.value : this.key,
      data: data.data.present ? data.data.value : this.data,
      expiresAt: data.expiresAt.present ? data.expiresAt.value : this.expiresAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MapItemsCacheRow(')
          ..write('key: $key, ')
          ..write('data: $data, ')
          ..write('expiresAt: $expiresAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, data, expiresAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MapItemsCacheRow &&
          other.key == this.key &&
          other.data == this.data &&
          other.expiresAt == this.expiresAt);
}

class MapItemsCacheCompanion extends UpdateCompanion<MapItemsCacheRow> {
  final Value<String> key;
  final Value<String> data;
  final Value<DateTime> expiresAt;
  final Value<int> rowid;
  const MapItemsCacheCompanion({
    this.key = const Value.absent(),
    this.data = const Value.absent(),
    this.expiresAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MapItemsCacheCompanion.insert({
    required String key,
    required String data,
    required DateTime expiresAt,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       data = Value(data),
       expiresAt = Value(expiresAt);
  static Insertable<MapItemsCacheRow> custom({
    Expression<String>? key,
    Expression<String>? data,
    Expression<DateTime>? expiresAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (data != null) 'data': data,
      if (expiresAt != null) 'expires_at': expiresAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MapItemsCacheCompanion copyWith({
    Value<String>? key,
    Value<String>? data,
    Value<DateTime>? expiresAt,
    Value<int>? rowid,
  }) {
    return MapItemsCacheCompanion(
      key: key ?? this.key,
      data: data ?? this.data,
      expiresAt: expiresAt ?? this.expiresAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (data.present) {
      map['data'] = Variable<String>(data.value);
    }
    if (expiresAt.present) {
      map['expires_at'] = Variable<DateTime>(expiresAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MapItemsCacheCompanion(')
          ..write('key: $key, ')
          ..write('data: $data, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DayPlansTable extends DayPlans
    with TableInfo<$DayPlansTable, DayPlanRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DayPlansTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _itineraryIdMeta = const VerificationMeta(
    'itineraryId',
  );
  @override
  late final GeneratedColumn<String> itineraryId = GeneratedColumn<String>(
    'itinerary_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES itineraries (id)',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [itineraryId, date, version, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'day_plans';
  @override
  VerificationContext validateIntegrity(
    Insertable<DayPlanRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('itinerary_id')) {
      context.handle(
        _itineraryIdMeta,
        itineraryId.isAcceptableOrUnknown(
          data['itinerary_id']!,
          _itineraryIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_itineraryIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {itineraryId, date};
  @override
  DayPlanRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DayPlanRow(
      itineraryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}itinerary_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $DayPlansTable createAlias(String alias) {
    return $DayPlansTable(attachedDatabase, alias);
  }
}

class DayPlanRow extends DataClass implements Insertable<DayPlanRow> {
  final String itineraryId;
  final DateTime date;
  final int version;
  final DateTime? updatedAt;
  const DayPlanRow({
    required this.itineraryId,
    required this.date,
    required this.version,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['itinerary_id'] = Variable<String>(itineraryId);
    map['date'] = Variable<DateTime>(date);
    map['version'] = Variable<int>(version);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  DayPlansCompanion toCompanion(bool nullToAbsent) {
    return DayPlansCompanion(
      itineraryId: Value(itineraryId),
      date: Value(date),
      version: Value(version),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory DayPlanRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DayPlanRow(
      itineraryId: serializer.fromJson<String>(json['itineraryId']),
      date: serializer.fromJson<DateTime>(json['date']),
      version: serializer.fromJson<int>(json['version']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'itineraryId': serializer.toJson<String>(itineraryId),
      'date': serializer.toJson<DateTime>(date),
      'version': serializer.toJson<int>(version),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  DayPlanRow copyWith({
    String? itineraryId,
    DateTime? date,
    int? version,
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => DayPlanRow(
    itineraryId: itineraryId ?? this.itineraryId,
    date: date ?? this.date,
    version: version ?? this.version,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  DayPlanRow copyWithCompanion(DayPlansCompanion data) {
    return DayPlanRow(
      itineraryId: data.itineraryId.present
          ? data.itineraryId.value
          : this.itineraryId,
      date: data.date.present ? data.date.value : this.date,
      version: data.version.present ? data.version.value : this.version,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DayPlanRow(')
          ..write('itineraryId: $itineraryId, ')
          ..write('date: $date, ')
          ..write('version: $version, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(itineraryId, date, version, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DayPlanRow &&
          other.itineraryId == this.itineraryId &&
          other.date == this.date &&
          other.version == this.version &&
          other.updatedAt == this.updatedAt);
}

class DayPlansCompanion extends UpdateCompanion<DayPlanRow> {
  final Value<String> itineraryId;
  final Value<DateTime> date;
  final Value<int> version;
  final Value<DateTime?> updatedAt;
  final Value<int> rowid;
  const DayPlansCompanion({
    this.itineraryId = const Value.absent(),
    this.date = const Value.absent(),
    this.version = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DayPlansCompanion.insert({
    required String itineraryId,
    required DateTime date,
    this.version = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : itineraryId = Value(itineraryId),
       date = Value(date);
  static Insertable<DayPlanRow> custom({
    Expression<String>? itineraryId,
    Expression<DateTime>? date,
    Expression<int>? version,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (itineraryId != null) 'itinerary_id': itineraryId,
      if (date != null) 'date': date,
      if (version != null) 'version': version,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DayPlansCompanion copyWith({
    Value<String>? itineraryId,
    Value<DateTime>? date,
    Value<int>? version,
    Value<DateTime?>? updatedAt,
    Value<int>? rowid,
  }) {
    return DayPlansCompanion(
      itineraryId: itineraryId ?? this.itineraryId,
      date: date ?? this.date,
      version: version ?? this.version,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (itineraryId.present) {
      map['itinerary_id'] = Variable<String>(itineraryId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DayPlansCompanion(')
          ..write('itineraryId: $itineraryId, ')
          ..write('date: $date, ')
          ..write('version: $version, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DayPlanEntriesTable extends DayPlanEntries
    with TableInfo<$DayPlanEntriesTable, DayPlanEntryRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DayPlanEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _itineraryIdMeta = const VerificationMeta(
    'itineraryId',
  );
  @override
  late final GeneratedColumn<String> itineraryId = GeneratedColumn<String>(
    'itinerary_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _savedItemIdMeta = const VerificationMeta(
    'savedItemId',
  );
  @override
  late final GeneratedColumn<String> savedItemId = GeneratedColumn<String>(
    'saved_item_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startTimeMeta = const VerificationMeta(
    'startTime',
  );
  @override
  late final GeneratedColumn<DateTime> startTime = GeneratedColumn<DateTime>(
    'start_time',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _endTimeMeta = const VerificationMeta(
    'endTime',
  );
  @override
  late final GeneratedColumn<DateTime> endTime = GeneratedColumn<DateTime>(
    'end_time',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _durationMinutesMeta = const VerificationMeta(
    'durationMinutes',
  );
  @override
  late final GeneratedColumn<int> durationMinutes = GeneratedColumn<int>(
    'duration_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(60),
  );
  static const VerificationMeta _commuteModeMeta = const VerificationMeta(
    'commuteMode',
  );
  @override
  late final GeneratedColumn<String> commuteMode = GeneratedColumn<String>(
    'commute_mode',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('none'),
  );
  static const VerificationMeta _commuteDurationMinutesMeta =
      const VerificationMeta('commuteDurationMinutes');
  @override
  late final GeneratedColumn<int> commuteDurationMinutes = GeneratedColumn<int>(
    'commute_duration_minutes',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _bufferBeforeMinutesMeta =
      const VerificationMeta('bufferBeforeMinutes');
  @override
  late final GeneratedColumn<int> bufferBeforeMinutes = GeneratedColumn<int>(
    'buffer_before_minutes',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _orderIndexMeta = const VerificationMeta(
    'orderIndex',
  );
  @override
  late final GeneratedColumn<int> orderIndex = GeneratedColumn<int>(
    'order_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    itineraryId,
    date,
    savedItemId,
    title,
    type,
    startTime,
    endTime,
    durationMinutes,
    commuteMode,
    commuteDurationMinutes,
    bufferBeforeMinutes,
    notes,
    orderIndex,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'day_plan_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<DayPlanEntryRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('itinerary_id')) {
      context.handle(
        _itineraryIdMeta,
        itineraryId.isAcceptableOrUnknown(
          data['itinerary_id']!,
          _itineraryIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_itineraryIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('saved_item_id')) {
      context.handle(
        _savedItemIdMeta,
        savedItemId.isAcceptableOrUnknown(
          data['saved_item_id']!,
          _savedItemIdMeta,
        ),
      );
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('start_time')) {
      context.handle(
        _startTimeMeta,
        startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta),
      );
    }
    if (data.containsKey('end_time')) {
      context.handle(
        _endTimeMeta,
        endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta),
      );
    }
    if (data.containsKey('duration_minutes')) {
      context.handle(
        _durationMinutesMeta,
        durationMinutes.isAcceptableOrUnknown(
          data['duration_minutes']!,
          _durationMinutesMeta,
        ),
      );
    }
    if (data.containsKey('commute_mode')) {
      context.handle(
        _commuteModeMeta,
        commuteMode.isAcceptableOrUnknown(
          data['commute_mode']!,
          _commuteModeMeta,
        ),
      );
    }
    if (data.containsKey('commute_duration_minutes')) {
      context.handle(
        _commuteDurationMinutesMeta,
        commuteDurationMinutes.isAcceptableOrUnknown(
          data['commute_duration_minutes']!,
          _commuteDurationMinutesMeta,
        ),
      );
    }
    if (data.containsKey('buffer_before_minutes')) {
      context.handle(
        _bufferBeforeMinutesMeta,
        bufferBeforeMinutes.isAcceptableOrUnknown(
          data['buffer_before_minutes']!,
          _bufferBeforeMinutesMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('order_index')) {
      context.handle(
        _orderIndexMeta,
        orderIndex.isAcceptableOrUnknown(data['order_index']!, _orderIndexMeta),
      );
    } else if (isInserting) {
      context.missing(_orderIndexMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DayPlanEntryRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DayPlanEntryRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      itineraryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}itinerary_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      savedItemId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}saved_item_id'],
      ),
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      startTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_time'],
      ),
      endTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_time'],
      ),
      durationMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_minutes'],
      )!,
      commuteMode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}commute_mode'],
      )!,
      commuteDurationMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}commute_duration_minutes'],
      ),
      bufferBeforeMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}buffer_before_minutes'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      orderIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order_index'],
      )!,
    );
  }

  @override
  $DayPlanEntriesTable createAlias(String alias) {
    return $DayPlanEntriesTable(attachedDatabase, alias);
  }
}

class DayPlanEntryRow extends DataClass implements Insertable<DayPlanEntryRow> {
  final String id;
  final String itineraryId;
  final DateTime date;
  final String? savedItemId;
  final String title;
  final String type;
  final DateTime? startTime;
  final DateTime? endTime;
  final int durationMinutes;
  final String commuteMode;
  final int? commuteDurationMinutes;
  final int? bufferBeforeMinutes;
  final String? notes;
  final int orderIndex;
  const DayPlanEntryRow({
    required this.id,
    required this.itineraryId,
    required this.date,
    this.savedItemId,
    required this.title,
    required this.type,
    this.startTime,
    this.endTime,
    required this.durationMinutes,
    required this.commuteMode,
    this.commuteDurationMinutes,
    this.bufferBeforeMinutes,
    this.notes,
    required this.orderIndex,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['itinerary_id'] = Variable<String>(itineraryId);
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || savedItemId != null) {
      map['saved_item_id'] = Variable<String>(savedItemId);
    }
    map['title'] = Variable<String>(title);
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || startTime != null) {
      map['start_time'] = Variable<DateTime>(startTime);
    }
    if (!nullToAbsent || endTime != null) {
      map['end_time'] = Variable<DateTime>(endTime);
    }
    map['duration_minutes'] = Variable<int>(durationMinutes);
    map['commute_mode'] = Variable<String>(commuteMode);
    if (!nullToAbsent || commuteDurationMinutes != null) {
      map['commute_duration_minutes'] = Variable<int>(commuteDurationMinutes);
    }
    if (!nullToAbsent || bufferBeforeMinutes != null) {
      map['buffer_before_minutes'] = Variable<int>(bufferBeforeMinutes);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['order_index'] = Variable<int>(orderIndex);
    return map;
  }

  DayPlanEntriesCompanion toCompanion(bool nullToAbsent) {
    return DayPlanEntriesCompanion(
      id: Value(id),
      itineraryId: Value(itineraryId),
      date: Value(date),
      savedItemId: savedItemId == null && nullToAbsent
          ? const Value.absent()
          : Value(savedItemId),
      title: Value(title),
      type: Value(type),
      startTime: startTime == null && nullToAbsent
          ? const Value.absent()
          : Value(startTime),
      endTime: endTime == null && nullToAbsent
          ? const Value.absent()
          : Value(endTime),
      durationMinutes: Value(durationMinutes),
      commuteMode: Value(commuteMode),
      commuteDurationMinutes: commuteDurationMinutes == null && nullToAbsent
          ? const Value.absent()
          : Value(commuteDurationMinutes),
      bufferBeforeMinutes: bufferBeforeMinutes == null && nullToAbsent
          ? const Value.absent()
          : Value(bufferBeforeMinutes),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      orderIndex: Value(orderIndex),
    );
  }

  factory DayPlanEntryRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DayPlanEntryRow(
      id: serializer.fromJson<String>(json['id']),
      itineraryId: serializer.fromJson<String>(json['itineraryId']),
      date: serializer.fromJson<DateTime>(json['date']),
      savedItemId: serializer.fromJson<String?>(json['savedItemId']),
      title: serializer.fromJson<String>(json['title']),
      type: serializer.fromJson<String>(json['type']),
      startTime: serializer.fromJson<DateTime?>(json['startTime']),
      endTime: serializer.fromJson<DateTime?>(json['endTime']),
      durationMinutes: serializer.fromJson<int>(json['durationMinutes']),
      commuteMode: serializer.fromJson<String>(json['commuteMode']),
      commuteDurationMinutes: serializer.fromJson<int?>(
        json['commuteDurationMinutes'],
      ),
      bufferBeforeMinutes: serializer.fromJson<int?>(
        json['bufferBeforeMinutes'],
      ),
      notes: serializer.fromJson<String?>(json['notes']),
      orderIndex: serializer.fromJson<int>(json['orderIndex']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'itineraryId': serializer.toJson<String>(itineraryId),
      'date': serializer.toJson<DateTime>(date),
      'savedItemId': serializer.toJson<String?>(savedItemId),
      'title': serializer.toJson<String>(title),
      'type': serializer.toJson<String>(type),
      'startTime': serializer.toJson<DateTime?>(startTime),
      'endTime': serializer.toJson<DateTime?>(endTime),
      'durationMinutes': serializer.toJson<int>(durationMinutes),
      'commuteMode': serializer.toJson<String>(commuteMode),
      'commuteDurationMinutes': serializer.toJson<int?>(commuteDurationMinutes),
      'bufferBeforeMinutes': serializer.toJson<int?>(bufferBeforeMinutes),
      'notes': serializer.toJson<String?>(notes),
      'orderIndex': serializer.toJson<int>(orderIndex),
    };
  }

  DayPlanEntryRow copyWith({
    String? id,
    String? itineraryId,
    DateTime? date,
    Value<String?> savedItemId = const Value.absent(),
    String? title,
    String? type,
    Value<DateTime?> startTime = const Value.absent(),
    Value<DateTime?> endTime = const Value.absent(),
    int? durationMinutes,
    String? commuteMode,
    Value<int?> commuteDurationMinutes = const Value.absent(),
    Value<int?> bufferBeforeMinutes = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    int? orderIndex,
  }) => DayPlanEntryRow(
    id: id ?? this.id,
    itineraryId: itineraryId ?? this.itineraryId,
    date: date ?? this.date,
    savedItemId: savedItemId.present ? savedItemId.value : this.savedItemId,
    title: title ?? this.title,
    type: type ?? this.type,
    startTime: startTime.present ? startTime.value : this.startTime,
    endTime: endTime.present ? endTime.value : this.endTime,
    durationMinutes: durationMinutes ?? this.durationMinutes,
    commuteMode: commuteMode ?? this.commuteMode,
    commuteDurationMinutes: commuteDurationMinutes.present
        ? commuteDurationMinutes.value
        : this.commuteDurationMinutes,
    bufferBeforeMinutes: bufferBeforeMinutes.present
        ? bufferBeforeMinutes.value
        : this.bufferBeforeMinutes,
    notes: notes.present ? notes.value : this.notes,
    orderIndex: orderIndex ?? this.orderIndex,
  );
  DayPlanEntryRow copyWithCompanion(DayPlanEntriesCompanion data) {
    return DayPlanEntryRow(
      id: data.id.present ? data.id.value : this.id,
      itineraryId: data.itineraryId.present
          ? data.itineraryId.value
          : this.itineraryId,
      date: data.date.present ? data.date.value : this.date,
      savedItemId: data.savedItemId.present
          ? data.savedItemId.value
          : this.savedItemId,
      title: data.title.present ? data.title.value : this.title,
      type: data.type.present ? data.type.value : this.type,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      endTime: data.endTime.present ? data.endTime.value : this.endTime,
      durationMinutes: data.durationMinutes.present
          ? data.durationMinutes.value
          : this.durationMinutes,
      commuteMode: data.commuteMode.present
          ? data.commuteMode.value
          : this.commuteMode,
      commuteDurationMinutes: data.commuteDurationMinutes.present
          ? data.commuteDurationMinutes.value
          : this.commuteDurationMinutes,
      bufferBeforeMinutes: data.bufferBeforeMinutes.present
          ? data.bufferBeforeMinutes.value
          : this.bufferBeforeMinutes,
      notes: data.notes.present ? data.notes.value : this.notes,
      orderIndex: data.orderIndex.present
          ? data.orderIndex.value
          : this.orderIndex,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DayPlanEntryRow(')
          ..write('id: $id, ')
          ..write('itineraryId: $itineraryId, ')
          ..write('date: $date, ')
          ..write('savedItemId: $savedItemId, ')
          ..write('title: $title, ')
          ..write('type: $type, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('commuteMode: $commuteMode, ')
          ..write('commuteDurationMinutes: $commuteDurationMinutes, ')
          ..write('bufferBeforeMinutes: $bufferBeforeMinutes, ')
          ..write('notes: $notes, ')
          ..write('orderIndex: $orderIndex')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    itineraryId,
    date,
    savedItemId,
    title,
    type,
    startTime,
    endTime,
    durationMinutes,
    commuteMode,
    commuteDurationMinutes,
    bufferBeforeMinutes,
    notes,
    orderIndex,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DayPlanEntryRow &&
          other.id == this.id &&
          other.itineraryId == this.itineraryId &&
          other.date == this.date &&
          other.savedItemId == this.savedItemId &&
          other.title == this.title &&
          other.type == this.type &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.durationMinutes == this.durationMinutes &&
          other.commuteMode == this.commuteMode &&
          other.commuteDurationMinutes == this.commuteDurationMinutes &&
          other.bufferBeforeMinutes == this.bufferBeforeMinutes &&
          other.notes == this.notes &&
          other.orderIndex == this.orderIndex);
}

class DayPlanEntriesCompanion extends UpdateCompanion<DayPlanEntryRow> {
  final Value<String> id;
  final Value<String> itineraryId;
  final Value<DateTime> date;
  final Value<String?> savedItemId;
  final Value<String> title;
  final Value<String> type;
  final Value<DateTime?> startTime;
  final Value<DateTime?> endTime;
  final Value<int> durationMinutes;
  final Value<String> commuteMode;
  final Value<int?> commuteDurationMinutes;
  final Value<int?> bufferBeforeMinutes;
  final Value<String?> notes;
  final Value<int> orderIndex;
  final Value<int> rowid;
  const DayPlanEntriesCompanion({
    this.id = const Value.absent(),
    this.itineraryId = const Value.absent(),
    this.date = const Value.absent(),
    this.savedItemId = const Value.absent(),
    this.title = const Value.absent(),
    this.type = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.durationMinutes = const Value.absent(),
    this.commuteMode = const Value.absent(),
    this.commuteDurationMinutes = const Value.absent(),
    this.bufferBeforeMinutes = const Value.absent(),
    this.notes = const Value.absent(),
    this.orderIndex = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DayPlanEntriesCompanion.insert({
    required String id,
    required String itineraryId,
    required DateTime date,
    this.savedItemId = const Value.absent(),
    required String title,
    required String type,
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.durationMinutes = const Value.absent(),
    this.commuteMode = const Value.absent(),
    this.commuteDurationMinutes = const Value.absent(),
    this.bufferBeforeMinutes = const Value.absent(),
    this.notes = const Value.absent(),
    required int orderIndex,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       itineraryId = Value(itineraryId),
       date = Value(date),
       title = Value(title),
       type = Value(type),
       orderIndex = Value(orderIndex);
  static Insertable<DayPlanEntryRow> custom({
    Expression<String>? id,
    Expression<String>? itineraryId,
    Expression<DateTime>? date,
    Expression<String>? savedItemId,
    Expression<String>? title,
    Expression<String>? type,
    Expression<DateTime>? startTime,
    Expression<DateTime>? endTime,
    Expression<int>? durationMinutes,
    Expression<String>? commuteMode,
    Expression<int>? commuteDurationMinutes,
    Expression<int>? bufferBeforeMinutes,
    Expression<String>? notes,
    Expression<int>? orderIndex,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (itineraryId != null) 'itinerary_id': itineraryId,
      if (date != null) 'date': date,
      if (savedItemId != null) 'saved_item_id': savedItemId,
      if (title != null) 'title': title,
      if (type != null) 'type': type,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (durationMinutes != null) 'duration_minutes': durationMinutes,
      if (commuteMode != null) 'commute_mode': commuteMode,
      if (commuteDurationMinutes != null)
        'commute_duration_minutes': commuteDurationMinutes,
      if (bufferBeforeMinutes != null)
        'buffer_before_minutes': bufferBeforeMinutes,
      if (notes != null) 'notes': notes,
      if (orderIndex != null) 'order_index': orderIndex,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DayPlanEntriesCompanion copyWith({
    Value<String>? id,
    Value<String>? itineraryId,
    Value<DateTime>? date,
    Value<String?>? savedItemId,
    Value<String>? title,
    Value<String>? type,
    Value<DateTime?>? startTime,
    Value<DateTime?>? endTime,
    Value<int>? durationMinutes,
    Value<String>? commuteMode,
    Value<int?>? commuteDurationMinutes,
    Value<int?>? bufferBeforeMinutes,
    Value<String?>? notes,
    Value<int>? orderIndex,
    Value<int>? rowid,
  }) {
    return DayPlanEntriesCompanion(
      id: id ?? this.id,
      itineraryId: itineraryId ?? this.itineraryId,
      date: date ?? this.date,
      savedItemId: savedItemId ?? this.savedItemId,
      title: title ?? this.title,
      type: type ?? this.type,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      commuteMode: commuteMode ?? this.commuteMode,
      commuteDurationMinutes:
          commuteDurationMinutes ?? this.commuteDurationMinutes,
      bufferBeforeMinutes: bufferBeforeMinutes ?? this.bufferBeforeMinutes,
      notes: notes ?? this.notes,
      orderIndex: orderIndex ?? this.orderIndex,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (itineraryId.present) {
      map['itinerary_id'] = Variable<String>(itineraryId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (savedItemId.present) {
      map['saved_item_id'] = Variable<String>(savedItemId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<DateTime>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<DateTime>(endTime.value);
    }
    if (durationMinutes.present) {
      map['duration_minutes'] = Variable<int>(durationMinutes.value);
    }
    if (commuteMode.present) {
      map['commute_mode'] = Variable<String>(commuteMode.value);
    }
    if (commuteDurationMinutes.present) {
      map['commute_duration_minutes'] = Variable<int>(
        commuteDurationMinutes.value,
      );
    }
    if (bufferBeforeMinutes.present) {
      map['buffer_before_minutes'] = Variable<int>(bufferBeforeMinutes.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (orderIndex.present) {
      map['order_index'] = Variable<int>(orderIndex.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DayPlanEntriesCompanion(')
          ..write('id: $id, ')
          ..write('itineraryId: $itineraryId, ')
          ..write('date: $date, ')
          ..write('savedItemId: $savedItemId, ')
          ..write('title: $title, ')
          ..write('type: $type, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('commuteMode: $commuteMode, ')
          ..write('commuteDurationMinutes: $commuteDurationMinutes, ')
          ..write('bufferBeforeMinutes: $bufferBeforeMinutes, ')
          ..write('notes: $notes, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $OfflineBundlesTable extends OfflineBundles
    with TableInfo<$OfflineBundlesTable, OfflineBundleRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OfflineBundlesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _itineraryIdMeta = const VerificationMeta(
    'itineraryId',
  );
  @override
  late final GeneratedColumn<String> itineraryId = GeneratedColumn<String>(
    'itinerary_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sizeBytesMeta = const VerificationMeta(
    'sizeBytes',
  );
  @override
  late final GeneratedColumn<int> sizeBytes = GeneratedColumn<int>(
    'size_bytes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pathMeta = const VerificationMeta('path');
  @override
  late final GeneratedColumn<String> path = GeneratedColumn<String>(
    'path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    itineraryId,
    version,
    id,
    createdAt,
    sizeBytes,
    path,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'offline_bundles';
  @override
  VerificationContext validateIntegrity(
    Insertable<OfflineBundleRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('itinerary_id')) {
      context.handle(
        _itineraryIdMeta,
        itineraryId.isAcceptableOrUnknown(
          data['itinerary_id']!,
          _itineraryIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_itineraryIdMeta);
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    } else if (isInserting) {
      context.missing(_versionMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('size_bytes')) {
      context.handle(
        _sizeBytesMeta,
        sizeBytes.isAcceptableOrUnknown(data['size_bytes']!, _sizeBytesMeta),
      );
    } else if (isInserting) {
      context.missing(_sizeBytesMeta);
    }
    if (data.containsKey('path')) {
      context.handle(
        _pathMeta,
        path.isAcceptableOrUnknown(data['path']!, _pathMeta),
      );
    } else if (isInserting) {
      context.missing(_pathMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {itineraryId, version};
  @override
  OfflineBundleRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OfflineBundleRow(
      itineraryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}itinerary_id'],
      )!,
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      sizeBytes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}size_bytes'],
      )!,
      path: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}path'],
      )!,
    );
  }

  @override
  $OfflineBundlesTable createAlias(String alias) {
    return $OfflineBundlesTable(attachedDatabase, alias);
  }
}

class OfflineBundleRow extends DataClass
    implements Insertable<OfflineBundleRow> {
  final String itineraryId;
  final int version;
  final String id;
  final DateTime createdAt;
  final int sizeBytes;
  final String path;
  const OfflineBundleRow({
    required this.itineraryId,
    required this.version,
    required this.id,
    required this.createdAt,
    required this.sizeBytes,
    required this.path,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['itinerary_id'] = Variable<String>(itineraryId);
    map['version'] = Variable<int>(version);
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['size_bytes'] = Variable<int>(sizeBytes);
    map['path'] = Variable<String>(path);
    return map;
  }

  OfflineBundlesCompanion toCompanion(bool nullToAbsent) {
    return OfflineBundlesCompanion(
      itineraryId: Value(itineraryId),
      version: Value(version),
      id: Value(id),
      createdAt: Value(createdAt),
      sizeBytes: Value(sizeBytes),
      path: Value(path),
    );
  }

  factory OfflineBundleRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OfflineBundleRow(
      itineraryId: serializer.fromJson<String>(json['itineraryId']),
      version: serializer.fromJson<int>(json['version']),
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      sizeBytes: serializer.fromJson<int>(json['sizeBytes']),
      path: serializer.fromJson<String>(json['path']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'itineraryId': serializer.toJson<String>(itineraryId),
      'version': serializer.toJson<int>(version),
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'sizeBytes': serializer.toJson<int>(sizeBytes),
      'path': serializer.toJson<String>(path),
    };
  }

  OfflineBundleRow copyWith({
    String? itineraryId,
    int? version,
    String? id,
    DateTime? createdAt,
    int? sizeBytes,
    String? path,
  }) => OfflineBundleRow(
    itineraryId: itineraryId ?? this.itineraryId,
    version: version ?? this.version,
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    sizeBytes: sizeBytes ?? this.sizeBytes,
    path: path ?? this.path,
  );
  OfflineBundleRow copyWithCompanion(OfflineBundlesCompanion data) {
    return OfflineBundleRow(
      itineraryId: data.itineraryId.present
          ? data.itineraryId.value
          : this.itineraryId,
      version: data.version.present ? data.version.value : this.version,
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      sizeBytes: data.sizeBytes.present ? data.sizeBytes.value : this.sizeBytes,
      path: data.path.present ? data.path.value : this.path,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OfflineBundleRow(')
          ..write('itineraryId: $itineraryId, ')
          ..write('version: $version, ')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('sizeBytes: $sizeBytes, ')
          ..write('path: $path')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(itineraryId, version, id, createdAt, sizeBytes, path);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OfflineBundleRow &&
          other.itineraryId == this.itineraryId &&
          other.version == this.version &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.sizeBytes == this.sizeBytes &&
          other.path == this.path);
}

class OfflineBundlesCompanion extends UpdateCompanion<OfflineBundleRow> {
  final Value<String> itineraryId;
  final Value<int> version;
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<int> sizeBytes;
  final Value<String> path;
  final Value<int> rowid;
  const OfflineBundlesCompanion({
    this.itineraryId = const Value.absent(),
    this.version = const Value.absent(),
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.sizeBytes = const Value.absent(),
    this.path = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  OfflineBundlesCompanion.insert({
    required String itineraryId,
    required int version,
    required String id,
    required DateTime createdAt,
    required int sizeBytes,
    required String path,
    this.rowid = const Value.absent(),
  }) : itineraryId = Value(itineraryId),
       version = Value(version),
       id = Value(id),
       createdAt = Value(createdAt),
       sizeBytes = Value(sizeBytes),
       path = Value(path);
  static Insertable<OfflineBundleRow> custom({
    Expression<String>? itineraryId,
    Expression<int>? version,
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<int>? sizeBytes,
    Expression<String>? path,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (itineraryId != null) 'itinerary_id': itineraryId,
      if (version != null) 'version': version,
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (sizeBytes != null) 'size_bytes': sizeBytes,
      if (path != null) 'path': path,
      if (rowid != null) 'rowid': rowid,
    });
  }

  OfflineBundlesCompanion copyWith({
    Value<String>? itineraryId,
    Value<int>? version,
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<int>? sizeBytes,
    Value<String>? path,
    Value<int>? rowid,
  }) {
    return OfflineBundlesCompanion(
      itineraryId: itineraryId ?? this.itineraryId,
      version: version ?? this.version,
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      sizeBytes: sizeBytes ?? this.sizeBytes,
      path: path ?? this.path,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (itineraryId.present) {
      map['itinerary_id'] = Variable<String>(itineraryId.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (sizeBytes.present) {
      map['size_bytes'] = Variable<int>(sizeBytes.value);
    }
    if (path.present) {
      map['path'] = Variable<String>(path.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OfflineBundlesCompanion(')
          ..write('itineraryId: $itineraryId, ')
          ..write('version: $version, ')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('sizeBytes: $sizeBytes, ')
          ..write('path: $path, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BundleAssetsTable extends BundleAssets
    with TableInfo<$BundleAssetsTable, BundleAssetRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BundleAssetsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _bundleIdMeta = const VerificationMeta(
    'bundleId',
  );
  @override
  late final GeneratedColumn<String> bundleId = GeneratedColumn<String>(
    'bundle_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES offline_bundles (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _pathMeta = const VerificationMeta('path');
  @override
  late final GeneratedColumn<String> path = GeneratedColumn<String>(
    'path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _originalUrlMeta = const VerificationMeta(
    'originalUrl',
  );
  @override
  late final GeneratedColumn<String> originalUrl = GeneratedColumn<String>(
    'original_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _kindMeta = const VerificationMeta('kind');
  @override
  late final GeneratedColumn<String> kind = GeneratedColumn<String>(
    'kind',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sha256Meta = const VerificationMeta('sha256');
  @override
  late final GeneratedColumn<String> sha256 = GeneratedColumn<String>(
    'sha256',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    bundleId,
    path,
    originalUrl,
    kind,
    sha256,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bundle_assets';
  @override
  VerificationContext validateIntegrity(
    Insertable<BundleAssetRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('bundle_id')) {
      context.handle(
        _bundleIdMeta,
        bundleId.isAcceptableOrUnknown(data['bundle_id']!, _bundleIdMeta),
      );
    } else if (isInserting) {
      context.missing(_bundleIdMeta);
    }
    if (data.containsKey('path')) {
      context.handle(
        _pathMeta,
        path.isAcceptableOrUnknown(data['path']!, _pathMeta),
      );
    } else if (isInserting) {
      context.missing(_pathMeta);
    }
    if (data.containsKey('original_url')) {
      context.handle(
        _originalUrlMeta,
        originalUrl.isAcceptableOrUnknown(
          data['original_url']!,
          _originalUrlMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_originalUrlMeta);
    }
    if (data.containsKey('kind')) {
      context.handle(
        _kindMeta,
        kind.isAcceptableOrUnknown(data['kind']!, _kindMeta),
      );
    } else if (isInserting) {
      context.missing(_kindMeta);
    }
    if (data.containsKey('sha256')) {
      context.handle(
        _sha256Meta,
        sha256.isAcceptableOrUnknown(data['sha256']!, _sha256Meta),
      );
    } else if (isInserting) {
      context.missing(_sha256Meta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {bundleId, path};
  @override
  BundleAssetRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BundleAssetRow(
      bundleId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bundle_id'],
      )!,
      path: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}path'],
      )!,
      originalUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}original_url'],
      )!,
      kind: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kind'],
      )!,
      sha256: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sha256'],
      )!,
    );
  }

  @override
  $BundleAssetsTable createAlias(String alias) {
    return $BundleAssetsTable(attachedDatabase, alias);
  }
}

class BundleAssetRow extends DataClass implements Insertable<BundleAssetRow> {
  final String bundleId;
  final String path;
  final String originalUrl;
  final String kind;
  final String sha256;
  const BundleAssetRow({
    required this.bundleId,
    required this.path,
    required this.originalUrl,
    required this.kind,
    required this.sha256,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['bundle_id'] = Variable<String>(bundleId);
    map['path'] = Variable<String>(path);
    map['original_url'] = Variable<String>(originalUrl);
    map['kind'] = Variable<String>(kind);
    map['sha256'] = Variable<String>(sha256);
    return map;
  }

  BundleAssetsCompanion toCompanion(bool nullToAbsent) {
    return BundleAssetsCompanion(
      bundleId: Value(bundleId),
      path: Value(path),
      originalUrl: Value(originalUrl),
      kind: Value(kind),
      sha256: Value(sha256),
    );
  }

  factory BundleAssetRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BundleAssetRow(
      bundleId: serializer.fromJson<String>(json['bundleId']),
      path: serializer.fromJson<String>(json['path']),
      originalUrl: serializer.fromJson<String>(json['originalUrl']),
      kind: serializer.fromJson<String>(json['kind']),
      sha256: serializer.fromJson<String>(json['sha256']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'bundleId': serializer.toJson<String>(bundleId),
      'path': serializer.toJson<String>(path),
      'originalUrl': serializer.toJson<String>(originalUrl),
      'kind': serializer.toJson<String>(kind),
      'sha256': serializer.toJson<String>(sha256),
    };
  }

  BundleAssetRow copyWith({
    String? bundleId,
    String? path,
    String? originalUrl,
    String? kind,
    String? sha256,
  }) => BundleAssetRow(
    bundleId: bundleId ?? this.bundleId,
    path: path ?? this.path,
    originalUrl: originalUrl ?? this.originalUrl,
    kind: kind ?? this.kind,
    sha256: sha256 ?? this.sha256,
  );
  BundleAssetRow copyWithCompanion(BundleAssetsCompanion data) {
    return BundleAssetRow(
      bundleId: data.bundleId.present ? data.bundleId.value : this.bundleId,
      path: data.path.present ? data.path.value : this.path,
      originalUrl: data.originalUrl.present
          ? data.originalUrl.value
          : this.originalUrl,
      kind: data.kind.present ? data.kind.value : this.kind,
      sha256: data.sha256.present ? data.sha256.value : this.sha256,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BundleAssetRow(')
          ..write('bundleId: $bundleId, ')
          ..write('path: $path, ')
          ..write('originalUrl: $originalUrl, ')
          ..write('kind: $kind, ')
          ..write('sha256: $sha256')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(bundleId, path, originalUrl, kind, sha256);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BundleAssetRow &&
          other.bundleId == this.bundleId &&
          other.path == this.path &&
          other.originalUrl == this.originalUrl &&
          other.kind == this.kind &&
          other.sha256 == this.sha256);
}

class BundleAssetsCompanion extends UpdateCompanion<BundleAssetRow> {
  final Value<String> bundleId;
  final Value<String> path;
  final Value<String> originalUrl;
  final Value<String> kind;
  final Value<String> sha256;
  final Value<int> rowid;
  const BundleAssetsCompanion({
    this.bundleId = const Value.absent(),
    this.path = const Value.absent(),
    this.originalUrl = const Value.absent(),
    this.kind = const Value.absent(),
    this.sha256 = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BundleAssetsCompanion.insert({
    required String bundleId,
    required String path,
    required String originalUrl,
    required String kind,
    required String sha256,
    this.rowid = const Value.absent(),
  }) : bundleId = Value(bundleId),
       path = Value(path),
       originalUrl = Value(originalUrl),
       kind = Value(kind),
       sha256 = Value(sha256);
  static Insertable<BundleAssetRow> custom({
    Expression<String>? bundleId,
    Expression<String>? path,
    Expression<String>? originalUrl,
    Expression<String>? kind,
    Expression<String>? sha256,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (bundleId != null) 'bundle_id': bundleId,
      if (path != null) 'path': path,
      if (originalUrl != null) 'original_url': originalUrl,
      if (kind != null) 'kind': kind,
      if (sha256 != null) 'sha256': sha256,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BundleAssetsCompanion copyWith({
    Value<String>? bundleId,
    Value<String>? path,
    Value<String>? originalUrl,
    Value<String>? kind,
    Value<String>? sha256,
    Value<int>? rowid,
  }) {
    return BundleAssetsCompanion(
      bundleId: bundleId ?? this.bundleId,
      path: path ?? this.path,
      originalUrl: originalUrl ?? this.originalUrl,
      kind: kind ?? this.kind,
      sha256: sha256 ?? this.sha256,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (bundleId.present) {
      map['bundle_id'] = Variable<String>(bundleId.value);
    }
    if (path.present) {
      map['path'] = Variable<String>(path.value);
    }
    if (originalUrl.present) {
      map['original_url'] = Variable<String>(originalUrl.value);
    }
    if (kind.present) {
      map['kind'] = Variable<String>(kind.value);
    }
    if (sha256.present) {
      map['sha256'] = Variable<String>(sha256.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BundleAssetsCompanion(')
          ..write('bundleId: $bundleId, ')
          ..write('path: $path, ')
          ..write('originalUrl: $originalUrl, ')
          ..write('kind: $kind, ')
          ..write('sha256: $sha256, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LocalSearchIndexTable extends LocalSearchIndex
    with TableInfo<$LocalSearchIndexTable, LocalSearchIndexRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalSearchIndexTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _bundleIdMeta = const VerificationMeta(
    'bundleId',
  );
  @override
  late final GeneratedColumn<String> bundleId = GeneratedColumn<String>(
    'bundle_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES offline_bundles (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _tokenMeta = const VerificationMeta('token');
  @override
  late final GeneratedColumn<String> token = GeneratedColumn<String>(
    'token',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _itemIdsMeta = const VerificationMeta(
    'itemIds',
  );
  @override
  late final GeneratedColumn<String> itemIds = GeneratedColumn<String>(
    'item_ids',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [bundleId, token, itemIds];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_search_index';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocalSearchIndexRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('bundle_id')) {
      context.handle(
        _bundleIdMeta,
        bundleId.isAcceptableOrUnknown(data['bundle_id']!, _bundleIdMeta),
      );
    } else if (isInserting) {
      context.missing(_bundleIdMeta);
    }
    if (data.containsKey('token')) {
      context.handle(
        _tokenMeta,
        token.isAcceptableOrUnknown(data['token']!, _tokenMeta),
      );
    } else if (isInserting) {
      context.missing(_tokenMeta);
    }
    if (data.containsKey('item_ids')) {
      context.handle(
        _itemIdsMeta,
        itemIds.isAcceptableOrUnknown(data['item_ids']!, _itemIdsMeta),
      );
    } else if (isInserting) {
      context.missing(_itemIdsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {bundleId, token};
  @override
  LocalSearchIndexRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalSearchIndexRow(
      bundleId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bundle_id'],
      )!,
      token: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}token'],
      )!,
      itemIds: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}item_ids'],
      )!,
    );
  }

  @override
  $LocalSearchIndexTable createAlias(String alias) {
    return $LocalSearchIndexTable(attachedDatabase, alias);
  }
}

class LocalSearchIndexRow extends DataClass
    implements Insertable<LocalSearchIndexRow> {
  final String bundleId;
  final String token;
  final String itemIds;
  const LocalSearchIndexRow({
    required this.bundleId,
    required this.token,
    required this.itemIds,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['bundle_id'] = Variable<String>(bundleId);
    map['token'] = Variable<String>(token);
    map['item_ids'] = Variable<String>(itemIds);
    return map;
  }

  LocalSearchIndexCompanion toCompanion(bool nullToAbsent) {
    return LocalSearchIndexCompanion(
      bundleId: Value(bundleId),
      token: Value(token),
      itemIds: Value(itemIds),
    );
  }

  factory LocalSearchIndexRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalSearchIndexRow(
      bundleId: serializer.fromJson<String>(json['bundleId']),
      token: serializer.fromJson<String>(json['token']),
      itemIds: serializer.fromJson<String>(json['itemIds']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'bundleId': serializer.toJson<String>(bundleId),
      'token': serializer.toJson<String>(token),
      'itemIds': serializer.toJson<String>(itemIds),
    };
  }

  LocalSearchIndexRow copyWith({
    String? bundleId,
    String? token,
    String? itemIds,
  }) => LocalSearchIndexRow(
    bundleId: bundleId ?? this.bundleId,
    token: token ?? this.token,
    itemIds: itemIds ?? this.itemIds,
  );
  LocalSearchIndexRow copyWithCompanion(LocalSearchIndexCompanion data) {
    return LocalSearchIndexRow(
      bundleId: data.bundleId.present ? data.bundleId.value : this.bundleId,
      token: data.token.present ? data.token.value : this.token,
      itemIds: data.itemIds.present ? data.itemIds.value : this.itemIds,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalSearchIndexRow(')
          ..write('bundleId: $bundleId, ')
          ..write('token: $token, ')
          ..write('itemIds: $itemIds')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(bundleId, token, itemIds);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalSearchIndexRow &&
          other.bundleId == this.bundleId &&
          other.token == this.token &&
          other.itemIds == this.itemIds);
}

class LocalSearchIndexCompanion extends UpdateCompanion<LocalSearchIndexRow> {
  final Value<String> bundleId;
  final Value<String> token;
  final Value<String> itemIds;
  final Value<int> rowid;
  const LocalSearchIndexCompanion({
    this.bundleId = const Value.absent(),
    this.token = const Value.absent(),
    this.itemIds = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LocalSearchIndexCompanion.insert({
    required String bundleId,
    required String token,
    required String itemIds,
    this.rowid = const Value.absent(),
  }) : bundleId = Value(bundleId),
       token = Value(token),
       itemIds = Value(itemIds);
  static Insertable<LocalSearchIndexRow> custom({
    Expression<String>? bundleId,
    Expression<String>? token,
    Expression<String>? itemIds,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (bundleId != null) 'bundle_id': bundleId,
      if (token != null) 'token': token,
      if (itemIds != null) 'item_ids': itemIds,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocalSearchIndexCompanion copyWith({
    Value<String>? bundleId,
    Value<String>? token,
    Value<String>? itemIds,
    Value<int>? rowid,
  }) {
    return LocalSearchIndexCompanion(
      bundleId: bundleId ?? this.bundleId,
      token: token ?? this.token,
      itemIds: itemIds ?? this.itemIds,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (bundleId.present) {
      map['bundle_id'] = Variable<String>(bundleId.value);
    }
    if (token.present) {
      map['token'] = Variable<String>(token.value);
    }
    if (itemIds.present) {
      map['item_ids'] = Variable<String>(itemIds.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalSearchIndexCompanion(')
          ..write('bundleId: $bundleId, ')
          ..write('token: $token, ')
          ..write('itemIds: $itemIds, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $KeyValueStoreTable extends KeyValueStore
    with TableInfo<$KeyValueStoreTable, KeyValueStoreRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $KeyValueStoreTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [key, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'key_value_store';
  @override
  VerificationContext validateIntegrity(
    Insertable<KeyValueStoreRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  KeyValueStoreRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return KeyValueStoreRow(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
    );
  }

  @override
  $KeyValueStoreTable createAlias(String alias) {
    return $KeyValueStoreTable(attachedDatabase, alias);
  }
}

class KeyValueStoreRow extends DataClass
    implements Insertable<KeyValueStoreRow> {
  final String key;
  final String value;
  const KeyValueStoreRow({required this.key, required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    return map;
  }

  KeyValueStoreCompanion toCompanion(bool nullToAbsent) {
    return KeyValueStoreCompanion(key: Value(key), value: Value(value));
  }

  factory KeyValueStoreRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return KeyValueStoreRow(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
    };
  }

  KeyValueStoreRow copyWith({String? key, String? value}) =>
      KeyValueStoreRow(key: key ?? this.key, value: value ?? this.value);
  KeyValueStoreRow copyWithCompanion(KeyValueStoreCompanion data) {
    return KeyValueStoreRow(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('KeyValueStoreRow(')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is KeyValueStoreRow &&
          other.key == this.key &&
          other.value == this.value);
}

class KeyValueStoreCompanion extends UpdateCompanion<KeyValueStoreRow> {
  final Value<String> key;
  final Value<String> value;
  final Value<int> rowid;
  const KeyValueStoreCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  KeyValueStoreCompanion.insert({
    required String key,
    required String value,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       value = Value(value);
  static Insertable<KeyValueStoreRow> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  KeyValueStoreCompanion copyWith({
    Value<String>? key,
    Value<String>? value,
    Value<int>? rowid,
  }) {
    return KeyValueStoreCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('KeyValueStoreCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LocalTourCacheEntriesTable extends LocalTourCacheEntries
    with TableInfo<$LocalTourCacheEntriesTable, LocalTourCacheEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalTourCacheEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cityIdMeta = const VerificationMeta('cityId');
  @override
  late final GeneratedColumn<String> cityId = GeneratedColumn<String>(
    'city_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _taglineMeta = const VerificationMeta(
    'tagline',
  );
  @override
  late final GeneratedColumn<String> tagline = GeneratedColumn<String>(
    'tagline',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mainImageUrlMeta = const VerificationMeta(
    'mainImageUrl',
  );
  @override
  late final GeneratedColumn<String> mainImageUrl = GeneratedColumn<String>(
    'main_image_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _durationMinutesMeta = const VerificationMeta(
    'durationMinutes',
  );
  @override
  late final GeneratedColumn<int> durationMinutes = GeneratedColumn<int>(
    'duration_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priceUsdMeta = const VerificationMeta(
    'priceUsd',
  );
  @override
  late final GeneratedColumn<double> priceUsd = GeneratedColumn<double>(
    'price_usd',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryIdsMeta = const VerificationMeta(
    'categoryIds',
  );
  @override
  late final GeneratedColumn<String> categoryIds = GeneratedColumn<String>(
    'category_ids',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cachedAtMeta = const VerificationMeta(
    'cachedAt',
  );
  @override
  late final GeneratedColumn<DateTime> cachedAt = GeneratedColumn<DateTime>(
    'cached_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    cityId,
    name,
    tagline,
    mainImageUrl,
    durationMinutes,
    priceUsd,
    type,
    categoryIds,
    cachedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_tour_cache_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocalTourCacheEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('city_id')) {
      context.handle(
        _cityIdMeta,
        cityId.isAcceptableOrUnknown(data['city_id']!, _cityIdMeta),
      );
    } else if (isInserting) {
      context.missing(_cityIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('tagline')) {
      context.handle(
        _taglineMeta,
        tagline.isAcceptableOrUnknown(data['tagline']!, _taglineMeta),
      );
    } else if (isInserting) {
      context.missing(_taglineMeta);
    }
    if (data.containsKey('main_image_url')) {
      context.handle(
        _mainImageUrlMeta,
        mainImageUrl.isAcceptableOrUnknown(
          data['main_image_url']!,
          _mainImageUrlMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_mainImageUrlMeta);
    }
    if (data.containsKey('duration_minutes')) {
      context.handle(
        _durationMinutesMeta,
        durationMinutes.isAcceptableOrUnknown(
          data['duration_minutes']!,
          _durationMinutesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_durationMinutesMeta);
    }
    if (data.containsKey('price_usd')) {
      context.handle(
        _priceUsdMeta,
        priceUsd.isAcceptableOrUnknown(data['price_usd']!, _priceUsdMeta),
      );
    } else if (isInserting) {
      context.missing(_priceUsdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('category_ids')) {
      context.handle(
        _categoryIdsMeta,
        categoryIds.isAcceptableOrUnknown(
          data['category_ids']!,
          _categoryIdsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_categoryIdsMeta);
    }
    if (data.containsKey('cached_at')) {
      context.handle(
        _cachedAtMeta,
        cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_cachedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocalTourCacheEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalTourCacheEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      cityId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}city_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      tagline: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tagline'],
      )!,
      mainImageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}main_image_url'],
      )!,
      durationMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_minutes'],
      )!,
      priceUsd: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}price_usd'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      categoryIds: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category_ids'],
      )!,
      cachedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}cached_at'],
      )!,
    );
  }

  @override
  $LocalTourCacheEntriesTable createAlias(String alias) {
    return $LocalTourCacheEntriesTable(attachedDatabase, alias);
  }
}

class LocalTourCacheEntry extends DataClass
    implements Insertable<LocalTourCacheEntry> {
  final String id;
  final String cityId;
  final String name;
  final String tagline;
  final String mainImageUrl;
  final int durationMinutes;
  final double priceUsd;
  final String type;
  final String categoryIds;
  final DateTime cachedAt;
  const LocalTourCacheEntry({
    required this.id,
    required this.cityId,
    required this.name,
    required this.tagline,
    required this.mainImageUrl,
    required this.durationMinutes,
    required this.priceUsd,
    required this.type,
    required this.categoryIds,
    required this.cachedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['city_id'] = Variable<String>(cityId);
    map['name'] = Variable<String>(name);
    map['tagline'] = Variable<String>(tagline);
    map['main_image_url'] = Variable<String>(mainImageUrl);
    map['duration_minutes'] = Variable<int>(durationMinutes);
    map['price_usd'] = Variable<double>(priceUsd);
    map['type'] = Variable<String>(type);
    map['category_ids'] = Variable<String>(categoryIds);
    map['cached_at'] = Variable<DateTime>(cachedAt);
    return map;
  }

  LocalTourCacheEntriesCompanion toCompanion(bool nullToAbsent) {
    return LocalTourCacheEntriesCompanion(
      id: Value(id),
      cityId: Value(cityId),
      name: Value(name),
      tagline: Value(tagline),
      mainImageUrl: Value(mainImageUrl),
      durationMinutes: Value(durationMinutes),
      priceUsd: Value(priceUsd),
      type: Value(type),
      categoryIds: Value(categoryIds),
      cachedAt: Value(cachedAt),
    );
  }

  factory LocalTourCacheEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalTourCacheEntry(
      id: serializer.fromJson<String>(json['id']),
      cityId: serializer.fromJson<String>(json['cityId']),
      name: serializer.fromJson<String>(json['name']),
      tagline: serializer.fromJson<String>(json['tagline']),
      mainImageUrl: serializer.fromJson<String>(json['mainImageUrl']),
      durationMinutes: serializer.fromJson<int>(json['durationMinutes']),
      priceUsd: serializer.fromJson<double>(json['priceUsd']),
      type: serializer.fromJson<String>(json['type']),
      categoryIds: serializer.fromJson<String>(json['categoryIds']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'cityId': serializer.toJson<String>(cityId),
      'name': serializer.toJson<String>(name),
      'tagline': serializer.toJson<String>(tagline),
      'mainImageUrl': serializer.toJson<String>(mainImageUrl),
      'durationMinutes': serializer.toJson<int>(durationMinutes),
      'priceUsd': serializer.toJson<double>(priceUsd),
      'type': serializer.toJson<String>(type),
      'categoryIds': serializer.toJson<String>(categoryIds),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
    };
  }

  LocalTourCacheEntry copyWith({
    String? id,
    String? cityId,
    String? name,
    String? tagline,
    String? mainImageUrl,
    int? durationMinutes,
    double? priceUsd,
    String? type,
    String? categoryIds,
    DateTime? cachedAt,
  }) => LocalTourCacheEntry(
    id: id ?? this.id,
    cityId: cityId ?? this.cityId,
    name: name ?? this.name,
    tagline: tagline ?? this.tagline,
    mainImageUrl: mainImageUrl ?? this.mainImageUrl,
    durationMinutes: durationMinutes ?? this.durationMinutes,
    priceUsd: priceUsd ?? this.priceUsd,
    type: type ?? this.type,
    categoryIds: categoryIds ?? this.categoryIds,
    cachedAt: cachedAt ?? this.cachedAt,
  );
  LocalTourCacheEntry copyWithCompanion(LocalTourCacheEntriesCompanion data) {
    return LocalTourCacheEntry(
      id: data.id.present ? data.id.value : this.id,
      cityId: data.cityId.present ? data.cityId.value : this.cityId,
      name: data.name.present ? data.name.value : this.name,
      tagline: data.tagline.present ? data.tagline.value : this.tagline,
      mainImageUrl: data.mainImageUrl.present
          ? data.mainImageUrl.value
          : this.mainImageUrl,
      durationMinutes: data.durationMinutes.present
          ? data.durationMinutes.value
          : this.durationMinutes,
      priceUsd: data.priceUsd.present ? data.priceUsd.value : this.priceUsd,
      type: data.type.present ? data.type.value : this.type,
      categoryIds: data.categoryIds.present
          ? data.categoryIds.value
          : this.categoryIds,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalTourCacheEntry(')
          ..write('id: $id, ')
          ..write('cityId: $cityId, ')
          ..write('name: $name, ')
          ..write('tagline: $tagline, ')
          ..write('mainImageUrl: $mainImageUrl, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('priceUsd: $priceUsd, ')
          ..write('type: $type, ')
          ..write('categoryIds: $categoryIds, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    cityId,
    name,
    tagline,
    mainImageUrl,
    durationMinutes,
    priceUsd,
    type,
    categoryIds,
    cachedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalTourCacheEntry &&
          other.id == this.id &&
          other.cityId == this.cityId &&
          other.name == this.name &&
          other.tagline == this.tagline &&
          other.mainImageUrl == this.mainImageUrl &&
          other.durationMinutes == this.durationMinutes &&
          other.priceUsd == this.priceUsd &&
          other.type == this.type &&
          other.categoryIds == this.categoryIds &&
          other.cachedAt == this.cachedAt);
}

class LocalTourCacheEntriesCompanion
    extends UpdateCompanion<LocalTourCacheEntry> {
  final Value<String> id;
  final Value<String> cityId;
  final Value<String> name;
  final Value<String> tagline;
  final Value<String> mainImageUrl;
  final Value<int> durationMinutes;
  final Value<double> priceUsd;
  final Value<String> type;
  final Value<String> categoryIds;
  final Value<DateTime> cachedAt;
  final Value<int> rowid;
  const LocalTourCacheEntriesCompanion({
    this.id = const Value.absent(),
    this.cityId = const Value.absent(),
    this.name = const Value.absent(),
    this.tagline = const Value.absent(),
    this.mainImageUrl = const Value.absent(),
    this.durationMinutes = const Value.absent(),
    this.priceUsd = const Value.absent(),
    this.type = const Value.absent(),
    this.categoryIds = const Value.absent(),
    this.cachedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LocalTourCacheEntriesCompanion.insert({
    required String id,
    required String cityId,
    required String name,
    required String tagline,
    required String mainImageUrl,
    required int durationMinutes,
    required double priceUsd,
    required String type,
    required String categoryIds,
    required DateTime cachedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       cityId = Value(cityId),
       name = Value(name),
       tagline = Value(tagline),
       mainImageUrl = Value(mainImageUrl),
       durationMinutes = Value(durationMinutes),
       priceUsd = Value(priceUsd),
       type = Value(type),
       categoryIds = Value(categoryIds),
       cachedAt = Value(cachedAt);
  static Insertable<LocalTourCacheEntry> custom({
    Expression<String>? id,
    Expression<String>? cityId,
    Expression<String>? name,
    Expression<String>? tagline,
    Expression<String>? mainImageUrl,
    Expression<int>? durationMinutes,
    Expression<double>? priceUsd,
    Expression<String>? type,
    Expression<String>? categoryIds,
    Expression<DateTime>? cachedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (cityId != null) 'city_id': cityId,
      if (name != null) 'name': name,
      if (tagline != null) 'tagline': tagline,
      if (mainImageUrl != null) 'main_image_url': mainImageUrl,
      if (durationMinutes != null) 'duration_minutes': durationMinutes,
      if (priceUsd != null) 'price_usd': priceUsd,
      if (type != null) 'type': type,
      if (categoryIds != null) 'category_ids': categoryIds,
      if (cachedAt != null) 'cached_at': cachedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocalTourCacheEntriesCompanion copyWith({
    Value<String>? id,
    Value<String>? cityId,
    Value<String>? name,
    Value<String>? tagline,
    Value<String>? mainImageUrl,
    Value<int>? durationMinutes,
    Value<double>? priceUsd,
    Value<String>? type,
    Value<String>? categoryIds,
    Value<DateTime>? cachedAt,
    Value<int>? rowid,
  }) {
    return LocalTourCacheEntriesCompanion(
      id: id ?? this.id,
      cityId: cityId ?? this.cityId,
      name: name ?? this.name,
      tagline: tagline ?? this.tagline,
      mainImageUrl: mainImageUrl ?? this.mainImageUrl,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      priceUsd: priceUsd ?? this.priceUsd,
      type: type ?? this.type,
      categoryIds: categoryIds ?? this.categoryIds,
      cachedAt: cachedAt ?? this.cachedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (cityId.present) {
      map['city_id'] = Variable<String>(cityId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (tagline.present) {
      map['tagline'] = Variable<String>(tagline.value);
    }
    if (mainImageUrl.present) {
      map['main_image_url'] = Variable<String>(mainImageUrl.value);
    }
    if (durationMinutes.present) {
      map['duration_minutes'] = Variable<int>(durationMinutes.value);
    }
    if (priceUsd.present) {
      map['price_usd'] = Variable<double>(priceUsd.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (categoryIds.present) {
      map['category_ids'] = Variable<String>(categoryIds.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalTourCacheEntriesCompanion(')
          ..write('id: $id, ')
          ..write('cityId: $cityId, ')
          ..write('name: $name, ')
          ..write('tagline: $tagline, ')
          ..write('mainImageUrl: $mainImageUrl, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('priceUsd: $priceUsd, ')
          ..write('type: $type, ')
          ..write('categoryIds: $categoryIds, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LocalSavedTourEntriesTable extends LocalSavedTourEntries
    with TableInfo<$LocalSavedTourEntriesTable, LocalSavedTourEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalSavedTourEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tourIdMeta = const VerificationMeta('tourId');
  @override
  late final GeneratedColumn<String> tourId = GeneratedColumn<String>(
    'tour_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _savedAtMeta = const VerificationMeta(
    'savedAt',
  );
  @override
  late final GeneratedColumn<DateTime> savedAt = GeneratedColumn<DateTime>(
    'saved_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastOpenedAtMeta = const VerificationMeta(
    'lastOpenedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastOpenedAt = GeneratedColumn<DateTime>(
    'last_opened_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    tourId,
    userId,
    savedAt,
    lastOpenedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_saved_tour_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocalSavedTourEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('tour_id')) {
      context.handle(
        _tourIdMeta,
        tourId.isAcceptableOrUnknown(data['tour_id']!, _tourIdMeta),
      );
    } else if (isInserting) {
      context.missing(_tourIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('saved_at')) {
      context.handle(
        _savedAtMeta,
        savedAt.isAcceptableOrUnknown(data['saved_at']!, _savedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_savedAtMeta);
    }
    if (data.containsKey('last_opened_at')) {
      context.handle(
        _lastOpenedAtMeta,
        lastOpenedAt.isAcceptableOrUnknown(
          data['last_opened_at']!,
          _lastOpenedAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocalSavedTourEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalSavedTourEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      tourId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tour_id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      savedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}saved_at'],
      )!,
      lastOpenedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_opened_at'],
      ),
    );
  }

  @override
  $LocalSavedTourEntriesTable createAlias(String alias) {
    return $LocalSavedTourEntriesTable(attachedDatabase, alias);
  }
}

class LocalSavedTourEntry extends DataClass
    implements Insertable<LocalSavedTourEntry> {
  final String id;
  final String tourId;
  final String userId;
  final DateTime savedAt;
  final DateTime? lastOpenedAt;
  const LocalSavedTourEntry({
    required this.id,
    required this.tourId,
    required this.userId,
    required this.savedAt,
    this.lastOpenedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['tour_id'] = Variable<String>(tourId);
    map['user_id'] = Variable<String>(userId);
    map['saved_at'] = Variable<DateTime>(savedAt);
    if (!nullToAbsent || lastOpenedAt != null) {
      map['last_opened_at'] = Variable<DateTime>(lastOpenedAt);
    }
    return map;
  }

  LocalSavedTourEntriesCompanion toCompanion(bool nullToAbsent) {
    return LocalSavedTourEntriesCompanion(
      id: Value(id),
      tourId: Value(tourId),
      userId: Value(userId),
      savedAt: Value(savedAt),
      lastOpenedAt: lastOpenedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastOpenedAt),
    );
  }

  factory LocalSavedTourEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalSavedTourEntry(
      id: serializer.fromJson<String>(json['id']),
      tourId: serializer.fromJson<String>(json['tourId']),
      userId: serializer.fromJson<String>(json['userId']),
      savedAt: serializer.fromJson<DateTime>(json['savedAt']),
      lastOpenedAt: serializer.fromJson<DateTime?>(json['lastOpenedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'tourId': serializer.toJson<String>(tourId),
      'userId': serializer.toJson<String>(userId),
      'savedAt': serializer.toJson<DateTime>(savedAt),
      'lastOpenedAt': serializer.toJson<DateTime?>(lastOpenedAt),
    };
  }

  LocalSavedTourEntry copyWith({
    String? id,
    String? tourId,
    String? userId,
    DateTime? savedAt,
    Value<DateTime?> lastOpenedAt = const Value.absent(),
  }) => LocalSavedTourEntry(
    id: id ?? this.id,
    tourId: tourId ?? this.tourId,
    userId: userId ?? this.userId,
    savedAt: savedAt ?? this.savedAt,
    lastOpenedAt: lastOpenedAt.present ? lastOpenedAt.value : this.lastOpenedAt,
  );
  LocalSavedTourEntry copyWithCompanion(LocalSavedTourEntriesCompanion data) {
    return LocalSavedTourEntry(
      id: data.id.present ? data.id.value : this.id,
      tourId: data.tourId.present ? data.tourId.value : this.tourId,
      userId: data.userId.present ? data.userId.value : this.userId,
      savedAt: data.savedAt.present ? data.savedAt.value : this.savedAt,
      lastOpenedAt: data.lastOpenedAt.present
          ? data.lastOpenedAt.value
          : this.lastOpenedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalSavedTourEntry(')
          ..write('id: $id, ')
          ..write('tourId: $tourId, ')
          ..write('userId: $userId, ')
          ..write('savedAt: $savedAt, ')
          ..write('lastOpenedAt: $lastOpenedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, tourId, userId, savedAt, lastOpenedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalSavedTourEntry &&
          other.id == this.id &&
          other.tourId == this.tourId &&
          other.userId == this.userId &&
          other.savedAt == this.savedAt &&
          other.lastOpenedAt == this.lastOpenedAt);
}

class LocalSavedTourEntriesCompanion
    extends UpdateCompanion<LocalSavedTourEntry> {
  final Value<String> id;
  final Value<String> tourId;
  final Value<String> userId;
  final Value<DateTime> savedAt;
  final Value<DateTime?> lastOpenedAt;
  final Value<int> rowid;
  const LocalSavedTourEntriesCompanion({
    this.id = const Value.absent(),
    this.tourId = const Value.absent(),
    this.userId = const Value.absent(),
    this.savedAt = const Value.absent(),
    this.lastOpenedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LocalSavedTourEntriesCompanion.insert({
    required String id,
    required String tourId,
    required String userId,
    required DateTime savedAt,
    this.lastOpenedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       tourId = Value(tourId),
       userId = Value(userId),
       savedAt = Value(savedAt);
  static Insertable<LocalSavedTourEntry> custom({
    Expression<String>? id,
    Expression<String>? tourId,
    Expression<String>? userId,
    Expression<DateTime>? savedAt,
    Expression<DateTime>? lastOpenedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tourId != null) 'tour_id': tourId,
      if (userId != null) 'user_id': userId,
      if (savedAt != null) 'saved_at': savedAt,
      if (lastOpenedAt != null) 'last_opened_at': lastOpenedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocalSavedTourEntriesCompanion copyWith({
    Value<String>? id,
    Value<String>? tourId,
    Value<String>? userId,
    Value<DateTime>? savedAt,
    Value<DateTime?>? lastOpenedAt,
    Value<int>? rowid,
  }) {
    return LocalSavedTourEntriesCompanion(
      id: id ?? this.id,
      tourId: tourId ?? this.tourId,
      userId: userId ?? this.userId,
      savedAt: savedAt ?? this.savedAt,
      lastOpenedAt: lastOpenedAt ?? this.lastOpenedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (tourId.present) {
      map['tour_id'] = Variable<String>(tourId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (savedAt.present) {
      map['saved_at'] = Variable<DateTime>(savedAt.value);
    }
    if (lastOpenedAt.present) {
      map['last_opened_at'] = Variable<DateTime>(lastOpenedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalSavedTourEntriesCompanion(')
          ..write('id: $id, ')
          ..write('tourId: $tourId, ')
          ..write('userId: $userId, ')
          ..write('savedAt: $savedAt, ')
          ..write('lastOpenedAt: $lastOpenedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LocalTourProgressEntriesTable extends LocalTourProgressEntries
    with TableInfo<$LocalTourProgressEntriesTable, LocalTourProgressEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalTourProgressEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _tourIdMeta = const VerificationMeta('tourId');
  @override
  late final GeneratedColumn<String> tourId = GeneratedColumn<String>(
    'tour_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _audioPositionMsMeta = const VerificationMeta(
    'audioPositionMs',
  );
  @override
  late final GeneratedColumn<int> audioPositionMs = GeneratedColumn<int>(
    'audio_position_ms',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _currentSectionMeta = const VerificationMeta(
    'currentSection',
  );
  @override
  late final GeneratedColumn<int> currentSection = GeneratedColumn<int>(
    'current_section',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _completedMeta = const VerificationMeta(
    'completed',
  );
  @override
  late final GeneratedColumn<bool> completed = GeneratedColumn<bool>(
    'completed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("completed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _lastUpdatedAtMeta = const VerificationMeta(
    'lastUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastUpdatedAt =
      GeneratedColumn<DateTime>(
        'last_updated_at',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  @override
  List<GeneratedColumn> get $columns => [
    tourId,
    userId,
    audioPositionMs,
    currentSection,
    completed,
    lastUpdatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_tour_progress_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocalTourProgressEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('tour_id')) {
      context.handle(
        _tourIdMeta,
        tourId.isAcceptableOrUnknown(data['tour_id']!, _tourIdMeta),
      );
    } else if (isInserting) {
      context.missing(_tourIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('audio_position_ms')) {
      context.handle(
        _audioPositionMsMeta,
        audioPositionMs.isAcceptableOrUnknown(
          data['audio_position_ms']!,
          _audioPositionMsMeta,
        ),
      );
    }
    if (data.containsKey('current_section')) {
      context.handle(
        _currentSectionMeta,
        currentSection.isAcceptableOrUnknown(
          data['current_section']!,
          _currentSectionMeta,
        ),
      );
    }
    if (data.containsKey('completed')) {
      context.handle(
        _completedMeta,
        completed.isAcceptableOrUnknown(data['completed']!, _completedMeta),
      );
    }
    if (data.containsKey('last_updated_at')) {
      context.handle(
        _lastUpdatedAtMeta,
        lastUpdatedAt.isAcceptableOrUnknown(
          data['last_updated_at']!,
          _lastUpdatedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lastUpdatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {tourId, userId};
  @override
  LocalTourProgressEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalTourProgressEntry(
      tourId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tour_id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      audioPositionMs: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}audio_position_ms'],
      )!,
      currentSection: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}current_section'],
      )!,
      completed: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}completed'],
      )!,
      lastUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_updated_at'],
      )!,
    );
  }

  @override
  $LocalTourProgressEntriesTable createAlias(String alias) {
    return $LocalTourProgressEntriesTable(attachedDatabase, alias);
  }
}

class LocalTourProgressEntry extends DataClass
    implements Insertable<LocalTourProgressEntry> {
  final String tourId;
  final String userId;
  final int audioPositionMs;
  final int currentSection;
  final bool completed;
  final DateTime lastUpdatedAt;
  const LocalTourProgressEntry({
    required this.tourId,
    required this.userId,
    required this.audioPositionMs,
    required this.currentSection,
    required this.completed,
    required this.lastUpdatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['tour_id'] = Variable<String>(tourId);
    map['user_id'] = Variable<String>(userId);
    map['audio_position_ms'] = Variable<int>(audioPositionMs);
    map['current_section'] = Variable<int>(currentSection);
    map['completed'] = Variable<bool>(completed);
    map['last_updated_at'] = Variable<DateTime>(lastUpdatedAt);
    return map;
  }

  LocalTourProgressEntriesCompanion toCompanion(bool nullToAbsent) {
    return LocalTourProgressEntriesCompanion(
      tourId: Value(tourId),
      userId: Value(userId),
      audioPositionMs: Value(audioPositionMs),
      currentSection: Value(currentSection),
      completed: Value(completed),
      lastUpdatedAt: Value(lastUpdatedAt),
    );
  }

  factory LocalTourProgressEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalTourProgressEntry(
      tourId: serializer.fromJson<String>(json['tourId']),
      userId: serializer.fromJson<String>(json['userId']),
      audioPositionMs: serializer.fromJson<int>(json['audioPositionMs']),
      currentSection: serializer.fromJson<int>(json['currentSection']),
      completed: serializer.fromJson<bool>(json['completed']),
      lastUpdatedAt: serializer.fromJson<DateTime>(json['lastUpdatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'tourId': serializer.toJson<String>(tourId),
      'userId': serializer.toJson<String>(userId),
      'audioPositionMs': serializer.toJson<int>(audioPositionMs),
      'currentSection': serializer.toJson<int>(currentSection),
      'completed': serializer.toJson<bool>(completed),
      'lastUpdatedAt': serializer.toJson<DateTime>(lastUpdatedAt),
    };
  }

  LocalTourProgressEntry copyWith({
    String? tourId,
    String? userId,
    int? audioPositionMs,
    int? currentSection,
    bool? completed,
    DateTime? lastUpdatedAt,
  }) => LocalTourProgressEntry(
    tourId: tourId ?? this.tourId,
    userId: userId ?? this.userId,
    audioPositionMs: audioPositionMs ?? this.audioPositionMs,
    currentSection: currentSection ?? this.currentSection,
    completed: completed ?? this.completed,
    lastUpdatedAt: lastUpdatedAt ?? this.lastUpdatedAt,
  );
  LocalTourProgressEntry copyWithCompanion(
    LocalTourProgressEntriesCompanion data,
  ) {
    return LocalTourProgressEntry(
      tourId: data.tourId.present ? data.tourId.value : this.tourId,
      userId: data.userId.present ? data.userId.value : this.userId,
      audioPositionMs: data.audioPositionMs.present
          ? data.audioPositionMs.value
          : this.audioPositionMs,
      currentSection: data.currentSection.present
          ? data.currentSection.value
          : this.currentSection,
      completed: data.completed.present ? data.completed.value : this.completed,
      lastUpdatedAt: data.lastUpdatedAt.present
          ? data.lastUpdatedAt.value
          : this.lastUpdatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalTourProgressEntry(')
          ..write('tourId: $tourId, ')
          ..write('userId: $userId, ')
          ..write('audioPositionMs: $audioPositionMs, ')
          ..write('currentSection: $currentSection, ')
          ..write('completed: $completed, ')
          ..write('lastUpdatedAt: $lastUpdatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    tourId,
    userId,
    audioPositionMs,
    currentSection,
    completed,
    lastUpdatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalTourProgressEntry &&
          other.tourId == this.tourId &&
          other.userId == this.userId &&
          other.audioPositionMs == this.audioPositionMs &&
          other.currentSection == this.currentSection &&
          other.completed == this.completed &&
          other.lastUpdatedAt == this.lastUpdatedAt);
}

class LocalTourProgressEntriesCompanion
    extends UpdateCompanion<LocalTourProgressEntry> {
  final Value<String> tourId;
  final Value<String> userId;
  final Value<int> audioPositionMs;
  final Value<int> currentSection;
  final Value<bool> completed;
  final Value<DateTime> lastUpdatedAt;
  final Value<int> rowid;
  const LocalTourProgressEntriesCompanion({
    this.tourId = const Value.absent(),
    this.userId = const Value.absent(),
    this.audioPositionMs = const Value.absent(),
    this.currentSection = const Value.absent(),
    this.completed = const Value.absent(),
    this.lastUpdatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LocalTourProgressEntriesCompanion.insert({
    required String tourId,
    required String userId,
    this.audioPositionMs = const Value.absent(),
    this.currentSection = const Value.absent(),
    this.completed = const Value.absent(),
    required DateTime lastUpdatedAt,
    this.rowid = const Value.absent(),
  }) : tourId = Value(tourId),
       userId = Value(userId),
       lastUpdatedAt = Value(lastUpdatedAt);
  static Insertable<LocalTourProgressEntry> custom({
    Expression<String>? tourId,
    Expression<String>? userId,
    Expression<int>? audioPositionMs,
    Expression<int>? currentSection,
    Expression<bool>? completed,
    Expression<DateTime>? lastUpdatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (tourId != null) 'tour_id': tourId,
      if (userId != null) 'user_id': userId,
      if (audioPositionMs != null) 'audio_position_ms': audioPositionMs,
      if (currentSection != null) 'current_section': currentSection,
      if (completed != null) 'completed': completed,
      if (lastUpdatedAt != null) 'last_updated_at': lastUpdatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocalTourProgressEntriesCompanion copyWith({
    Value<String>? tourId,
    Value<String>? userId,
    Value<int>? audioPositionMs,
    Value<int>? currentSection,
    Value<bool>? completed,
    Value<DateTime>? lastUpdatedAt,
    Value<int>? rowid,
  }) {
    return LocalTourProgressEntriesCompanion(
      tourId: tourId ?? this.tourId,
      userId: userId ?? this.userId,
      audioPositionMs: audioPositionMs ?? this.audioPositionMs,
      currentSection: currentSection ?? this.currentSection,
      completed: completed ?? this.completed,
      lastUpdatedAt: lastUpdatedAt ?? this.lastUpdatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (tourId.present) {
      map['tour_id'] = Variable<String>(tourId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (audioPositionMs.present) {
      map['audio_position_ms'] = Variable<int>(audioPositionMs.value);
    }
    if (currentSection.present) {
      map['current_section'] = Variable<int>(currentSection.value);
    }
    if (completed.present) {
      map['completed'] = Variable<bool>(completed.value);
    }
    if (lastUpdatedAt.present) {
      map['last_updated_at'] = Variable<DateTime>(lastUpdatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalTourProgressEntriesCompanion(')
          ..write('tourId: $tourId, ')
          ..write('userId: $userId, ')
          ..write('audioPositionMs: $audioPositionMs, ')
          ..write('currentSection: $currentSection, ')
          ..write('completed: $completed, ')
          ..write('lastUpdatedAt: $lastUpdatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LocalTourDownloadEntriesTable extends LocalTourDownloadEntries
    with TableInfo<$LocalTourDownloadEntriesTable, LocalTourDownloadEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalTourDownloadEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _tourIdMeta = const VerificationMeta('tourId');
  @override
  late final GeneratedColumn<String> tourId = GeneratedColumn<String>(
    'tour_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contentJsonMeta = const VerificationMeta(
    'contentJson',
  );
  @override
  late final GeneratedColumn<String> contentJson = GeneratedColumn<String>(
    'content_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _audioFilePathMeta = const VerificationMeta(
    'audioFilePath',
  );
  @override
  late final GeneratedColumn<String> audioFilePath = GeneratedColumn<String>(
    'audio_file_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _languageCodeMeta = const VerificationMeta(
    'languageCode',
  );
  @override
  late final GeneratedColumn<String> languageCode = GeneratedColumn<String>(
    'language_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _downloadedAtMeta = const VerificationMeta(
    'downloadedAt',
  );
  @override
  late final GeneratedColumn<DateTime> downloadedAt = GeneratedColumn<DateTime>(
    'downloaded_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    tourId,
    contentJson,
    audioFilePath,
    languageCode,
    downloadedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_tour_download_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocalTourDownloadEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('tour_id')) {
      context.handle(
        _tourIdMeta,
        tourId.isAcceptableOrUnknown(data['tour_id']!, _tourIdMeta),
      );
    } else if (isInserting) {
      context.missing(_tourIdMeta);
    }
    if (data.containsKey('content_json')) {
      context.handle(
        _contentJsonMeta,
        contentJson.isAcceptableOrUnknown(
          data['content_json']!,
          _contentJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_contentJsonMeta);
    }
    if (data.containsKey('audio_file_path')) {
      context.handle(
        _audioFilePathMeta,
        audioFilePath.isAcceptableOrUnknown(
          data['audio_file_path']!,
          _audioFilePathMeta,
        ),
      );
    }
    if (data.containsKey('language_code')) {
      context.handle(
        _languageCodeMeta,
        languageCode.isAcceptableOrUnknown(
          data['language_code']!,
          _languageCodeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_languageCodeMeta);
    }
    if (data.containsKey('downloaded_at')) {
      context.handle(
        _downloadedAtMeta,
        downloadedAt.isAcceptableOrUnknown(
          data['downloaded_at']!,
          _downloadedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_downloadedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {tourId, languageCode};
  @override
  LocalTourDownloadEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalTourDownloadEntry(
      tourId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tour_id'],
      )!,
      contentJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content_json'],
      )!,
      audioFilePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}audio_file_path'],
      ),
      languageCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}language_code'],
      )!,
      downloadedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}downloaded_at'],
      )!,
    );
  }

  @override
  $LocalTourDownloadEntriesTable createAlias(String alias) {
    return $LocalTourDownloadEntriesTable(attachedDatabase, alias);
  }
}

class LocalTourDownloadEntry extends DataClass
    implements Insertable<LocalTourDownloadEntry> {
  final String tourId;
  final String contentJson;
  final String? audioFilePath;
  final String languageCode;
  final DateTime downloadedAt;
  const LocalTourDownloadEntry({
    required this.tourId,
    required this.contentJson,
    this.audioFilePath,
    required this.languageCode,
    required this.downloadedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['tour_id'] = Variable<String>(tourId);
    map['content_json'] = Variable<String>(contentJson);
    if (!nullToAbsent || audioFilePath != null) {
      map['audio_file_path'] = Variable<String>(audioFilePath);
    }
    map['language_code'] = Variable<String>(languageCode);
    map['downloaded_at'] = Variable<DateTime>(downloadedAt);
    return map;
  }

  LocalTourDownloadEntriesCompanion toCompanion(bool nullToAbsent) {
    return LocalTourDownloadEntriesCompanion(
      tourId: Value(tourId),
      contentJson: Value(contentJson),
      audioFilePath: audioFilePath == null && nullToAbsent
          ? const Value.absent()
          : Value(audioFilePath),
      languageCode: Value(languageCode),
      downloadedAt: Value(downloadedAt),
    );
  }

  factory LocalTourDownloadEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalTourDownloadEntry(
      tourId: serializer.fromJson<String>(json['tourId']),
      contentJson: serializer.fromJson<String>(json['contentJson']),
      audioFilePath: serializer.fromJson<String?>(json['audioFilePath']),
      languageCode: serializer.fromJson<String>(json['languageCode']),
      downloadedAt: serializer.fromJson<DateTime>(json['downloadedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'tourId': serializer.toJson<String>(tourId),
      'contentJson': serializer.toJson<String>(contentJson),
      'audioFilePath': serializer.toJson<String?>(audioFilePath),
      'languageCode': serializer.toJson<String>(languageCode),
      'downloadedAt': serializer.toJson<DateTime>(downloadedAt),
    };
  }

  LocalTourDownloadEntry copyWith({
    String? tourId,
    String? contentJson,
    Value<String?> audioFilePath = const Value.absent(),
    String? languageCode,
    DateTime? downloadedAt,
  }) => LocalTourDownloadEntry(
    tourId: tourId ?? this.tourId,
    contentJson: contentJson ?? this.contentJson,
    audioFilePath: audioFilePath.present
        ? audioFilePath.value
        : this.audioFilePath,
    languageCode: languageCode ?? this.languageCode,
    downloadedAt: downloadedAt ?? this.downloadedAt,
  );
  LocalTourDownloadEntry copyWithCompanion(
    LocalTourDownloadEntriesCompanion data,
  ) {
    return LocalTourDownloadEntry(
      tourId: data.tourId.present ? data.tourId.value : this.tourId,
      contentJson: data.contentJson.present
          ? data.contentJson.value
          : this.contentJson,
      audioFilePath: data.audioFilePath.present
          ? data.audioFilePath.value
          : this.audioFilePath,
      languageCode: data.languageCode.present
          ? data.languageCode.value
          : this.languageCode,
      downloadedAt: data.downloadedAt.present
          ? data.downloadedAt.value
          : this.downloadedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalTourDownloadEntry(')
          ..write('tourId: $tourId, ')
          ..write('contentJson: $contentJson, ')
          ..write('audioFilePath: $audioFilePath, ')
          ..write('languageCode: $languageCode, ')
          ..write('downloadedAt: $downloadedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    tourId,
    contentJson,
    audioFilePath,
    languageCode,
    downloadedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalTourDownloadEntry &&
          other.tourId == this.tourId &&
          other.contentJson == this.contentJson &&
          other.audioFilePath == this.audioFilePath &&
          other.languageCode == this.languageCode &&
          other.downloadedAt == this.downloadedAt);
}

class LocalTourDownloadEntriesCompanion
    extends UpdateCompanion<LocalTourDownloadEntry> {
  final Value<String> tourId;
  final Value<String> contentJson;
  final Value<String?> audioFilePath;
  final Value<String> languageCode;
  final Value<DateTime> downloadedAt;
  final Value<int> rowid;
  const LocalTourDownloadEntriesCompanion({
    this.tourId = const Value.absent(),
    this.contentJson = const Value.absent(),
    this.audioFilePath = const Value.absent(),
    this.languageCode = const Value.absent(),
    this.downloadedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LocalTourDownloadEntriesCompanion.insert({
    required String tourId,
    required String contentJson,
    this.audioFilePath = const Value.absent(),
    required String languageCode,
    required DateTime downloadedAt,
    this.rowid = const Value.absent(),
  }) : tourId = Value(tourId),
       contentJson = Value(contentJson),
       languageCode = Value(languageCode),
       downloadedAt = Value(downloadedAt);
  static Insertable<LocalTourDownloadEntry> custom({
    Expression<String>? tourId,
    Expression<String>? contentJson,
    Expression<String>? audioFilePath,
    Expression<String>? languageCode,
    Expression<DateTime>? downloadedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (tourId != null) 'tour_id': tourId,
      if (contentJson != null) 'content_json': contentJson,
      if (audioFilePath != null) 'audio_file_path': audioFilePath,
      if (languageCode != null) 'language_code': languageCode,
      if (downloadedAt != null) 'downloaded_at': downloadedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocalTourDownloadEntriesCompanion copyWith({
    Value<String>? tourId,
    Value<String>? contentJson,
    Value<String?>? audioFilePath,
    Value<String>? languageCode,
    Value<DateTime>? downloadedAt,
    Value<int>? rowid,
  }) {
    return LocalTourDownloadEntriesCompanion(
      tourId: tourId ?? this.tourId,
      contentJson: contentJson ?? this.contentJson,
      audioFilePath: audioFilePath ?? this.audioFilePath,
      languageCode: languageCode ?? this.languageCode,
      downloadedAt: downloadedAt ?? this.downloadedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (tourId.present) {
      map['tour_id'] = Variable<String>(tourId.value);
    }
    if (contentJson.present) {
      map['content_json'] = Variable<String>(contentJson.value);
    }
    if (audioFilePath.present) {
      map['audio_file_path'] = Variable<String>(audioFilePath.value);
    }
    if (languageCode.present) {
      map['language_code'] = Variable<String>(languageCode.value);
    }
    if (downloadedAt.present) {
      map['downloaded_at'] = Variable<DateTime>(downloadedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalTourDownloadEntriesCompanion(')
          ..write('tourId: $tourId, ')
          ..write('contentJson: $contentJson, ')
          ..write('audioFilePath: $audioFilePath, ')
          ..write('languageCode: $languageCode, ')
          ..write('downloadedAt: $downloadedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ItinerariesTable itineraries = $ItinerariesTable(this);
  late final $SavedItemsTable savedItems = $SavedItemsTable(this);
  late final $SyncQueueTable syncQueue = $SyncQueueTable(this);
  late final $TransportCacheTable transportCache = $TransportCacheTable(this);
  late final $CalendarCacheTable calendarCache = $CalendarCacheTable(this);
  late final $AccommodationCacheTable accommodationCache =
      $AccommodationCacheTable(this);
  late final $PropertyDetailCacheTable propertyDetailCache =
      $PropertyDetailCacheTable(this);
  late final $EntertainmentCacheTable entertainmentCache =
      $EntertainmentCacheTable(this);
  late final $GastronomyCacheTable gastronomyCache = $GastronomyCacheTable(
    this,
  );
  late final $EventsCacheTable eventsCache = $EventsCacheTable(this);
  late final $TrailsCacheTable trailsCache = $TrailsCacheTable(this);
  late final $MapTilesCacheTable mapTilesCache = $MapTilesCacheTable(this);
  late final $MapItemsCacheTable mapItemsCache = $MapItemsCacheTable(this);
  late final $DayPlansTable dayPlans = $DayPlansTable(this);
  late final $DayPlanEntriesTable dayPlanEntries = $DayPlanEntriesTable(this);
  late final $OfflineBundlesTable offlineBundles = $OfflineBundlesTable(this);
  late final $BundleAssetsTable bundleAssets = $BundleAssetsTable(this);
  late final $LocalSearchIndexTable localSearchIndex = $LocalSearchIndexTable(
    this,
  );
  late final $KeyValueStoreTable keyValueStore = $KeyValueStoreTable(this);
  late final $LocalTourCacheEntriesTable localTourCacheEntries =
      $LocalTourCacheEntriesTable(this);
  late final $LocalSavedTourEntriesTable localSavedTourEntries =
      $LocalSavedTourEntriesTable(this);
  late final $LocalTourProgressEntriesTable localTourProgressEntries =
      $LocalTourProgressEntriesTable(this);
  late final $LocalTourDownloadEntriesTable localTourDownloadEntries =
      $LocalTourDownloadEntriesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    itineraries,
    savedItems,
    syncQueue,
    transportCache,
    calendarCache,
    accommodationCache,
    propertyDetailCache,
    entertainmentCache,
    gastronomyCache,
    eventsCache,
    trailsCache,
    mapTilesCache,
    mapItemsCache,
    dayPlans,
    dayPlanEntries,
    offlineBundles,
    bundleAssets,
    localSearchIndex,
    keyValueStore,
    localTourCacheEntries,
    localSavedTourEntries,
    localTourProgressEntries,
    localTourDownloadEntries,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'offline_bundles',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('bundle_assets', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'offline_bundles',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('local_search_index', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$ItinerariesTableCreateCompanionBuilder =
    ItinerariesCompanion Function({
      required String id,
      required String title,
      Value<String?> destination,
      Value<DateTime?> startDate,
      Value<DateTime?> endDate,
      Value<int> travelers,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$ItinerariesTableUpdateCompanionBuilder =
    ItinerariesCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<String?> destination,
      Value<DateTime?> startDate,
      Value<DateTime?> endDate,
      Value<int> travelers,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$ItinerariesTableReferences
    extends BaseReferences<_$AppDatabase, $ItinerariesTable, ItineraryRow> {
  $$ItinerariesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$SavedItemsTable, List<SavedItemRow>>
  _savedItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.savedItems,
    aliasName: $_aliasNameGenerator(
      db.itineraries.id,
      db.savedItems.itineraryId,
    ),
  );

  $$SavedItemsTableProcessedTableManager get savedItemsRefs {
    final manager = $$SavedItemsTableTableManager(
      $_db,
      $_db.savedItems,
    ).filter((f) => f.itineraryId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_savedItemsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$DayPlansTable, List<DayPlanRow>>
  _dayPlansRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.dayPlans,
    aliasName: $_aliasNameGenerator(db.itineraries.id, db.dayPlans.itineraryId),
  );

  $$DayPlansTableProcessedTableManager get dayPlansRefs {
    final manager = $$DayPlansTableTableManager(
      $_db,
      $_db.dayPlans,
    ).filter((f) => f.itineraryId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_dayPlansRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ItinerariesTableFilterComposer
    extends Composer<_$AppDatabase, $ItinerariesTable> {
  $$ItinerariesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get destination => $composableBuilder(
    column: $table.destination,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get travelers => $composableBuilder(
    column: $table.travelers,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> savedItemsRefs(
    Expression<bool> Function($$SavedItemsTableFilterComposer f) f,
  ) {
    final $$SavedItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.savedItems,
      getReferencedColumn: (t) => t.itineraryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SavedItemsTableFilterComposer(
            $db: $db,
            $table: $db.savedItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> dayPlansRefs(
    Expression<bool> Function($$DayPlansTableFilterComposer f) f,
  ) {
    final $$DayPlansTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dayPlans,
      getReferencedColumn: (t) => t.itineraryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DayPlansTableFilterComposer(
            $db: $db,
            $table: $db.dayPlans,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ItinerariesTableOrderingComposer
    extends Composer<_$AppDatabase, $ItinerariesTable> {
  $$ItinerariesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get destination => $composableBuilder(
    column: $table.destination,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get travelers => $composableBuilder(
    column: $table.travelers,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ItinerariesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ItinerariesTable> {
  $$ItinerariesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get destination => $composableBuilder(
    column: $table.destination,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<int> get travelers =>
      $composableBuilder(column: $table.travelers, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> savedItemsRefs<T extends Object>(
    Expression<T> Function($$SavedItemsTableAnnotationComposer a) f,
  ) {
    final $$SavedItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.savedItems,
      getReferencedColumn: (t) => t.itineraryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SavedItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.savedItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> dayPlansRefs<T extends Object>(
    Expression<T> Function($$DayPlansTableAnnotationComposer a) f,
  ) {
    final $$DayPlansTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dayPlans,
      getReferencedColumn: (t) => t.itineraryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DayPlansTableAnnotationComposer(
            $db: $db,
            $table: $db.dayPlans,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ItinerariesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ItinerariesTable,
          ItineraryRow,
          $$ItinerariesTableFilterComposer,
          $$ItinerariesTableOrderingComposer,
          $$ItinerariesTableAnnotationComposer,
          $$ItinerariesTableCreateCompanionBuilder,
          $$ItinerariesTableUpdateCompanionBuilder,
          (ItineraryRow, $$ItinerariesTableReferences),
          ItineraryRow,
          PrefetchHooks Function({bool savedItemsRefs, bool dayPlansRefs})
        > {
  $$ItinerariesTableTableManager(_$AppDatabase db, $ItinerariesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ItinerariesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ItinerariesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ItinerariesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> destination = const Value.absent(),
                Value<DateTime?> startDate = const Value.absent(),
                Value<DateTime?> endDate = const Value.absent(),
                Value<int> travelers = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ItinerariesCompanion(
                id: id,
                title: title,
                destination: destination,
                startDate: startDate,
                endDate: endDate,
                travelers: travelers,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                Value<String?> destination = const Value.absent(),
                Value<DateTime?> startDate = const Value.absent(),
                Value<DateTime?> endDate = const Value.absent(),
                Value<int> travelers = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => ItinerariesCompanion.insert(
                id: id,
                title: title,
                destination: destination,
                startDate: startDate,
                endDate: endDate,
                travelers: travelers,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ItinerariesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({savedItemsRefs = false, dayPlansRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (savedItemsRefs) db.savedItems,
                    if (dayPlansRefs) db.dayPlans,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (savedItemsRefs)
                        await $_getPrefetchedData<
                          ItineraryRow,
                          $ItinerariesTable,
                          SavedItemRow
                        >(
                          currentTable: table,
                          referencedTable: $$ItinerariesTableReferences
                              ._savedItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ItinerariesTableReferences(
                                db,
                                table,
                                p0,
                              ).savedItemsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.itineraryId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (dayPlansRefs)
                        await $_getPrefetchedData<
                          ItineraryRow,
                          $ItinerariesTable,
                          DayPlanRow
                        >(
                          currentTable: table,
                          referencedTable: $$ItinerariesTableReferences
                              ._dayPlansRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ItinerariesTableReferences(
                                db,
                                table,
                                p0,
                              ).dayPlansRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.itineraryId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ItinerariesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ItinerariesTable,
      ItineraryRow,
      $$ItinerariesTableFilterComposer,
      $$ItinerariesTableOrderingComposer,
      $$ItinerariesTableAnnotationComposer,
      $$ItinerariesTableCreateCompanionBuilder,
      $$ItinerariesTableUpdateCompanionBuilder,
      (ItineraryRow, $$ItinerariesTableReferences),
      ItineraryRow,
      PrefetchHooks Function({bool savedItemsRefs, bool dayPlansRefs})
    >;
typedef $$SavedItemsTableCreateCompanionBuilder =
    SavedItemsCompanion Function({
      required String id,
      required String itineraryId,
      required String section,
      required String dedupeKey,
      required String content,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<bool> isSynced,
      Value<int> rowid,
    });
typedef $$SavedItemsTableUpdateCompanionBuilder =
    SavedItemsCompanion Function({
      Value<String> id,
      Value<String> itineraryId,
      Value<String> section,
      Value<String> dedupeKey,
      Value<String> content,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> isSynced,
      Value<int> rowid,
    });

final class $$SavedItemsTableReferences
    extends BaseReferences<_$AppDatabase, $SavedItemsTable, SavedItemRow> {
  $$SavedItemsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ItinerariesTable _itineraryIdTable(_$AppDatabase db) =>
      db.itineraries.createAlias(
        $_aliasNameGenerator(db.savedItems.itineraryId, db.itineraries.id),
      );

  $$ItinerariesTableProcessedTableManager get itineraryId {
    final $_column = $_itemColumn<String>('itinerary_id')!;

    final manager = $$ItinerariesTableTableManager(
      $_db,
      $_db.itineraries,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_itineraryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SavedItemsTableFilterComposer
    extends Composer<_$AppDatabase, $SavedItemsTable> {
  $$SavedItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get section => $composableBuilder(
    column: $table.section,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dedupeKey => $composableBuilder(
    column: $table.dedupeKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );

  $$ItinerariesTableFilterComposer get itineraryId {
    final $$ItinerariesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.itineraryId,
      referencedTable: $db.itineraries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ItinerariesTableFilterComposer(
            $db: $db,
            $table: $db.itineraries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SavedItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $SavedItemsTable> {
  $$SavedItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get section => $composableBuilder(
    column: $table.section,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dedupeKey => $composableBuilder(
    column: $table.dedupeKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );

  $$ItinerariesTableOrderingComposer get itineraryId {
    final $$ItinerariesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.itineraryId,
      referencedTable: $db.itineraries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ItinerariesTableOrderingComposer(
            $db: $db,
            $table: $db.itineraries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SavedItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SavedItemsTable> {
  $$SavedItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get section =>
      $composableBuilder(column: $table.section, builder: (column) => column);

  GeneratedColumn<String> get dedupeKey =>
      $composableBuilder(column: $table.dedupeKey, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  $$ItinerariesTableAnnotationComposer get itineraryId {
    final $$ItinerariesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.itineraryId,
      referencedTable: $db.itineraries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ItinerariesTableAnnotationComposer(
            $db: $db,
            $table: $db.itineraries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SavedItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SavedItemsTable,
          SavedItemRow,
          $$SavedItemsTableFilterComposer,
          $$SavedItemsTableOrderingComposer,
          $$SavedItemsTableAnnotationComposer,
          $$SavedItemsTableCreateCompanionBuilder,
          $$SavedItemsTableUpdateCompanionBuilder,
          (SavedItemRow, $$SavedItemsTableReferences),
          SavedItemRow,
          PrefetchHooks Function({bool itineraryId})
        > {
  $$SavedItemsTableTableManager(_$AppDatabase db, $SavedItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SavedItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SavedItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SavedItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> itineraryId = const Value.absent(),
                Value<String> section = const Value.absent(),
                Value<String> dedupeKey = const Value.absent(),
                Value<String> content = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SavedItemsCompanion(
                id: id,
                itineraryId: itineraryId,
                section: section,
                dedupeKey: dedupeKey,
                content: content,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isSynced: isSynced,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String itineraryId,
                required String section,
                required String dedupeKey,
                required String content,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SavedItemsCompanion.insert(
                id: id,
                itineraryId: itineraryId,
                section: section,
                dedupeKey: dedupeKey,
                content: content,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isSynced: isSynced,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SavedItemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({itineraryId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (itineraryId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.itineraryId,
                                referencedTable: $$SavedItemsTableReferences
                                    ._itineraryIdTable(db),
                                referencedColumn: $$SavedItemsTableReferences
                                    ._itineraryIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$SavedItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SavedItemsTable,
      SavedItemRow,
      $$SavedItemsTableFilterComposer,
      $$SavedItemsTableOrderingComposer,
      $$SavedItemsTableAnnotationComposer,
      $$SavedItemsTableCreateCompanionBuilder,
      $$SavedItemsTableUpdateCompanionBuilder,
      (SavedItemRow, $$SavedItemsTableReferences),
      SavedItemRow,
      PrefetchHooks Function({bool itineraryId})
    >;
typedef $$SyncQueueTableCreateCompanionBuilder =
    SyncQueueCompanion Function({
      Value<int> id,
      required String operation,
      required String payload,
      required DateTime createdAt,
      Value<String> status,
    });
typedef $$SyncQueueTableUpdateCompanionBuilder =
    SyncQueueCompanion Function({
      Value<int> id,
      Value<String> operation,
      Value<String> payload,
      Value<DateTime> createdAt,
      Value<String> status,
    });

class $$SyncQueueTableFilterComposer
    extends Composer<_$AppDatabase, $SyncQueueTable> {
  $$SyncQueueTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get operation => $composableBuilder(
    column: $table.operation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SyncQueueTableOrderingComposer
    extends Composer<_$AppDatabase, $SyncQueueTable> {
  $$SyncQueueTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get operation => $composableBuilder(
    column: $table.operation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SyncQueueTableAnnotationComposer
    extends Composer<_$AppDatabase, $SyncQueueTable> {
  $$SyncQueueTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get operation =>
      $composableBuilder(column: $table.operation, builder: (column) => column);

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $$SyncQueueTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SyncQueueTable,
          SyncQueueData,
          $$SyncQueueTableFilterComposer,
          $$SyncQueueTableOrderingComposer,
          $$SyncQueueTableAnnotationComposer,
          $$SyncQueueTableCreateCompanionBuilder,
          $$SyncQueueTableUpdateCompanionBuilder,
          (
            SyncQueueData,
            BaseReferences<_$AppDatabase, $SyncQueueTable, SyncQueueData>,
          ),
          SyncQueueData,
          PrefetchHooks Function()
        > {
  $$SyncQueueTableTableManager(_$AppDatabase db, $SyncQueueTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncQueueTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncQueueTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncQueueTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> operation = const Value.absent(),
                Value<String> payload = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<String> status = const Value.absent(),
              }) => SyncQueueCompanion(
                id: id,
                operation: operation,
                payload: payload,
                createdAt: createdAt,
                status: status,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String operation,
                required String payload,
                required DateTime createdAt,
                Value<String> status = const Value.absent(),
              }) => SyncQueueCompanion.insert(
                id: id,
                operation: operation,
                payload: payload,
                createdAt: createdAt,
                status: status,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SyncQueueTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SyncQueueTable,
      SyncQueueData,
      $$SyncQueueTableFilterComposer,
      $$SyncQueueTableOrderingComposer,
      $$SyncQueueTableAnnotationComposer,
      $$SyncQueueTableCreateCompanionBuilder,
      $$SyncQueueTableUpdateCompanionBuilder,
      (
        SyncQueueData,
        BaseReferences<_$AppDatabase, $SyncQueueTable, SyncQueueData>,
      ),
      SyncQueueData,
      PrefetchHooks Function()
    >;
typedef $$TransportCacheTableCreateCompanionBuilder =
    TransportCacheCompanion Function({
      required String key,
      required String data,
      required DateTime createdAt,
      required DateTime expiresAt,
      Value<int> rowid,
    });
typedef $$TransportCacheTableUpdateCompanionBuilder =
    TransportCacheCompanion Function({
      Value<String> key,
      Value<String> data,
      Value<DateTime> createdAt,
      Value<DateTime> expiresAt,
      Value<int> rowid,
    });

class $$TransportCacheTableFilterComposer
    extends Composer<_$AppDatabase, $TransportCacheTable> {
  $$TransportCacheTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TransportCacheTableOrderingComposer
    extends Composer<_$AppDatabase, $TransportCacheTable> {
  $$TransportCacheTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TransportCacheTableAnnotationComposer
    extends Composer<_$AppDatabase, $TransportCacheTable> {
  $$TransportCacheTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get data =>
      $composableBuilder(column: $table.data, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get expiresAt =>
      $composableBuilder(column: $table.expiresAt, builder: (column) => column);
}

class $$TransportCacheTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TransportCacheTable,
          TransportCacheRow,
          $$TransportCacheTableFilterComposer,
          $$TransportCacheTableOrderingComposer,
          $$TransportCacheTableAnnotationComposer,
          $$TransportCacheTableCreateCompanionBuilder,
          $$TransportCacheTableUpdateCompanionBuilder,
          (
            TransportCacheRow,
            BaseReferences<
              _$AppDatabase,
              $TransportCacheTable,
              TransportCacheRow
            >,
          ),
          TransportCacheRow,
          PrefetchHooks Function()
        > {
  $$TransportCacheTableTableManager(
    _$AppDatabase db,
    $TransportCacheTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransportCacheTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TransportCacheTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TransportCacheTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<String> data = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> expiresAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TransportCacheCompanion(
                key: key,
                data: data,
                createdAt: createdAt,
                expiresAt: expiresAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String key,
                required String data,
                required DateTime createdAt,
                required DateTime expiresAt,
                Value<int> rowid = const Value.absent(),
              }) => TransportCacheCompanion.insert(
                key: key,
                data: data,
                createdAt: createdAt,
                expiresAt: expiresAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TransportCacheTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TransportCacheTable,
      TransportCacheRow,
      $$TransportCacheTableFilterComposer,
      $$TransportCacheTableOrderingComposer,
      $$TransportCacheTableAnnotationComposer,
      $$TransportCacheTableCreateCompanionBuilder,
      $$TransportCacheTableUpdateCompanionBuilder,
      (
        TransportCacheRow,
        BaseReferences<_$AppDatabase, $TransportCacheTable, TransportCacheRow>,
      ),
      TransportCacheRow,
      PrefetchHooks Function()
    >;
typedef $$CalendarCacheTableCreateCompanionBuilder =
    CalendarCacheCompanion Function({
      required String key,
      required String data,
      required DateTime expiresAt,
      Value<int> rowid,
    });
typedef $$CalendarCacheTableUpdateCompanionBuilder =
    CalendarCacheCompanion Function({
      Value<String> key,
      Value<String> data,
      Value<DateTime> expiresAt,
      Value<int> rowid,
    });

class $$CalendarCacheTableFilterComposer
    extends Composer<_$AppDatabase, $CalendarCacheTable> {
  $$CalendarCacheTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CalendarCacheTableOrderingComposer
    extends Composer<_$AppDatabase, $CalendarCacheTable> {
  $$CalendarCacheTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CalendarCacheTableAnnotationComposer
    extends Composer<_$AppDatabase, $CalendarCacheTable> {
  $$CalendarCacheTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get data =>
      $composableBuilder(column: $table.data, builder: (column) => column);

  GeneratedColumn<DateTime> get expiresAt =>
      $composableBuilder(column: $table.expiresAt, builder: (column) => column);
}

class $$CalendarCacheTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CalendarCacheTable,
          CalendarCacheRow,
          $$CalendarCacheTableFilterComposer,
          $$CalendarCacheTableOrderingComposer,
          $$CalendarCacheTableAnnotationComposer,
          $$CalendarCacheTableCreateCompanionBuilder,
          $$CalendarCacheTableUpdateCompanionBuilder,
          (
            CalendarCacheRow,
            BaseReferences<
              _$AppDatabase,
              $CalendarCacheTable,
              CalendarCacheRow
            >,
          ),
          CalendarCacheRow,
          PrefetchHooks Function()
        > {
  $$CalendarCacheTableTableManager(_$AppDatabase db, $CalendarCacheTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CalendarCacheTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CalendarCacheTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CalendarCacheTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<String> data = const Value.absent(),
                Value<DateTime> expiresAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CalendarCacheCompanion(
                key: key,
                data: data,
                expiresAt: expiresAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String key,
                required String data,
                required DateTime expiresAt,
                Value<int> rowid = const Value.absent(),
              }) => CalendarCacheCompanion.insert(
                key: key,
                data: data,
                expiresAt: expiresAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CalendarCacheTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CalendarCacheTable,
      CalendarCacheRow,
      $$CalendarCacheTableFilterComposer,
      $$CalendarCacheTableOrderingComposer,
      $$CalendarCacheTableAnnotationComposer,
      $$CalendarCacheTableCreateCompanionBuilder,
      $$CalendarCacheTableUpdateCompanionBuilder,
      (
        CalendarCacheRow,
        BaseReferences<_$AppDatabase, $CalendarCacheTable, CalendarCacheRow>,
      ),
      CalendarCacheRow,
      PrefetchHooks Function()
    >;
typedef $$AccommodationCacheTableCreateCompanionBuilder =
    AccommodationCacheCompanion Function({
      required String key,
      required String itineraryId,
      required String data,
      required DateTime createdAt,
      required DateTime expiresAt,
      Value<int> rowid,
    });
typedef $$AccommodationCacheTableUpdateCompanionBuilder =
    AccommodationCacheCompanion Function({
      Value<String> key,
      Value<String> itineraryId,
      Value<String> data,
      Value<DateTime> createdAt,
      Value<DateTime> expiresAt,
      Value<int> rowid,
    });

class $$AccommodationCacheTableFilterComposer
    extends Composer<_$AppDatabase, $AccommodationCacheTable> {
  $$AccommodationCacheTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get itineraryId => $composableBuilder(
    column: $table.itineraryId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AccommodationCacheTableOrderingComposer
    extends Composer<_$AppDatabase, $AccommodationCacheTable> {
  $$AccommodationCacheTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get itineraryId => $composableBuilder(
    column: $table.itineraryId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AccommodationCacheTableAnnotationComposer
    extends Composer<_$AppDatabase, $AccommodationCacheTable> {
  $$AccommodationCacheTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get itineraryId => $composableBuilder(
    column: $table.itineraryId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get data =>
      $composableBuilder(column: $table.data, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get expiresAt =>
      $composableBuilder(column: $table.expiresAt, builder: (column) => column);
}

class $$AccommodationCacheTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AccommodationCacheTable,
          AccommodationCacheRow,
          $$AccommodationCacheTableFilterComposer,
          $$AccommodationCacheTableOrderingComposer,
          $$AccommodationCacheTableAnnotationComposer,
          $$AccommodationCacheTableCreateCompanionBuilder,
          $$AccommodationCacheTableUpdateCompanionBuilder,
          (
            AccommodationCacheRow,
            BaseReferences<
              _$AppDatabase,
              $AccommodationCacheTable,
              AccommodationCacheRow
            >,
          ),
          AccommodationCacheRow,
          PrefetchHooks Function()
        > {
  $$AccommodationCacheTableTableManager(
    _$AppDatabase db,
    $AccommodationCacheTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AccommodationCacheTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AccommodationCacheTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AccommodationCacheTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<String> itineraryId = const Value.absent(),
                Value<String> data = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> expiresAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AccommodationCacheCompanion(
                key: key,
                itineraryId: itineraryId,
                data: data,
                createdAt: createdAt,
                expiresAt: expiresAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String key,
                required String itineraryId,
                required String data,
                required DateTime createdAt,
                required DateTime expiresAt,
                Value<int> rowid = const Value.absent(),
              }) => AccommodationCacheCompanion.insert(
                key: key,
                itineraryId: itineraryId,
                data: data,
                createdAt: createdAt,
                expiresAt: expiresAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AccommodationCacheTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AccommodationCacheTable,
      AccommodationCacheRow,
      $$AccommodationCacheTableFilterComposer,
      $$AccommodationCacheTableOrderingComposer,
      $$AccommodationCacheTableAnnotationComposer,
      $$AccommodationCacheTableCreateCompanionBuilder,
      $$AccommodationCacheTableUpdateCompanionBuilder,
      (
        AccommodationCacheRow,
        BaseReferences<
          _$AppDatabase,
          $AccommodationCacheTable,
          AccommodationCacheRow
        >,
      ),
      AccommodationCacheRow,
      PrefetchHooks Function()
    >;
typedef $$PropertyDetailCacheTableCreateCompanionBuilder =
    PropertyDetailCacheCompanion Function({
      required String propertyId,
      required String data,
      required DateTime expiresAt,
      Value<int> rowid,
    });
typedef $$PropertyDetailCacheTableUpdateCompanionBuilder =
    PropertyDetailCacheCompanion Function({
      Value<String> propertyId,
      Value<String> data,
      Value<DateTime> expiresAt,
      Value<int> rowid,
    });

class $$PropertyDetailCacheTableFilterComposer
    extends Composer<_$AppDatabase, $PropertyDetailCacheTable> {
  $$PropertyDetailCacheTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get propertyId => $composableBuilder(
    column: $table.propertyId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PropertyDetailCacheTableOrderingComposer
    extends Composer<_$AppDatabase, $PropertyDetailCacheTable> {
  $$PropertyDetailCacheTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get propertyId => $composableBuilder(
    column: $table.propertyId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PropertyDetailCacheTableAnnotationComposer
    extends Composer<_$AppDatabase, $PropertyDetailCacheTable> {
  $$PropertyDetailCacheTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get propertyId => $composableBuilder(
    column: $table.propertyId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get data =>
      $composableBuilder(column: $table.data, builder: (column) => column);

  GeneratedColumn<DateTime> get expiresAt =>
      $composableBuilder(column: $table.expiresAt, builder: (column) => column);
}

class $$PropertyDetailCacheTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PropertyDetailCacheTable,
          PropertyDetailCacheRow,
          $$PropertyDetailCacheTableFilterComposer,
          $$PropertyDetailCacheTableOrderingComposer,
          $$PropertyDetailCacheTableAnnotationComposer,
          $$PropertyDetailCacheTableCreateCompanionBuilder,
          $$PropertyDetailCacheTableUpdateCompanionBuilder,
          (
            PropertyDetailCacheRow,
            BaseReferences<
              _$AppDatabase,
              $PropertyDetailCacheTable,
              PropertyDetailCacheRow
            >,
          ),
          PropertyDetailCacheRow,
          PrefetchHooks Function()
        > {
  $$PropertyDetailCacheTableTableManager(
    _$AppDatabase db,
    $PropertyDetailCacheTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PropertyDetailCacheTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PropertyDetailCacheTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$PropertyDetailCacheTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> propertyId = const Value.absent(),
                Value<String> data = const Value.absent(),
                Value<DateTime> expiresAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PropertyDetailCacheCompanion(
                propertyId: propertyId,
                data: data,
                expiresAt: expiresAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String propertyId,
                required String data,
                required DateTime expiresAt,
                Value<int> rowid = const Value.absent(),
              }) => PropertyDetailCacheCompanion.insert(
                propertyId: propertyId,
                data: data,
                expiresAt: expiresAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PropertyDetailCacheTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PropertyDetailCacheTable,
      PropertyDetailCacheRow,
      $$PropertyDetailCacheTableFilterComposer,
      $$PropertyDetailCacheTableOrderingComposer,
      $$PropertyDetailCacheTableAnnotationComposer,
      $$PropertyDetailCacheTableCreateCompanionBuilder,
      $$PropertyDetailCacheTableUpdateCompanionBuilder,
      (
        PropertyDetailCacheRow,
        BaseReferences<
          _$AppDatabase,
          $PropertyDetailCacheTable,
          PropertyDetailCacheRow
        >,
      ),
      PropertyDetailCacheRow,
      PrefetchHooks Function()
    >;
typedef $$EntertainmentCacheTableCreateCompanionBuilder =
    EntertainmentCacheCompanion Function({
      required String key,
      required String itineraryId,
      required String data,
      required DateTime createdAt,
      required DateTime expiresAt,
      Value<int> rowid,
    });
typedef $$EntertainmentCacheTableUpdateCompanionBuilder =
    EntertainmentCacheCompanion Function({
      Value<String> key,
      Value<String> itineraryId,
      Value<String> data,
      Value<DateTime> createdAt,
      Value<DateTime> expiresAt,
      Value<int> rowid,
    });

class $$EntertainmentCacheTableFilterComposer
    extends Composer<_$AppDatabase, $EntertainmentCacheTable> {
  $$EntertainmentCacheTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get itineraryId => $composableBuilder(
    column: $table.itineraryId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$EntertainmentCacheTableOrderingComposer
    extends Composer<_$AppDatabase, $EntertainmentCacheTable> {
  $$EntertainmentCacheTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get itineraryId => $composableBuilder(
    column: $table.itineraryId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$EntertainmentCacheTableAnnotationComposer
    extends Composer<_$AppDatabase, $EntertainmentCacheTable> {
  $$EntertainmentCacheTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get itineraryId => $composableBuilder(
    column: $table.itineraryId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get data =>
      $composableBuilder(column: $table.data, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get expiresAt =>
      $composableBuilder(column: $table.expiresAt, builder: (column) => column);
}

class $$EntertainmentCacheTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EntertainmentCacheTable,
          EntertainmentCacheRow,
          $$EntertainmentCacheTableFilterComposer,
          $$EntertainmentCacheTableOrderingComposer,
          $$EntertainmentCacheTableAnnotationComposer,
          $$EntertainmentCacheTableCreateCompanionBuilder,
          $$EntertainmentCacheTableUpdateCompanionBuilder,
          (
            EntertainmentCacheRow,
            BaseReferences<
              _$AppDatabase,
              $EntertainmentCacheTable,
              EntertainmentCacheRow
            >,
          ),
          EntertainmentCacheRow,
          PrefetchHooks Function()
        > {
  $$EntertainmentCacheTableTableManager(
    _$AppDatabase db,
    $EntertainmentCacheTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EntertainmentCacheTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EntertainmentCacheTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EntertainmentCacheTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<String> itineraryId = const Value.absent(),
                Value<String> data = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> expiresAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EntertainmentCacheCompanion(
                key: key,
                itineraryId: itineraryId,
                data: data,
                createdAt: createdAt,
                expiresAt: expiresAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String key,
                required String itineraryId,
                required String data,
                required DateTime createdAt,
                required DateTime expiresAt,
                Value<int> rowid = const Value.absent(),
              }) => EntertainmentCacheCompanion.insert(
                key: key,
                itineraryId: itineraryId,
                data: data,
                createdAt: createdAt,
                expiresAt: expiresAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$EntertainmentCacheTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EntertainmentCacheTable,
      EntertainmentCacheRow,
      $$EntertainmentCacheTableFilterComposer,
      $$EntertainmentCacheTableOrderingComposer,
      $$EntertainmentCacheTableAnnotationComposer,
      $$EntertainmentCacheTableCreateCompanionBuilder,
      $$EntertainmentCacheTableUpdateCompanionBuilder,
      (
        EntertainmentCacheRow,
        BaseReferences<
          _$AppDatabase,
          $EntertainmentCacheTable,
          EntertainmentCacheRow
        >,
      ),
      EntertainmentCacheRow,
      PrefetchHooks Function()
    >;
typedef $$GastronomyCacheTableCreateCompanionBuilder =
    GastronomyCacheCompanion Function({
      required String key,
      required String itineraryId,
      required String data,
      required DateTime createdAt,
      required DateTime expiresAt,
      Value<int> rowid,
    });
typedef $$GastronomyCacheTableUpdateCompanionBuilder =
    GastronomyCacheCompanion Function({
      Value<String> key,
      Value<String> itineraryId,
      Value<String> data,
      Value<DateTime> createdAt,
      Value<DateTime> expiresAt,
      Value<int> rowid,
    });

class $$GastronomyCacheTableFilterComposer
    extends Composer<_$AppDatabase, $GastronomyCacheTable> {
  $$GastronomyCacheTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get itineraryId => $composableBuilder(
    column: $table.itineraryId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$GastronomyCacheTableOrderingComposer
    extends Composer<_$AppDatabase, $GastronomyCacheTable> {
  $$GastronomyCacheTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get itineraryId => $composableBuilder(
    column: $table.itineraryId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$GastronomyCacheTableAnnotationComposer
    extends Composer<_$AppDatabase, $GastronomyCacheTable> {
  $$GastronomyCacheTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get itineraryId => $composableBuilder(
    column: $table.itineraryId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get data =>
      $composableBuilder(column: $table.data, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get expiresAt =>
      $composableBuilder(column: $table.expiresAt, builder: (column) => column);
}

class $$GastronomyCacheTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GastronomyCacheTable,
          GastronomyCacheRow,
          $$GastronomyCacheTableFilterComposer,
          $$GastronomyCacheTableOrderingComposer,
          $$GastronomyCacheTableAnnotationComposer,
          $$GastronomyCacheTableCreateCompanionBuilder,
          $$GastronomyCacheTableUpdateCompanionBuilder,
          (
            GastronomyCacheRow,
            BaseReferences<
              _$AppDatabase,
              $GastronomyCacheTable,
              GastronomyCacheRow
            >,
          ),
          GastronomyCacheRow,
          PrefetchHooks Function()
        > {
  $$GastronomyCacheTableTableManager(
    _$AppDatabase db,
    $GastronomyCacheTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GastronomyCacheTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GastronomyCacheTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GastronomyCacheTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<String> itineraryId = const Value.absent(),
                Value<String> data = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> expiresAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => GastronomyCacheCompanion(
                key: key,
                itineraryId: itineraryId,
                data: data,
                createdAt: createdAt,
                expiresAt: expiresAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String key,
                required String itineraryId,
                required String data,
                required DateTime createdAt,
                required DateTime expiresAt,
                Value<int> rowid = const Value.absent(),
              }) => GastronomyCacheCompanion.insert(
                key: key,
                itineraryId: itineraryId,
                data: data,
                createdAt: createdAt,
                expiresAt: expiresAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$GastronomyCacheTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GastronomyCacheTable,
      GastronomyCacheRow,
      $$GastronomyCacheTableFilterComposer,
      $$GastronomyCacheTableOrderingComposer,
      $$GastronomyCacheTableAnnotationComposer,
      $$GastronomyCacheTableCreateCompanionBuilder,
      $$GastronomyCacheTableUpdateCompanionBuilder,
      (
        GastronomyCacheRow,
        BaseReferences<
          _$AppDatabase,
          $GastronomyCacheTable,
          GastronomyCacheRow
        >,
      ),
      GastronomyCacheRow,
      PrefetchHooks Function()
    >;
typedef $$EventsCacheTableCreateCompanionBuilder =
    EventsCacheCompanion Function({
      required String key,
      required String itineraryId,
      required String data,
      required DateTime createdAt,
      required DateTime expiresAt,
      Value<int> rowid,
    });
typedef $$EventsCacheTableUpdateCompanionBuilder =
    EventsCacheCompanion Function({
      Value<String> key,
      Value<String> itineraryId,
      Value<String> data,
      Value<DateTime> createdAt,
      Value<DateTime> expiresAt,
      Value<int> rowid,
    });

class $$EventsCacheTableFilterComposer
    extends Composer<_$AppDatabase, $EventsCacheTable> {
  $$EventsCacheTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get itineraryId => $composableBuilder(
    column: $table.itineraryId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$EventsCacheTableOrderingComposer
    extends Composer<_$AppDatabase, $EventsCacheTable> {
  $$EventsCacheTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get itineraryId => $composableBuilder(
    column: $table.itineraryId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$EventsCacheTableAnnotationComposer
    extends Composer<_$AppDatabase, $EventsCacheTable> {
  $$EventsCacheTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get itineraryId => $composableBuilder(
    column: $table.itineraryId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get data =>
      $composableBuilder(column: $table.data, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get expiresAt =>
      $composableBuilder(column: $table.expiresAt, builder: (column) => column);
}

class $$EventsCacheTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EventsCacheTable,
          EventsCacheRow,
          $$EventsCacheTableFilterComposer,
          $$EventsCacheTableOrderingComposer,
          $$EventsCacheTableAnnotationComposer,
          $$EventsCacheTableCreateCompanionBuilder,
          $$EventsCacheTableUpdateCompanionBuilder,
          (
            EventsCacheRow,
            BaseReferences<_$AppDatabase, $EventsCacheTable, EventsCacheRow>,
          ),
          EventsCacheRow,
          PrefetchHooks Function()
        > {
  $$EventsCacheTableTableManager(_$AppDatabase db, $EventsCacheTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EventsCacheTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EventsCacheTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EventsCacheTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<String> itineraryId = const Value.absent(),
                Value<String> data = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> expiresAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EventsCacheCompanion(
                key: key,
                itineraryId: itineraryId,
                data: data,
                createdAt: createdAt,
                expiresAt: expiresAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String key,
                required String itineraryId,
                required String data,
                required DateTime createdAt,
                required DateTime expiresAt,
                Value<int> rowid = const Value.absent(),
              }) => EventsCacheCompanion.insert(
                key: key,
                itineraryId: itineraryId,
                data: data,
                createdAt: createdAt,
                expiresAt: expiresAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$EventsCacheTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EventsCacheTable,
      EventsCacheRow,
      $$EventsCacheTableFilterComposer,
      $$EventsCacheTableOrderingComposer,
      $$EventsCacheTableAnnotationComposer,
      $$EventsCacheTableCreateCompanionBuilder,
      $$EventsCacheTableUpdateCompanionBuilder,
      (
        EventsCacheRow,
        BaseReferences<_$AppDatabase, $EventsCacheTable, EventsCacheRow>,
      ),
      EventsCacheRow,
      PrefetchHooks Function()
    >;
typedef $$TrailsCacheTableCreateCompanionBuilder =
    TrailsCacheCompanion Function({
      required String key,
      required String itineraryId,
      required String data,
      required DateTime createdAt,
      required DateTime expiresAt,
      Value<int> rowid,
    });
typedef $$TrailsCacheTableUpdateCompanionBuilder =
    TrailsCacheCompanion Function({
      Value<String> key,
      Value<String> itineraryId,
      Value<String> data,
      Value<DateTime> createdAt,
      Value<DateTime> expiresAt,
      Value<int> rowid,
    });

class $$TrailsCacheTableFilterComposer
    extends Composer<_$AppDatabase, $TrailsCacheTable> {
  $$TrailsCacheTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get itineraryId => $composableBuilder(
    column: $table.itineraryId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TrailsCacheTableOrderingComposer
    extends Composer<_$AppDatabase, $TrailsCacheTable> {
  $$TrailsCacheTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get itineraryId => $composableBuilder(
    column: $table.itineraryId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TrailsCacheTableAnnotationComposer
    extends Composer<_$AppDatabase, $TrailsCacheTable> {
  $$TrailsCacheTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get itineraryId => $composableBuilder(
    column: $table.itineraryId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get data =>
      $composableBuilder(column: $table.data, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get expiresAt =>
      $composableBuilder(column: $table.expiresAt, builder: (column) => column);
}

class $$TrailsCacheTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TrailsCacheTable,
          TrailsCacheRow,
          $$TrailsCacheTableFilterComposer,
          $$TrailsCacheTableOrderingComposer,
          $$TrailsCacheTableAnnotationComposer,
          $$TrailsCacheTableCreateCompanionBuilder,
          $$TrailsCacheTableUpdateCompanionBuilder,
          (
            TrailsCacheRow,
            BaseReferences<_$AppDatabase, $TrailsCacheTable, TrailsCacheRow>,
          ),
          TrailsCacheRow,
          PrefetchHooks Function()
        > {
  $$TrailsCacheTableTableManager(_$AppDatabase db, $TrailsCacheTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TrailsCacheTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TrailsCacheTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TrailsCacheTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<String> itineraryId = const Value.absent(),
                Value<String> data = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> expiresAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TrailsCacheCompanion(
                key: key,
                itineraryId: itineraryId,
                data: data,
                createdAt: createdAt,
                expiresAt: expiresAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String key,
                required String itineraryId,
                required String data,
                required DateTime createdAt,
                required DateTime expiresAt,
                Value<int> rowid = const Value.absent(),
              }) => TrailsCacheCompanion.insert(
                key: key,
                itineraryId: itineraryId,
                data: data,
                createdAt: createdAt,
                expiresAt: expiresAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TrailsCacheTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TrailsCacheTable,
      TrailsCacheRow,
      $$TrailsCacheTableFilterComposer,
      $$TrailsCacheTableOrderingComposer,
      $$TrailsCacheTableAnnotationComposer,
      $$TrailsCacheTableCreateCompanionBuilder,
      $$TrailsCacheTableUpdateCompanionBuilder,
      (
        TrailsCacheRow,
        BaseReferences<_$AppDatabase, $TrailsCacheTable, TrailsCacheRow>,
      ),
      TrailsCacheRow,
      PrefetchHooks Function()
    >;
typedef $$MapTilesCacheTableCreateCompanionBuilder =
    MapTilesCacheCompanion Function({
      required String key,
      required Uint8List data,
      required DateTime expiresAt,
      Value<int> rowid,
    });
typedef $$MapTilesCacheTableUpdateCompanionBuilder =
    MapTilesCacheCompanion Function({
      Value<String> key,
      Value<Uint8List> data,
      Value<DateTime> expiresAt,
      Value<int> rowid,
    });

class $$MapTilesCacheTableFilterComposer
    extends Composer<_$AppDatabase, $MapTilesCacheTable> {
  $$MapTilesCacheTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<Uint8List> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MapTilesCacheTableOrderingComposer
    extends Composer<_$AppDatabase, $MapTilesCacheTable> {
  $$MapTilesCacheTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<Uint8List> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MapTilesCacheTableAnnotationComposer
    extends Composer<_$AppDatabase, $MapTilesCacheTable> {
  $$MapTilesCacheTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<Uint8List> get data =>
      $composableBuilder(column: $table.data, builder: (column) => column);

  GeneratedColumn<DateTime> get expiresAt =>
      $composableBuilder(column: $table.expiresAt, builder: (column) => column);
}

class $$MapTilesCacheTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MapTilesCacheTable,
          MapTilesCacheRow,
          $$MapTilesCacheTableFilterComposer,
          $$MapTilesCacheTableOrderingComposer,
          $$MapTilesCacheTableAnnotationComposer,
          $$MapTilesCacheTableCreateCompanionBuilder,
          $$MapTilesCacheTableUpdateCompanionBuilder,
          (
            MapTilesCacheRow,
            BaseReferences<
              _$AppDatabase,
              $MapTilesCacheTable,
              MapTilesCacheRow
            >,
          ),
          MapTilesCacheRow,
          PrefetchHooks Function()
        > {
  $$MapTilesCacheTableTableManager(_$AppDatabase db, $MapTilesCacheTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MapTilesCacheTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MapTilesCacheTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MapTilesCacheTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<Uint8List> data = const Value.absent(),
                Value<DateTime> expiresAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MapTilesCacheCompanion(
                key: key,
                data: data,
                expiresAt: expiresAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String key,
                required Uint8List data,
                required DateTime expiresAt,
                Value<int> rowid = const Value.absent(),
              }) => MapTilesCacheCompanion.insert(
                key: key,
                data: data,
                expiresAt: expiresAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MapTilesCacheTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MapTilesCacheTable,
      MapTilesCacheRow,
      $$MapTilesCacheTableFilterComposer,
      $$MapTilesCacheTableOrderingComposer,
      $$MapTilesCacheTableAnnotationComposer,
      $$MapTilesCacheTableCreateCompanionBuilder,
      $$MapTilesCacheTableUpdateCompanionBuilder,
      (
        MapTilesCacheRow,
        BaseReferences<_$AppDatabase, $MapTilesCacheTable, MapTilesCacheRow>,
      ),
      MapTilesCacheRow,
      PrefetchHooks Function()
    >;
typedef $$MapItemsCacheTableCreateCompanionBuilder =
    MapItemsCacheCompanion Function({
      required String key,
      required String data,
      required DateTime expiresAt,
      Value<int> rowid,
    });
typedef $$MapItemsCacheTableUpdateCompanionBuilder =
    MapItemsCacheCompanion Function({
      Value<String> key,
      Value<String> data,
      Value<DateTime> expiresAt,
      Value<int> rowid,
    });

class $$MapItemsCacheTableFilterComposer
    extends Composer<_$AppDatabase, $MapItemsCacheTable> {
  $$MapItemsCacheTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MapItemsCacheTableOrderingComposer
    extends Composer<_$AppDatabase, $MapItemsCacheTable> {
  $$MapItemsCacheTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MapItemsCacheTableAnnotationComposer
    extends Composer<_$AppDatabase, $MapItemsCacheTable> {
  $$MapItemsCacheTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get data =>
      $composableBuilder(column: $table.data, builder: (column) => column);

  GeneratedColumn<DateTime> get expiresAt =>
      $composableBuilder(column: $table.expiresAt, builder: (column) => column);
}

class $$MapItemsCacheTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MapItemsCacheTable,
          MapItemsCacheRow,
          $$MapItemsCacheTableFilterComposer,
          $$MapItemsCacheTableOrderingComposer,
          $$MapItemsCacheTableAnnotationComposer,
          $$MapItemsCacheTableCreateCompanionBuilder,
          $$MapItemsCacheTableUpdateCompanionBuilder,
          (
            MapItemsCacheRow,
            BaseReferences<
              _$AppDatabase,
              $MapItemsCacheTable,
              MapItemsCacheRow
            >,
          ),
          MapItemsCacheRow,
          PrefetchHooks Function()
        > {
  $$MapItemsCacheTableTableManager(_$AppDatabase db, $MapItemsCacheTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MapItemsCacheTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MapItemsCacheTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MapItemsCacheTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<String> data = const Value.absent(),
                Value<DateTime> expiresAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MapItemsCacheCompanion(
                key: key,
                data: data,
                expiresAt: expiresAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String key,
                required String data,
                required DateTime expiresAt,
                Value<int> rowid = const Value.absent(),
              }) => MapItemsCacheCompanion.insert(
                key: key,
                data: data,
                expiresAt: expiresAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MapItemsCacheTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MapItemsCacheTable,
      MapItemsCacheRow,
      $$MapItemsCacheTableFilterComposer,
      $$MapItemsCacheTableOrderingComposer,
      $$MapItemsCacheTableAnnotationComposer,
      $$MapItemsCacheTableCreateCompanionBuilder,
      $$MapItemsCacheTableUpdateCompanionBuilder,
      (
        MapItemsCacheRow,
        BaseReferences<_$AppDatabase, $MapItemsCacheTable, MapItemsCacheRow>,
      ),
      MapItemsCacheRow,
      PrefetchHooks Function()
    >;
typedef $$DayPlansTableCreateCompanionBuilder =
    DayPlansCompanion Function({
      required String itineraryId,
      required DateTime date,
      Value<int> version,
      Value<DateTime?> updatedAt,
      Value<int> rowid,
    });
typedef $$DayPlansTableUpdateCompanionBuilder =
    DayPlansCompanion Function({
      Value<String> itineraryId,
      Value<DateTime> date,
      Value<int> version,
      Value<DateTime?> updatedAt,
      Value<int> rowid,
    });

final class $$DayPlansTableReferences
    extends BaseReferences<_$AppDatabase, $DayPlansTable, DayPlanRow> {
  $$DayPlansTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ItinerariesTable _itineraryIdTable(_$AppDatabase db) =>
      db.itineraries.createAlias(
        $_aliasNameGenerator(db.dayPlans.itineraryId, db.itineraries.id),
      );

  $$ItinerariesTableProcessedTableManager get itineraryId {
    final $_column = $_itemColumn<String>('itinerary_id')!;

    final manager = $$ItinerariesTableTableManager(
      $_db,
      $_db.itineraries,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_itineraryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DayPlansTableFilterComposer
    extends Composer<_$AppDatabase, $DayPlansTable> {
  $$DayPlansTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$ItinerariesTableFilterComposer get itineraryId {
    final $$ItinerariesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.itineraryId,
      referencedTable: $db.itineraries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ItinerariesTableFilterComposer(
            $db: $db,
            $table: $db.itineraries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DayPlansTableOrderingComposer
    extends Composer<_$AppDatabase, $DayPlansTable> {
  $$DayPlansTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$ItinerariesTableOrderingComposer get itineraryId {
    final $$ItinerariesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.itineraryId,
      referencedTable: $db.itineraries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ItinerariesTableOrderingComposer(
            $db: $db,
            $table: $db.itineraries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DayPlansTableAnnotationComposer
    extends Composer<_$AppDatabase, $DayPlansTable> {
  $$DayPlansTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$ItinerariesTableAnnotationComposer get itineraryId {
    final $$ItinerariesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.itineraryId,
      referencedTable: $db.itineraries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ItinerariesTableAnnotationComposer(
            $db: $db,
            $table: $db.itineraries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DayPlansTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DayPlansTable,
          DayPlanRow,
          $$DayPlansTableFilterComposer,
          $$DayPlansTableOrderingComposer,
          $$DayPlansTableAnnotationComposer,
          $$DayPlansTableCreateCompanionBuilder,
          $$DayPlansTableUpdateCompanionBuilder,
          (DayPlanRow, $$DayPlansTableReferences),
          DayPlanRow,
          PrefetchHooks Function({bool itineraryId})
        > {
  $$DayPlansTableTableManager(_$AppDatabase db, $DayPlansTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DayPlansTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DayPlansTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DayPlansTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> itineraryId = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DayPlansCompanion(
                itineraryId: itineraryId,
                date: date,
                version: version,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String itineraryId,
                required DateTime date,
                Value<int> version = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DayPlansCompanion.insert(
                itineraryId: itineraryId,
                date: date,
                version: version,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DayPlansTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({itineraryId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (itineraryId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.itineraryId,
                                referencedTable: $$DayPlansTableReferences
                                    ._itineraryIdTable(db),
                                referencedColumn: $$DayPlansTableReferences
                                    ._itineraryIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$DayPlansTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DayPlansTable,
      DayPlanRow,
      $$DayPlansTableFilterComposer,
      $$DayPlansTableOrderingComposer,
      $$DayPlansTableAnnotationComposer,
      $$DayPlansTableCreateCompanionBuilder,
      $$DayPlansTableUpdateCompanionBuilder,
      (DayPlanRow, $$DayPlansTableReferences),
      DayPlanRow,
      PrefetchHooks Function({bool itineraryId})
    >;
typedef $$DayPlanEntriesTableCreateCompanionBuilder =
    DayPlanEntriesCompanion Function({
      required String id,
      required String itineraryId,
      required DateTime date,
      Value<String?> savedItemId,
      required String title,
      required String type,
      Value<DateTime?> startTime,
      Value<DateTime?> endTime,
      Value<int> durationMinutes,
      Value<String> commuteMode,
      Value<int?> commuteDurationMinutes,
      Value<int?> bufferBeforeMinutes,
      Value<String?> notes,
      required int orderIndex,
      Value<int> rowid,
    });
typedef $$DayPlanEntriesTableUpdateCompanionBuilder =
    DayPlanEntriesCompanion Function({
      Value<String> id,
      Value<String> itineraryId,
      Value<DateTime> date,
      Value<String?> savedItemId,
      Value<String> title,
      Value<String> type,
      Value<DateTime?> startTime,
      Value<DateTime?> endTime,
      Value<int> durationMinutes,
      Value<String> commuteMode,
      Value<int?> commuteDurationMinutes,
      Value<int?> bufferBeforeMinutes,
      Value<String?> notes,
      Value<int> orderIndex,
      Value<int> rowid,
    });

class $$DayPlanEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $DayPlanEntriesTable> {
  $$DayPlanEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get itineraryId => $composableBuilder(
    column: $table.itineraryId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get savedItemId => $composableBuilder(
    column: $table.savedItemId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get commuteMode => $composableBuilder(
    column: $table.commuteMode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get commuteDurationMinutes => $composableBuilder(
    column: $table.commuteDurationMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get bufferBeforeMinutes => $composableBuilder(
    column: $table.bufferBeforeMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DayPlanEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $DayPlanEntriesTable> {
  $$DayPlanEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get itineraryId => $composableBuilder(
    column: $table.itineraryId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get savedItemId => $composableBuilder(
    column: $table.savedItemId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get commuteMode => $composableBuilder(
    column: $table.commuteMode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get commuteDurationMinutes => $composableBuilder(
    column: $table.commuteDurationMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get bufferBeforeMinutes => $composableBuilder(
    column: $table.bufferBeforeMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DayPlanEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $DayPlanEntriesTable> {
  $$DayPlanEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get itineraryId => $composableBuilder(
    column: $table.itineraryId,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get savedItemId => $composableBuilder(
    column: $table.savedItemId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<DateTime> get startTime =>
      $composableBuilder(column: $table.startTime, builder: (column) => column);

  GeneratedColumn<DateTime> get endTime =>
      $composableBuilder(column: $table.endTime, builder: (column) => column);

  GeneratedColumn<int> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get commuteMode => $composableBuilder(
    column: $table.commuteMode,
    builder: (column) => column,
  );

  GeneratedColumn<int> get commuteDurationMinutes => $composableBuilder(
    column: $table.commuteDurationMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<int> get bufferBeforeMinutes => $composableBuilder(
    column: $table.bufferBeforeMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => column,
  );
}

class $$DayPlanEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DayPlanEntriesTable,
          DayPlanEntryRow,
          $$DayPlanEntriesTableFilterComposer,
          $$DayPlanEntriesTableOrderingComposer,
          $$DayPlanEntriesTableAnnotationComposer,
          $$DayPlanEntriesTableCreateCompanionBuilder,
          $$DayPlanEntriesTableUpdateCompanionBuilder,
          (
            DayPlanEntryRow,
            BaseReferences<
              _$AppDatabase,
              $DayPlanEntriesTable,
              DayPlanEntryRow
            >,
          ),
          DayPlanEntryRow,
          PrefetchHooks Function()
        > {
  $$DayPlanEntriesTableTableManager(
    _$AppDatabase db,
    $DayPlanEntriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DayPlanEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DayPlanEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DayPlanEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> itineraryId = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<String?> savedItemId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<DateTime?> startTime = const Value.absent(),
                Value<DateTime?> endTime = const Value.absent(),
                Value<int> durationMinutes = const Value.absent(),
                Value<String> commuteMode = const Value.absent(),
                Value<int?> commuteDurationMinutes = const Value.absent(),
                Value<int?> bufferBeforeMinutes = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> orderIndex = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DayPlanEntriesCompanion(
                id: id,
                itineraryId: itineraryId,
                date: date,
                savedItemId: savedItemId,
                title: title,
                type: type,
                startTime: startTime,
                endTime: endTime,
                durationMinutes: durationMinutes,
                commuteMode: commuteMode,
                commuteDurationMinutes: commuteDurationMinutes,
                bufferBeforeMinutes: bufferBeforeMinutes,
                notes: notes,
                orderIndex: orderIndex,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String itineraryId,
                required DateTime date,
                Value<String?> savedItemId = const Value.absent(),
                required String title,
                required String type,
                Value<DateTime?> startTime = const Value.absent(),
                Value<DateTime?> endTime = const Value.absent(),
                Value<int> durationMinutes = const Value.absent(),
                Value<String> commuteMode = const Value.absent(),
                Value<int?> commuteDurationMinutes = const Value.absent(),
                Value<int?> bufferBeforeMinutes = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                required int orderIndex,
                Value<int> rowid = const Value.absent(),
              }) => DayPlanEntriesCompanion.insert(
                id: id,
                itineraryId: itineraryId,
                date: date,
                savedItemId: savedItemId,
                title: title,
                type: type,
                startTime: startTime,
                endTime: endTime,
                durationMinutes: durationMinutes,
                commuteMode: commuteMode,
                commuteDurationMinutes: commuteDurationMinutes,
                bufferBeforeMinutes: bufferBeforeMinutes,
                notes: notes,
                orderIndex: orderIndex,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DayPlanEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DayPlanEntriesTable,
      DayPlanEntryRow,
      $$DayPlanEntriesTableFilterComposer,
      $$DayPlanEntriesTableOrderingComposer,
      $$DayPlanEntriesTableAnnotationComposer,
      $$DayPlanEntriesTableCreateCompanionBuilder,
      $$DayPlanEntriesTableUpdateCompanionBuilder,
      (
        DayPlanEntryRow,
        BaseReferences<_$AppDatabase, $DayPlanEntriesTable, DayPlanEntryRow>,
      ),
      DayPlanEntryRow,
      PrefetchHooks Function()
    >;
typedef $$OfflineBundlesTableCreateCompanionBuilder =
    OfflineBundlesCompanion Function({
      required String itineraryId,
      required int version,
      required String id,
      required DateTime createdAt,
      required int sizeBytes,
      required String path,
      Value<int> rowid,
    });
typedef $$OfflineBundlesTableUpdateCompanionBuilder =
    OfflineBundlesCompanion Function({
      Value<String> itineraryId,
      Value<int> version,
      Value<String> id,
      Value<DateTime> createdAt,
      Value<int> sizeBytes,
      Value<String> path,
      Value<int> rowid,
    });

final class $$OfflineBundlesTableReferences
    extends
        BaseReferences<_$AppDatabase, $OfflineBundlesTable, OfflineBundleRow> {
  $$OfflineBundlesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$BundleAssetsTable, List<BundleAssetRow>>
  _bundleAssetsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.bundleAssets,
    aliasName: $_aliasNameGenerator(
      db.offlineBundles.id,
      db.bundleAssets.bundleId,
    ),
  );

  $$BundleAssetsTableProcessedTableManager get bundleAssetsRefs {
    final manager = $$BundleAssetsTableTableManager(
      $_db,
      $_db.bundleAssets,
    ).filter((f) => f.bundleId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_bundleAssetsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$LocalSearchIndexTable, List<LocalSearchIndexRow>>
  _localSearchIndexRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.localSearchIndex,
    aliasName: $_aliasNameGenerator(
      db.offlineBundles.id,
      db.localSearchIndex.bundleId,
    ),
  );

  $$LocalSearchIndexTableProcessedTableManager get localSearchIndexRefs {
    final manager = $$LocalSearchIndexTableTableManager(
      $_db,
      $_db.localSearchIndex,
    ).filter((f) => f.bundleId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _localSearchIndexRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$OfflineBundlesTableFilterComposer
    extends Composer<_$AppDatabase, $OfflineBundlesTable> {
  $$OfflineBundlesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get itineraryId => $composableBuilder(
    column: $table.itineraryId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sizeBytes => $composableBuilder(
    column: $table.sizeBytes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get path => $composableBuilder(
    column: $table.path,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> bundleAssetsRefs(
    Expression<bool> Function($$BundleAssetsTableFilterComposer f) f,
  ) {
    final $$BundleAssetsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.bundleAssets,
      getReferencedColumn: (t) => t.bundleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BundleAssetsTableFilterComposer(
            $db: $db,
            $table: $db.bundleAssets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> localSearchIndexRefs(
    Expression<bool> Function($$LocalSearchIndexTableFilterComposer f) f,
  ) {
    final $$LocalSearchIndexTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.localSearchIndex,
      getReferencedColumn: (t) => t.bundleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocalSearchIndexTableFilterComposer(
            $db: $db,
            $table: $db.localSearchIndex,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$OfflineBundlesTableOrderingComposer
    extends Composer<_$AppDatabase, $OfflineBundlesTable> {
  $$OfflineBundlesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get itineraryId => $composableBuilder(
    column: $table.itineraryId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sizeBytes => $composableBuilder(
    column: $table.sizeBytes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get path => $composableBuilder(
    column: $table.path,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$OfflineBundlesTableAnnotationComposer
    extends Composer<_$AppDatabase, $OfflineBundlesTable> {
  $$OfflineBundlesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get itineraryId => $composableBuilder(
    column: $table.itineraryId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get sizeBytes =>
      $composableBuilder(column: $table.sizeBytes, builder: (column) => column);

  GeneratedColumn<String> get path =>
      $composableBuilder(column: $table.path, builder: (column) => column);

  Expression<T> bundleAssetsRefs<T extends Object>(
    Expression<T> Function($$BundleAssetsTableAnnotationComposer a) f,
  ) {
    final $$BundleAssetsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.bundleAssets,
      getReferencedColumn: (t) => t.bundleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BundleAssetsTableAnnotationComposer(
            $db: $db,
            $table: $db.bundleAssets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> localSearchIndexRefs<T extends Object>(
    Expression<T> Function($$LocalSearchIndexTableAnnotationComposer a) f,
  ) {
    final $$LocalSearchIndexTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.localSearchIndex,
      getReferencedColumn: (t) => t.bundleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocalSearchIndexTableAnnotationComposer(
            $db: $db,
            $table: $db.localSearchIndex,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$OfflineBundlesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $OfflineBundlesTable,
          OfflineBundleRow,
          $$OfflineBundlesTableFilterComposer,
          $$OfflineBundlesTableOrderingComposer,
          $$OfflineBundlesTableAnnotationComposer,
          $$OfflineBundlesTableCreateCompanionBuilder,
          $$OfflineBundlesTableUpdateCompanionBuilder,
          (OfflineBundleRow, $$OfflineBundlesTableReferences),
          OfflineBundleRow,
          PrefetchHooks Function({
            bool bundleAssetsRefs,
            bool localSearchIndexRefs,
          })
        > {
  $$OfflineBundlesTableTableManager(
    _$AppDatabase db,
    $OfflineBundlesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OfflineBundlesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OfflineBundlesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OfflineBundlesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> itineraryId = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> sizeBytes = const Value.absent(),
                Value<String> path = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => OfflineBundlesCompanion(
                itineraryId: itineraryId,
                version: version,
                id: id,
                createdAt: createdAt,
                sizeBytes: sizeBytes,
                path: path,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String itineraryId,
                required int version,
                required String id,
                required DateTime createdAt,
                required int sizeBytes,
                required String path,
                Value<int> rowid = const Value.absent(),
              }) => OfflineBundlesCompanion.insert(
                itineraryId: itineraryId,
                version: version,
                id: id,
                createdAt: createdAt,
                sizeBytes: sizeBytes,
                path: path,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$OfflineBundlesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({bundleAssetsRefs = false, localSearchIndexRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (bundleAssetsRefs) db.bundleAssets,
                    if (localSearchIndexRefs) db.localSearchIndex,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (bundleAssetsRefs)
                        await $_getPrefetchedData<
                          OfflineBundleRow,
                          $OfflineBundlesTable,
                          BundleAssetRow
                        >(
                          currentTable: table,
                          referencedTable: $$OfflineBundlesTableReferences
                              ._bundleAssetsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$OfflineBundlesTableReferences(
                                db,
                                table,
                                p0,
                              ).bundleAssetsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.bundleId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (localSearchIndexRefs)
                        await $_getPrefetchedData<
                          OfflineBundleRow,
                          $OfflineBundlesTable,
                          LocalSearchIndexRow
                        >(
                          currentTable: table,
                          referencedTable: $$OfflineBundlesTableReferences
                              ._localSearchIndexRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$OfflineBundlesTableReferences(
                                db,
                                table,
                                p0,
                              ).localSearchIndexRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.bundleId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$OfflineBundlesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $OfflineBundlesTable,
      OfflineBundleRow,
      $$OfflineBundlesTableFilterComposer,
      $$OfflineBundlesTableOrderingComposer,
      $$OfflineBundlesTableAnnotationComposer,
      $$OfflineBundlesTableCreateCompanionBuilder,
      $$OfflineBundlesTableUpdateCompanionBuilder,
      (OfflineBundleRow, $$OfflineBundlesTableReferences),
      OfflineBundleRow,
      PrefetchHooks Function({bool bundleAssetsRefs, bool localSearchIndexRefs})
    >;
typedef $$BundleAssetsTableCreateCompanionBuilder =
    BundleAssetsCompanion Function({
      required String bundleId,
      required String path,
      required String originalUrl,
      required String kind,
      required String sha256,
      Value<int> rowid,
    });
typedef $$BundleAssetsTableUpdateCompanionBuilder =
    BundleAssetsCompanion Function({
      Value<String> bundleId,
      Value<String> path,
      Value<String> originalUrl,
      Value<String> kind,
      Value<String> sha256,
      Value<int> rowid,
    });

final class $$BundleAssetsTableReferences
    extends BaseReferences<_$AppDatabase, $BundleAssetsTable, BundleAssetRow> {
  $$BundleAssetsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $OfflineBundlesTable _bundleIdTable(_$AppDatabase db) =>
      db.offlineBundles.createAlias(
        $_aliasNameGenerator(db.bundleAssets.bundleId, db.offlineBundles.id),
      );

  $$OfflineBundlesTableProcessedTableManager get bundleId {
    final $_column = $_itemColumn<String>('bundle_id')!;

    final manager = $$OfflineBundlesTableTableManager(
      $_db,
      $_db.offlineBundles,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_bundleIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$BundleAssetsTableFilterComposer
    extends Composer<_$AppDatabase, $BundleAssetsTable> {
  $$BundleAssetsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get path => $composableBuilder(
    column: $table.path,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get originalUrl => $composableBuilder(
    column: $table.originalUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sha256 => $composableBuilder(
    column: $table.sha256,
    builder: (column) => ColumnFilters(column),
  );

  $$OfflineBundlesTableFilterComposer get bundleId {
    final $$OfflineBundlesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.bundleId,
      referencedTable: $db.offlineBundles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OfflineBundlesTableFilterComposer(
            $db: $db,
            $table: $db.offlineBundles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BundleAssetsTableOrderingComposer
    extends Composer<_$AppDatabase, $BundleAssetsTable> {
  $$BundleAssetsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get path => $composableBuilder(
    column: $table.path,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get originalUrl => $composableBuilder(
    column: $table.originalUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sha256 => $composableBuilder(
    column: $table.sha256,
    builder: (column) => ColumnOrderings(column),
  );

  $$OfflineBundlesTableOrderingComposer get bundleId {
    final $$OfflineBundlesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.bundleId,
      referencedTable: $db.offlineBundles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OfflineBundlesTableOrderingComposer(
            $db: $db,
            $table: $db.offlineBundles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BundleAssetsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BundleAssetsTable> {
  $$BundleAssetsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get path =>
      $composableBuilder(column: $table.path, builder: (column) => column);

  GeneratedColumn<String> get originalUrl => $composableBuilder(
    column: $table.originalUrl,
    builder: (column) => column,
  );

  GeneratedColumn<String> get kind =>
      $composableBuilder(column: $table.kind, builder: (column) => column);

  GeneratedColumn<String> get sha256 =>
      $composableBuilder(column: $table.sha256, builder: (column) => column);

  $$OfflineBundlesTableAnnotationComposer get bundleId {
    final $$OfflineBundlesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.bundleId,
      referencedTable: $db.offlineBundles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OfflineBundlesTableAnnotationComposer(
            $db: $db,
            $table: $db.offlineBundles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BundleAssetsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BundleAssetsTable,
          BundleAssetRow,
          $$BundleAssetsTableFilterComposer,
          $$BundleAssetsTableOrderingComposer,
          $$BundleAssetsTableAnnotationComposer,
          $$BundleAssetsTableCreateCompanionBuilder,
          $$BundleAssetsTableUpdateCompanionBuilder,
          (BundleAssetRow, $$BundleAssetsTableReferences),
          BundleAssetRow,
          PrefetchHooks Function({bool bundleId})
        > {
  $$BundleAssetsTableTableManager(_$AppDatabase db, $BundleAssetsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BundleAssetsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BundleAssetsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BundleAssetsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> bundleId = const Value.absent(),
                Value<String> path = const Value.absent(),
                Value<String> originalUrl = const Value.absent(),
                Value<String> kind = const Value.absent(),
                Value<String> sha256 = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BundleAssetsCompanion(
                bundleId: bundleId,
                path: path,
                originalUrl: originalUrl,
                kind: kind,
                sha256: sha256,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String bundleId,
                required String path,
                required String originalUrl,
                required String kind,
                required String sha256,
                Value<int> rowid = const Value.absent(),
              }) => BundleAssetsCompanion.insert(
                bundleId: bundleId,
                path: path,
                originalUrl: originalUrl,
                kind: kind,
                sha256: sha256,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$BundleAssetsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({bundleId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (bundleId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.bundleId,
                                referencedTable: $$BundleAssetsTableReferences
                                    ._bundleIdTable(db),
                                referencedColumn: $$BundleAssetsTableReferences
                                    ._bundleIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$BundleAssetsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BundleAssetsTable,
      BundleAssetRow,
      $$BundleAssetsTableFilterComposer,
      $$BundleAssetsTableOrderingComposer,
      $$BundleAssetsTableAnnotationComposer,
      $$BundleAssetsTableCreateCompanionBuilder,
      $$BundleAssetsTableUpdateCompanionBuilder,
      (BundleAssetRow, $$BundleAssetsTableReferences),
      BundleAssetRow,
      PrefetchHooks Function({bool bundleId})
    >;
typedef $$LocalSearchIndexTableCreateCompanionBuilder =
    LocalSearchIndexCompanion Function({
      required String bundleId,
      required String token,
      required String itemIds,
      Value<int> rowid,
    });
typedef $$LocalSearchIndexTableUpdateCompanionBuilder =
    LocalSearchIndexCompanion Function({
      Value<String> bundleId,
      Value<String> token,
      Value<String> itemIds,
      Value<int> rowid,
    });

final class $$LocalSearchIndexTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $LocalSearchIndexTable,
          LocalSearchIndexRow
        > {
  $$LocalSearchIndexTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $OfflineBundlesTable _bundleIdTable(_$AppDatabase db) =>
      db.offlineBundles.createAlias(
        $_aliasNameGenerator(
          db.localSearchIndex.bundleId,
          db.offlineBundles.id,
        ),
      );

  $$OfflineBundlesTableProcessedTableManager get bundleId {
    final $_column = $_itemColumn<String>('bundle_id')!;

    final manager = $$OfflineBundlesTableTableManager(
      $_db,
      $_db.offlineBundles,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_bundleIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$LocalSearchIndexTableFilterComposer
    extends Composer<_$AppDatabase, $LocalSearchIndexTable> {
  $$LocalSearchIndexTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get token => $composableBuilder(
    column: $table.token,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get itemIds => $composableBuilder(
    column: $table.itemIds,
    builder: (column) => ColumnFilters(column),
  );

  $$OfflineBundlesTableFilterComposer get bundleId {
    final $$OfflineBundlesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.bundleId,
      referencedTable: $db.offlineBundles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OfflineBundlesTableFilterComposer(
            $db: $db,
            $table: $db.offlineBundles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LocalSearchIndexTableOrderingComposer
    extends Composer<_$AppDatabase, $LocalSearchIndexTable> {
  $$LocalSearchIndexTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get token => $composableBuilder(
    column: $table.token,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get itemIds => $composableBuilder(
    column: $table.itemIds,
    builder: (column) => ColumnOrderings(column),
  );

  $$OfflineBundlesTableOrderingComposer get bundleId {
    final $$OfflineBundlesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.bundleId,
      referencedTable: $db.offlineBundles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OfflineBundlesTableOrderingComposer(
            $db: $db,
            $table: $db.offlineBundles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LocalSearchIndexTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocalSearchIndexTable> {
  $$LocalSearchIndexTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get token =>
      $composableBuilder(column: $table.token, builder: (column) => column);

  GeneratedColumn<String> get itemIds =>
      $composableBuilder(column: $table.itemIds, builder: (column) => column);

  $$OfflineBundlesTableAnnotationComposer get bundleId {
    final $$OfflineBundlesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.bundleId,
      referencedTable: $db.offlineBundles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OfflineBundlesTableAnnotationComposer(
            $db: $db,
            $table: $db.offlineBundles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LocalSearchIndexTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LocalSearchIndexTable,
          LocalSearchIndexRow,
          $$LocalSearchIndexTableFilterComposer,
          $$LocalSearchIndexTableOrderingComposer,
          $$LocalSearchIndexTableAnnotationComposer,
          $$LocalSearchIndexTableCreateCompanionBuilder,
          $$LocalSearchIndexTableUpdateCompanionBuilder,
          (LocalSearchIndexRow, $$LocalSearchIndexTableReferences),
          LocalSearchIndexRow,
          PrefetchHooks Function({bool bundleId})
        > {
  $$LocalSearchIndexTableTableManager(
    _$AppDatabase db,
    $LocalSearchIndexTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalSearchIndexTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalSearchIndexTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalSearchIndexTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> bundleId = const Value.absent(),
                Value<String> token = const Value.absent(),
                Value<String> itemIds = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LocalSearchIndexCompanion(
                bundleId: bundleId,
                token: token,
                itemIds: itemIds,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String bundleId,
                required String token,
                required String itemIds,
                Value<int> rowid = const Value.absent(),
              }) => LocalSearchIndexCompanion.insert(
                bundleId: bundleId,
                token: token,
                itemIds: itemIds,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$LocalSearchIndexTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({bundleId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (bundleId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.bundleId,
                                referencedTable:
                                    $$LocalSearchIndexTableReferences
                                        ._bundleIdTable(db),
                                referencedColumn:
                                    $$LocalSearchIndexTableReferences
                                        ._bundleIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$LocalSearchIndexTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LocalSearchIndexTable,
      LocalSearchIndexRow,
      $$LocalSearchIndexTableFilterComposer,
      $$LocalSearchIndexTableOrderingComposer,
      $$LocalSearchIndexTableAnnotationComposer,
      $$LocalSearchIndexTableCreateCompanionBuilder,
      $$LocalSearchIndexTableUpdateCompanionBuilder,
      (LocalSearchIndexRow, $$LocalSearchIndexTableReferences),
      LocalSearchIndexRow,
      PrefetchHooks Function({bool bundleId})
    >;
typedef $$KeyValueStoreTableCreateCompanionBuilder =
    KeyValueStoreCompanion Function({
      required String key,
      required String value,
      Value<int> rowid,
    });
typedef $$KeyValueStoreTableUpdateCompanionBuilder =
    KeyValueStoreCompanion Function({
      Value<String> key,
      Value<String> value,
      Value<int> rowid,
    });

class $$KeyValueStoreTableFilterComposer
    extends Composer<_$AppDatabase, $KeyValueStoreTable> {
  $$KeyValueStoreTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );
}

class $$KeyValueStoreTableOrderingComposer
    extends Composer<_$AppDatabase, $KeyValueStoreTable> {
  $$KeyValueStoreTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$KeyValueStoreTableAnnotationComposer
    extends Composer<_$AppDatabase, $KeyValueStoreTable> {
  $$KeyValueStoreTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$KeyValueStoreTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $KeyValueStoreTable,
          KeyValueStoreRow,
          $$KeyValueStoreTableFilterComposer,
          $$KeyValueStoreTableOrderingComposer,
          $$KeyValueStoreTableAnnotationComposer,
          $$KeyValueStoreTableCreateCompanionBuilder,
          $$KeyValueStoreTableUpdateCompanionBuilder,
          (
            KeyValueStoreRow,
            BaseReferences<
              _$AppDatabase,
              $KeyValueStoreTable,
              KeyValueStoreRow
            >,
          ),
          KeyValueStoreRow,
          PrefetchHooks Function()
        > {
  $$KeyValueStoreTableTableManager(_$AppDatabase db, $KeyValueStoreTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$KeyValueStoreTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$KeyValueStoreTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$KeyValueStoreTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<String> value = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) =>
                  KeyValueStoreCompanion(key: key, value: value, rowid: rowid),
          createCompanionCallback:
              ({
                required String key,
                required String value,
                Value<int> rowid = const Value.absent(),
              }) => KeyValueStoreCompanion.insert(
                key: key,
                value: value,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$KeyValueStoreTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $KeyValueStoreTable,
      KeyValueStoreRow,
      $$KeyValueStoreTableFilterComposer,
      $$KeyValueStoreTableOrderingComposer,
      $$KeyValueStoreTableAnnotationComposer,
      $$KeyValueStoreTableCreateCompanionBuilder,
      $$KeyValueStoreTableUpdateCompanionBuilder,
      (
        KeyValueStoreRow,
        BaseReferences<_$AppDatabase, $KeyValueStoreTable, KeyValueStoreRow>,
      ),
      KeyValueStoreRow,
      PrefetchHooks Function()
    >;
typedef $$LocalTourCacheEntriesTableCreateCompanionBuilder =
    LocalTourCacheEntriesCompanion Function({
      required String id,
      required String cityId,
      required String name,
      required String tagline,
      required String mainImageUrl,
      required int durationMinutes,
      required double priceUsd,
      required String type,
      required String categoryIds,
      required DateTime cachedAt,
      Value<int> rowid,
    });
typedef $$LocalTourCacheEntriesTableUpdateCompanionBuilder =
    LocalTourCacheEntriesCompanion Function({
      Value<String> id,
      Value<String> cityId,
      Value<String> name,
      Value<String> tagline,
      Value<String> mainImageUrl,
      Value<int> durationMinutes,
      Value<double> priceUsd,
      Value<String> type,
      Value<String> categoryIds,
      Value<DateTime> cachedAt,
      Value<int> rowid,
    });

class $$LocalTourCacheEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $LocalTourCacheEntriesTable> {
  $$LocalTourCacheEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cityId => $composableBuilder(
    column: $table.cityId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tagline => $composableBuilder(
    column: $table.tagline,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mainImageUrl => $composableBuilder(
    column: $table.mainImageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get priceUsd => $composableBuilder(
    column: $table.priceUsd,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get categoryIds => $composableBuilder(
    column: $table.categoryIds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LocalTourCacheEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $LocalTourCacheEntriesTable> {
  $$LocalTourCacheEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cityId => $composableBuilder(
    column: $table.cityId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tagline => $composableBuilder(
    column: $table.tagline,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mainImageUrl => $composableBuilder(
    column: $table.mainImageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get priceUsd => $composableBuilder(
    column: $table.priceUsd,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get categoryIds => $composableBuilder(
    column: $table.categoryIds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LocalTourCacheEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocalTourCacheEntriesTable> {
  $$LocalTourCacheEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get cityId =>
      $composableBuilder(column: $table.cityId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get tagline =>
      $composableBuilder(column: $table.tagline, builder: (column) => column);

  GeneratedColumn<String> get mainImageUrl => $composableBuilder(
    column: $table.mainImageUrl,
    builder: (column) => column,
  );

  GeneratedColumn<int> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<double> get priceUsd =>
      $composableBuilder(column: $table.priceUsd, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get categoryIds => $composableBuilder(
    column: $table.categoryIds,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);
}

class $$LocalTourCacheEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LocalTourCacheEntriesTable,
          LocalTourCacheEntry,
          $$LocalTourCacheEntriesTableFilterComposer,
          $$LocalTourCacheEntriesTableOrderingComposer,
          $$LocalTourCacheEntriesTableAnnotationComposer,
          $$LocalTourCacheEntriesTableCreateCompanionBuilder,
          $$LocalTourCacheEntriesTableUpdateCompanionBuilder,
          (
            LocalTourCacheEntry,
            BaseReferences<
              _$AppDatabase,
              $LocalTourCacheEntriesTable,
              LocalTourCacheEntry
            >,
          ),
          LocalTourCacheEntry,
          PrefetchHooks Function()
        > {
  $$LocalTourCacheEntriesTableTableManager(
    _$AppDatabase db,
    $LocalTourCacheEntriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalTourCacheEntriesTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$LocalTourCacheEntriesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$LocalTourCacheEntriesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> cityId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> tagline = const Value.absent(),
                Value<String> mainImageUrl = const Value.absent(),
                Value<int> durationMinutes = const Value.absent(),
                Value<double> priceUsd = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String> categoryIds = const Value.absent(),
                Value<DateTime> cachedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LocalTourCacheEntriesCompanion(
                id: id,
                cityId: cityId,
                name: name,
                tagline: tagline,
                mainImageUrl: mainImageUrl,
                durationMinutes: durationMinutes,
                priceUsd: priceUsd,
                type: type,
                categoryIds: categoryIds,
                cachedAt: cachedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String cityId,
                required String name,
                required String tagline,
                required String mainImageUrl,
                required int durationMinutes,
                required double priceUsd,
                required String type,
                required String categoryIds,
                required DateTime cachedAt,
                Value<int> rowid = const Value.absent(),
              }) => LocalTourCacheEntriesCompanion.insert(
                id: id,
                cityId: cityId,
                name: name,
                tagline: tagline,
                mainImageUrl: mainImageUrl,
                durationMinutes: durationMinutes,
                priceUsd: priceUsd,
                type: type,
                categoryIds: categoryIds,
                cachedAt: cachedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LocalTourCacheEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LocalTourCacheEntriesTable,
      LocalTourCacheEntry,
      $$LocalTourCacheEntriesTableFilterComposer,
      $$LocalTourCacheEntriesTableOrderingComposer,
      $$LocalTourCacheEntriesTableAnnotationComposer,
      $$LocalTourCacheEntriesTableCreateCompanionBuilder,
      $$LocalTourCacheEntriesTableUpdateCompanionBuilder,
      (
        LocalTourCacheEntry,
        BaseReferences<
          _$AppDatabase,
          $LocalTourCacheEntriesTable,
          LocalTourCacheEntry
        >,
      ),
      LocalTourCacheEntry,
      PrefetchHooks Function()
    >;
typedef $$LocalSavedTourEntriesTableCreateCompanionBuilder =
    LocalSavedTourEntriesCompanion Function({
      required String id,
      required String tourId,
      required String userId,
      required DateTime savedAt,
      Value<DateTime?> lastOpenedAt,
      Value<int> rowid,
    });
typedef $$LocalSavedTourEntriesTableUpdateCompanionBuilder =
    LocalSavedTourEntriesCompanion Function({
      Value<String> id,
      Value<String> tourId,
      Value<String> userId,
      Value<DateTime> savedAt,
      Value<DateTime?> lastOpenedAt,
      Value<int> rowid,
    });

class $$LocalSavedTourEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $LocalSavedTourEntriesTable> {
  $$LocalSavedTourEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tourId => $composableBuilder(
    column: $table.tourId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get savedAt => $composableBuilder(
    column: $table.savedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastOpenedAt => $composableBuilder(
    column: $table.lastOpenedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LocalSavedTourEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $LocalSavedTourEntriesTable> {
  $$LocalSavedTourEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tourId => $composableBuilder(
    column: $table.tourId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get savedAt => $composableBuilder(
    column: $table.savedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastOpenedAt => $composableBuilder(
    column: $table.lastOpenedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LocalSavedTourEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocalSavedTourEntriesTable> {
  $$LocalSavedTourEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get tourId =>
      $composableBuilder(column: $table.tourId, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get savedAt =>
      $composableBuilder(column: $table.savedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastOpenedAt => $composableBuilder(
    column: $table.lastOpenedAt,
    builder: (column) => column,
  );
}

class $$LocalSavedTourEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LocalSavedTourEntriesTable,
          LocalSavedTourEntry,
          $$LocalSavedTourEntriesTableFilterComposer,
          $$LocalSavedTourEntriesTableOrderingComposer,
          $$LocalSavedTourEntriesTableAnnotationComposer,
          $$LocalSavedTourEntriesTableCreateCompanionBuilder,
          $$LocalSavedTourEntriesTableUpdateCompanionBuilder,
          (
            LocalSavedTourEntry,
            BaseReferences<
              _$AppDatabase,
              $LocalSavedTourEntriesTable,
              LocalSavedTourEntry
            >,
          ),
          LocalSavedTourEntry,
          PrefetchHooks Function()
        > {
  $$LocalSavedTourEntriesTableTableManager(
    _$AppDatabase db,
    $LocalSavedTourEntriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalSavedTourEntriesTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$LocalSavedTourEntriesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$LocalSavedTourEntriesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> tourId = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<DateTime> savedAt = const Value.absent(),
                Value<DateTime?> lastOpenedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LocalSavedTourEntriesCompanion(
                id: id,
                tourId: tourId,
                userId: userId,
                savedAt: savedAt,
                lastOpenedAt: lastOpenedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String tourId,
                required String userId,
                required DateTime savedAt,
                Value<DateTime?> lastOpenedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LocalSavedTourEntriesCompanion.insert(
                id: id,
                tourId: tourId,
                userId: userId,
                savedAt: savedAt,
                lastOpenedAt: lastOpenedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LocalSavedTourEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LocalSavedTourEntriesTable,
      LocalSavedTourEntry,
      $$LocalSavedTourEntriesTableFilterComposer,
      $$LocalSavedTourEntriesTableOrderingComposer,
      $$LocalSavedTourEntriesTableAnnotationComposer,
      $$LocalSavedTourEntriesTableCreateCompanionBuilder,
      $$LocalSavedTourEntriesTableUpdateCompanionBuilder,
      (
        LocalSavedTourEntry,
        BaseReferences<
          _$AppDatabase,
          $LocalSavedTourEntriesTable,
          LocalSavedTourEntry
        >,
      ),
      LocalSavedTourEntry,
      PrefetchHooks Function()
    >;
typedef $$LocalTourProgressEntriesTableCreateCompanionBuilder =
    LocalTourProgressEntriesCompanion Function({
      required String tourId,
      required String userId,
      Value<int> audioPositionMs,
      Value<int> currentSection,
      Value<bool> completed,
      required DateTime lastUpdatedAt,
      Value<int> rowid,
    });
typedef $$LocalTourProgressEntriesTableUpdateCompanionBuilder =
    LocalTourProgressEntriesCompanion Function({
      Value<String> tourId,
      Value<String> userId,
      Value<int> audioPositionMs,
      Value<int> currentSection,
      Value<bool> completed,
      Value<DateTime> lastUpdatedAt,
      Value<int> rowid,
    });

class $$LocalTourProgressEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $LocalTourProgressEntriesTable> {
  $$LocalTourProgressEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get tourId => $composableBuilder(
    column: $table.tourId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get audioPositionMs => $composableBuilder(
    column: $table.audioPositionMs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get currentSection => $composableBuilder(
    column: $table.currentSection,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get completed => $composableBuilder(
    column: $table.completed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastUpdatedAt => $composableBuilder(
    column: $table.lastUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LocalTourProgressEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $LocalTourProgressEntriesTable> {
  $$LocalTourProgressEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get tourId => $composableBuilder(
    column: $table.tourId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get audioPositionMs => $composableBuilder(
    column: $table.audioPositionMs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get currentSection => $composableBuilder(
    column: $table.currentSection,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get completed => $composableBuilder(
    column: $table.completed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastUpdatedAt => $composableBuilder(
    column: $table.lastUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LocalTourProgressEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocalTourProgressEntriesTable> {
  $$LocalTourProgressEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get tourId =>
      $composableBuilder(column: $table.tourId, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<int> get audioPositionMs => $composableBuilder(
    column: $table.audioPositionMs,
    builder: (column) => column,
  );

  GeneratedColumn<int> get currentSection => $composableBuilder(
    column: $table.currentSection,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get completed =>
      $composableBuilder(column: $table.completed, builder: (column) => column);

  GeneratedColumn<DateTime> get lastUpdatedAt => $composableBuilder(
    column: $table.lastUpdatedAt,
    builder: (column) => column,
  );
}

class $$LocalTourProgressEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LocalTourProgressEntriesTable,
          LocalTourProgressEntry,
          $$LocalTourProgressEntriesTableFilterComposer,
          $$LocalTourProgressEntriesTableOrderingComposer,
          $$LocalTourProgressEntriesTableAnnotationComposer,
          $$LocalTourProgressEntriesTableCreateCompanionBuilder,
          $$LocalTourProgressEntriesTableUpdateCompanionBuilder,
          (
            LocalTourProgressEntry,
            BaseReferences<
              _$AppDatabase,
              $LocalTourProgressEntriesTable,
              LocalTourProgressEntry
            >,
          ),
          LocalTourProgressEntry,
          PrefetchHooks Function()
        > {
  $$LocalTourProgressEntriesTableTableManager(
    _$AppDatabase db,
    $LocalTourProgressEntriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalTourProgressEntriesTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$LocalTourProgressEntriesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$LocalTourProgressEntriesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> tourId = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<int> audioPositionMs = const Value.absent(),
                Value<int> currentSection = const Value.absent(),
                Value<bool> completed = const Value.absent(),
                Value<DateTime> lastUpdatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LocalTourProgressEntriesCompanion(
                tourId: tourId,
                userId: userId,
                audioPositionMs: audioPositionMs,
                currentSection: currentSection,
                completed: completed,
                lastUpdatedAt: lastUpdatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String tourId,
                required String userId,
                Value<int> audioPositionMs = const Value.absent(),
                Value<int> currentSection = const Value.absent(),
                Value<bool> completed = const Value.absent(),
                required DateTime lastUpdatedAt,
                Value<int> rowid = const Value.absent(),
              }) => LocalTourProgressEntriesCompanion.insert(
                tourId: tourId,
                userId: userId,
                audioPositionMs: audioPositionMs,
                currentSection: currentSection,
                completed: completed,
                lastUpdatedAt: lastUpdatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LocalTourProgressEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LocalTourProgressEntriesTable,
      LocalTourProgressEntry,
      $$LocalTourProgressEntriesTableFilterComposer,
      $$LocalTourProgressEntriesTableOrderingComposer,
      $$LocalTourProgressEntriesTableAnnotationComposer,
      $$LocalTourProgressEntriesTableCreateCompanionBuilder,
      $$LocalTourProgressEntriesTableUpdateCompanionBuilder,
      (
        LocalTourProgressEntry,
        BaseReferences<
          _$AppDatabase,
          $LocalTourProgressEntriesTable,
          LocalTourProgressEntry
        >,
      ),
      LocalTourProgressEntry,
      PrefetchHooks Function()
    >;
typedef $$LocalTourDownloadEntriesTableCreateCompanionBuilder =
    LocalTourDownloadEntriesCompanion Function({
      required String tourId,
      required String contentJson,
      Value<String?> audioFilePath,
      required String languageCode,
      required DateTime downloadedAt,
      Value<int> rowid,
    });
typedef $$LocalTourDownloadEntriesTableUpdateCompanionBuilder =
    LocalTourDownloadEntriesCompanion Function({
      Value<String> tourId,
      Value<String> contentJson,
      Value<String?> audioFilePath,
      Value<String> languageCode,
      Value<DateTime> downloadedAt,
      Value<int> rowid,
    });

class $$LocalTourDownloadEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $LocalTourDownloadEntriesTable> {
  $$LocalTourDownloadEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get tourId => $composableBuilder(
    column: $table.tourId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get contentJson => $composableBuilder(
    column: $table.contentJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get audioFilePath => $composableBuilder(
    column: $table.audioFilePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get languageCode => $composableBuilder(
    column: $table.languageCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get downloadedAt => $composableBuilder(
    column: $table.downloadedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LocalTourDownloadEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $LocalTourDownloadEntriesTable> {
  $$LocalTourDownloadEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get tourId => $composableBuilder(
    column: $table.tourId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contentJson => $composableBuilder(
    column: $table.contentJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get audioFilePath => $composableBuilder(
    column: $table.audioFilePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get languageCode => $composableBuilder(
    column: $table.languageCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get downloadedAt => $composableBuilder(
    column: $table.downloadedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LocalTourDownloadEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocalTourDownloadEntriesTable> {
  $$LocalTourDownloadEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get tourId =>
      $composableBuilder(column: $table.tourId, builder: (column) => column);

  GeneratedColumn<String> get contentJson => $composableBuilder(
    column: $table.contentJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get audioFilePath => $composableBuilder(
    column: $table.audioFilePath,
    builder: (column) => column,
  );

  GeneratedColumn<String> get languageCode => $composableBuilder(
    column: $table.languageCode,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get downloadedAt => $composableBuilder(
    column: $table.downloadedAt,
    builder: (column) => column,
  );
}

class $$LocalTourDownloadEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LocalTourDownloadEntriesTable,
          LocalTourDownloadEntry,
          $$LocalTourDownloadEntriesTableFilterComposer,
          $$LocalTourDownloadEntriesTableOrderingComposer,
          $$LocalTourDownloadEntriesTableAnnotationComposer,
          $$LocalTourDownloadEntriesTableCreateCompanionBuilder,
          $$LocalTourDownloadEntriesTableUpdateCompanionBuilder,
          (
            LocalTourDownloadEntry,
            BaseReferences<
              _$AppDatabase,
              $LocalTourDownloadEntriesTable,
              LocalTourDownloadEntry
            >,
          ),
          LocalTourDownloadEntry,
          PrefetchHooks Function()
        > {
  $$LocalTourDownloadEntriesTableTableManager(
    _$AppDatabase db,
    $LocalTourDownloadEntriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalTourDownloadEntriesTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$LocalTourDownloadEntriesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$LocalTourDownloadEntriesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> tourId = const Value.absent(),
                Value<String> contentJson = const Value.absent(),
                Value<String?> audioFilePath = const Value.absent(),
                Value<String> languageCode = const Value.absent(),
                Value<DateTime> downloadedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LocalTourDownloadEntriesCompanion(
                tourId: tourId,
                contentJson: contentJson,
                audioFilePath: audioFilePath,
                languageCode: languageCode,
                downloadedAt: downloadedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String tourId,
                required String contentJson,
                Value<String?> audioFilePath = const Value.absent(),
                required String languageCode,
                required DateTime downloadedAt,
                Value<int> rowid = const Value.absent(),
              }) => LocalTourDownloadEntriesCompanion.insert(
                tourId: tourId,
                contentJson: contentJson,
                audioFilePath: audioFilePath,
                languageCode: languageCode,
                downloadedAt: downloadedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LocalTourDownloadEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LocalTourDownloadEntriesTable,
      LocalTourDownloadEntry,
      $$LocalTourDownloadEntriesTableFilterComposer,
      $$LocalTourDownloadEntriesTableOrderingComposer,
      $$LocalTourDownloadEntriesTableAnnotationComposer,
      $$LocalTourDownloadEntriesTableCreateCompanionBuilder,
      $$LocalTourDownloadEntriesTableUpdateCompanionBuilder,
      (
        LocalTourDownloadEntry,
        BaseReferences<
          _$AppDatabase,
          $LocalTourDownloadEntriesTable,
          LocalTourDownloadEntry
        >,
      ),
      LocalTourDownloadEntry,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ItinerariesTableTableManager get itineraries =>
      $$ItinerariesTableTableManager(_db, _db.itineraries);
  $$SavedItemsTableTableManager get savedItems =>
      $$SavedItemsTableTableManager(_db, _db.savedItems);
  $$SyncQueueTableTableManager get syncQueue =>
      $$SyncQueueTableTableManager(_db, _db.syncQueue);
  $$TransportCacheTableTableManager get transportCache =>
      $$TransportCacheTableTableManager(_db, _db.transportCache);
  $$CalendarCacheTableTableManager get calendarCache =>
      $$CalendarCacheTableTableManager(_db, _db.calendarCache);
  $$AccommodationCacheTableTableManager get accommodationCache =>
      $$AccommodationCacheTableTableManager(_db, _db.accommodationCache);
  $$PropertyDetailCacheTableTableManager get propertyDetailCache =>
      $$PropertyDetailCacheTableTableManager(_db, _db.propertyDetailCache);
  $$EntertainmentCacheTableTableManager get entertainmentCache =>
      $$EntertainmentCacheTableTableManager(_db, _db.entertainmentCache);
  $$GastronomyCacheTableTableManager get gastronomyCache =>
      $$GastronomyCacheTableTableManager(_db, _db.gastronomyCache);
  $$EventsCacheTableTableManager get eventsCache =>
      $$EventsCacheTableTableManager(_db, _db.eventsCache);
  $$TrailsCacheTableTableManager get trailsCache =>
      $$TrailsCacheTableTableManager(_db, _db.trailsCache);
  $$MapTilesCacheTableTableManager get mapTilesCache =>
      $$MapTilesCacheTableTableManager(_db, _db.mapTilesCache);
  $$MapItemsCacheTableTableManager get mapItemsCache =>
      $$MapItemsCacheTableTableManager(_db, _db.mapItemsCache);
  $$DayPlansTableTableManager get dayPlans =>
      $$DayPlansTableTableManager(_db, _db.dayPlans);
  $$DayPlanEntriesTableTableManager get dayPlanEntries =>
      $$DayPlanEntriesTableTableManager(_db, _db.dayPlanEntries);
  $$OfflineBundlesTableTableManager get offlineBundles =>
      $$OfflineBundlesTableTableManager(_db, _db.offlineBundles);
  $$BundleAssetsTableTableManager get bundleAssets =>
      $$BundleAssetsTableTableManager(_db, _db.bundleAssets);
  $$LocalSearchIndexTableTableManager get localSearchIndex =>
      $$LocalSearchIndexTableTableManager(_db, _db.localSearchIndex);
  $$KeyValueStoreTableTableManager get keyValueStore =>
      $$KeyValueStoreTableTableManager(_db, _db.keyValueStore);
  $$LocalTourCacheEntriesTableTableManager get localTourCacheEntries =>
      $$LocalTourCacheEntriesTableTableManager(_db, _db.localTourCacheEntries);
  $$LocalSavedTourEntriesTableTableManager get localSavedTourEntries =>
      $$LocalSavedTourEntriesTableTableManager(_db, _db.localSavedTourEntries);
  $$LocalTourProgressEntriesTableTableManager get localTourProgressEntries =>
      $$LocalTourProgressEntriesTableTableManager(
        _db,
        _db.localTourProgressEntries,
      );
  $$LocalTourDownloadEntriesTableTableManager get localTourDownloadEntries =>
      $$LocalTourDownloadEntriesTableTableManager(
        _db,
        _db.localTourDownloadEntries,
      );
}
