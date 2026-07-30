// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_database.dart';

// ignore_for_file: type=lint
class $CachedChildrenTable extends CachedChildren
    with TableInfo<$CachedChildrenTable, CachedChildrenData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedChildrenTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _accountReferenceMeta = const VerificationMeta(
    'accountReference',
  );
  @override
  late final GeneratedColumn<String> accountReference = GeneratedColumn<String>(
    'account_reference',
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
  static const VerificationMeta _dataVersionMeta = const VerificationMeta(
    'dataVersion',
  );
  @override
  late final GeneratedColumn<int> dataVersion = GeneratedColumn<int>(
    'data_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _schemaVersionMeta = const VerificationMeta(
    'schemaVersion',
  );
  @override
  late final GeneratedColumn<int> schemaVersion = GeneratedColumn<int>(
    'schema_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _serialMeta = const VerificationMeta('serial');
  @override
  late final GeneratedColumn<String> serial = GeneratedColumn<String>(
    'serial',
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
  @override
  List<GeneratedColumn> get $columns => [
    accountReference,
    cachedAt,
    expiresAt,
    dataVersion,
    schemaVersion,
    serial,
    payload,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_children';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedChildrenData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('account_reference')) {
      context.handle(
        _accountReferenceMeta,
        accountReference.isAcceptableOrUnknown(
          data['account_reference']!,
          _accountReferenceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_accountReferenceMeta);
    }
    if (data.containsKey('cached_at')) {
      context.handle(
        _cachedAtMeta,
        cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_cachedAtMeta);
    }
    if (data.containsKey('expires_at')) {
      context.handle(
        _expiresAtMeta,
        expiresAt.isAcceptableOrUnknown(data['expires_at']!, _expiresAtMeta),
      );
    } else if (isInserting) {
      context.missing(_expiresAtMeta);
    }
    if (data.containsKey('data_version')) {
      context.handle(
        _dataVersionMeta,
        dataVersion.isAcceptableOrUnknown(
          data['data_version']!,
          _dataVersionMeta,
        ),
      );
    }
    if (data.containsKey('schema_version')) {
      context.handle(
        _schemaVersionMeta,
        schemaVersion.isAcceptableOrUnknown(
          data['schema_version']!,
          _schemaVersionMeta,
        ),
      );
    }
    if (data.containsKey('serial')) {
      context.handle(
        _serialMeta,
        serial.isAcceptableOrUnknown(data['serial']!, _serialMeta),
      );
    } else if (isInserting) {
      context.missing(_serialMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {accountReference, serial};
  @override
  CachedChildrenData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedChildrenData(
      accountReference: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}account_reference'],
      )!,
      cachedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}cached_at'],
      )!,
      expiresAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}expires_at'],
      )!,
      dataVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}data_version'],
      )!,
      schemaVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}schema_version'],
      )!,
      serial: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}serial'],
      )!,
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      )!,
    );
  }

  @override
  $CachedChildrenTable createAlias(String alias) {
    return $CachedChildrenTable(attachedDatabase, alias);
  }
}

class CachedChildrenData extends DataClass
    implements Insertable<CachedChildrenData> {
  final String accountReference;
  final DateTime cachedAt;
  final DateTime expiresAt;
  final int dataVersion;
  final int schemaVersion;
  final String serial;
  final String payload;
  const CachedChildrenData({
    required this.accountReference,
    required this.cachedAt,
    required this.expiresAt,
    required this.dataVersion,
    required this.schemaVersion,
    required this.serial,
    required this.payload,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['account_reference'] = Variable<String>(accountReference);
    map['cached_at'] = Variable<DateTime>(cachedAt);
    map['expires_at'] = Variable<DateTime>(expiresAt);
    map['data_version'] = Variable<int>(dataVersion);
    map['schema_version'] = Variable<int>(schemaVersion);
    map['serial'] = Variable<String>(serial);
    map['payload'] = Variable<String>(payload);
    return map;
  }

  CachedChildrenCompanion toCompanion(bool nullToAbsent) {
    return CachedChildrenCompanion(
      accountReference: Value(accountReference),
      cachedAt: Value(cachedAt),
      expiresAt: Value(expiresAt),
      dataVersion: Value(dataVersion),
      schemaVersion: Value(schemaVersion),
      serial: Value(serial),
      payload: Value(payload),
    );
  }

  factory CachedChildrenData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedChildrenData(
      accountReference: serializer.fromJson<String>(json['accountReference']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
      expiresAt: serializer.fromJson<DateTime>(json['expiresAt']),
      dataVersion: serializer.fromJson<int>(json['dataVersion']),
      schemaVersion: serializer.fromJson<int>(json['schemaVersion']),
      serial: serializer.fromJson<String>(json['serial']),
      payload: serializer.fromJson<String>(json['payload']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'accountReference': serializer.toJson<String>(accountReference),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
      'expiresAt': serializer.toJson<DateTime>(expiresAt),
      'dataVersion': serializer.toJson<int>(dataVersion),
      'schemaVersion': serializer.toJson<int>(schemaVersion),
      'serial': serializer.toJson<String>(serial),
      'payload': serializer.toJson<String>(payload),
    };
  }

  CachedChildrenData copyWith({
    String? accountReference,
    DateTime? cachedAt,
    DateTime? expiresAt,
    int? dataVersion,
    int? schemaVersion,
    String? serial,
    String? payload,
  }) => CachedChildrenData(
    accountReference: accountReference ?? this.accountReference,
    cachedAt: cachedAt ?? this.cachedAt,
    expiresAt: expiresAt ?? this.expiresAt,
    dataVersion: dataVersion ?? this.dataVersion,
    schemaVersion: schemaVersion ?? this.schemaVersion,
    serial: serial ?? this.serial,
    payload: payload ?? this.payload,
  );
  CachedChildrenData copyWithCompanion(CachedChildrenCompanion data) {
    return CachedChildrenData(
      accountReference: data.accountReference.present
          ? data.accountReference.value
          : this.accountReference,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
      expiresAt: data.expiresAt.present ? data.expiresAt.value : this.expiresAt,
      dataVersion: data.dataVersion.present
          ? data.dataVersion.value
          : this.dataVersion,
      schemaVersion: data.schemaVersion.present
          ? data.schemaVersion.value
          : this.schemaVersion,
      serial: data.serial.present ? data.serial.value : this.serial,
      payload: data.payload.present ? data.payload.value : this.payload,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedChildrenData(')
          ..write('accountReference: $accountReference, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('dataVersion: $dataVersion, ')
          ..write('schemaVersion: $schemaVersion, ')
          ..write('serial: $serial, ')
          ..write('payload: $payload')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    accountReference,
    cachedAt,
    expiresAt,
    dataVersion,
    schemaVersion,
    serial,
    payload,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedChildrenData &&
          other.accountReference == this.accountReference &&
          other.cachedAt == this.cachedAt &&
          other.expiresAt == this.expiresAt &&
          other.dataVersion == this.dataVersion &&
          other.schemaVersion == this.schemaVersion &&
          other.serial == this.serial &&
          other.payload == this.payload);
}

class CachedChildrenCompanion extends UpdateCompanion<CachedChildrenData> {
  final Value<String> accountReference;
  final Value<DateTime> cachedAt;
  final Value<DateTime> expiresAt;
  final Value<int> dataVersion;
  final Value<int> schemaVersion;
  final Value<String> serial;
  final Value<String> payload;
  final Value<int> rowid;
  const CachedChildrenCompanion({
    this.accountReference = const Value.absent(),
    this.cachedAt = const Value.absent(),
    this.expiresAt = const Value.absent(),
    this.dataVersion = const Value.absent(),
    this.schemaVersion = const Value.absent(),
    this.serial = const Value.absent(),
    this.payload = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedChildrenCompanion.insert({
    required String accountReference,
    required DateTime cachedAt,
    required DateTime expiresAt,
    this.dataVersion = const Value.absent(),
    this.schemaVersion = const Value.absent(),
    required String serial,
    required String payload,
    this.rowid = const Value.absent(),
  }) : accountReference = Value(accountReference),
       cachedAt = Value(cachedAt),
       expiresAt = Value(expiresAt),
       serial = Value(serial),
       payload = Value(payload);
  static Insertable<CachedChildrenData> custom({
    Expression<String>? accountReference,
    Expression<DateTime>? cachedAt,
    Expression<DateTime>? expiresAt,
    Expression<int>? dataVersion,
    Expression<int>? schemaVersion,
    Expression<String>? serial,
    Expression<String>? payload,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (accountReference != null) 'account_reference': accountReference,
      if (cachedAt != null) 'cached_at': cachedAt,
      if (expiresAt != null) 'expires_at': expiresAt,
      if (dataVersion != null) 'data_version': dataVersion,
      if (schemaVersion != null) 'schema_version': schemaVersion,
      if (serial != null) 'serial': serial,
      if (payload != null) 'payload': payload,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedChildrenCompanion copyWith({
    Value<String>? accountReference,
    Value<DateTime>? cachedAt,
    Value<DateTime>? expiresAt,
    Value<int>? dataVersion,
    Value<int>? schemaVersion,
    Value<String>? serial,
    Value<String>? payload,
    Value<int>? rowid,
  }) {
    return CachedChildrenCompanion(
      accountReference: accountReference ?? this.accountReference,
      cachedAt: cachedAt ?? this.cachedAt,
      expiresAt: expiresAt ?? this.expiresAt,
      dataVersion: dataVersion ?? this.dataVersion,
      schemaVersion: schemaVersion ?? this.schemaVersion,
      serial: serial ?? this.serial,
      payload: payload ?? this.payload,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (accountReference.present) {
      map['account_reference'] = Variable<String>(accountReference.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    if (expiresAt.present) {
      map['expires_at'] = Variable<DateTime>(expiresAt.value);
    }
    if (dataVersion.present) {
      map['data_version'] = Variable<int>(dataVersion.value);
    }
    if (schemaVersion.present) {
      map['schema_version'] = Variable<int>(schemaVersion.value);
    }
    if (serial.present) {
      map['serial'] = Variable<String>(serial.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedChildrenCompanion(')
          ..write('accountReference: $accountReference, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('dataVersion: $dataVersion, ')
          ..write('schemaVersion: $schemaVersion, ')
          ..write('serial: $serial, ')
          ..write('payload: $payload, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CachedAcademicPeriodsTable extends CachedAcademicPeriods
    with TableInfo<$CachedAcademicPeriodsTable, CachedAcademicPeriod> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedAcademicPeriodsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _accountReferenceMeta = const VerificationMeta(
    'accountReference',
  );
  @override
  late final GeneratedColumn<String> accountReference = GeneratedColumn<String>(
    'account_reference',
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
  static const VerificationMeta _dataVersionMeta = const VerificationMeta(
    'dataVersion',
  );
  @override
  late final GeneratedColumn<int> dataVersion = GeneratedColumn<int>(
    'data_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _schemaVersionMeta = const VerificationMeta(
    'schemaVersion',
  );
  @override
  late final GeneratedColumn<int> schemaVersion = GeneratedColumn<int>(
    'schema_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _periodReferenceMeta = const VerificationMeta(
    'periodReference',
  );
  @override
  late final GeneratedColumn<String> periodReference = GeneratedColumn<String>(
    'period_reference',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _serialMeta = const VerificationMeta('serial');
  @override
  late final GeneratedColumn<String> serial = GeneratedColumn<String>(
    'serial',
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
  @override
  List<GeneratedColumn> get $columns => [
    accountReference,
    cachedAt,
    expiresAt,
    dataVersion,
    schemaVersion,
    periodReference,
    serial,
    payload,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_academic_periods';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedAcademicPeriod> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('account_reference')) {
      context.handle(
        _accountReferenceMeta,
        accountReference.isAcceptableOrUnknown(
          data['account_reference']!,
          _accountReferenceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_accountReferenceMeta);
    }
    if (data.containsKey('cached_at')) {
      context.handle(
        _cachedAtMeta,
        cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_cachedAtMeta);
    }
    if (data.containsKey('expires_at')) {
      context.handle(
        _expiresAtMeta,
        expiresAt.isAcceptableOrUnknown(data['expires_at']!, _expiresAtMeta),
      );
    } else if (isInserting) {
      context.missing(_expiresAtMeta);
    }
    if (data.containsKey('data_version')) {
      context.handle(
        _dataVersionMeta,
        dataVersion.isAcceptableOrUnknown(
          data['data_version']!,
          _dataVersionMeta,
        ),
      );
    }
    if (data.containsKey('schema_version')) {
      context.handle(
        _schemaVersionMeta,
        schemaVersion.isAcceptableOrUnknown(
          data['schema_version']!,
          _schemaVersionMeta,
        ),
      );
    }
    if (data.containsKey('period_reference')) {
      context.handle(
        _periodReferenceMeta,
        periodReference.isAcceptableOrUnknown(
          data['period_reference']!,
          _periodReferenceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_periodReferenceMeta);
    }
    if (data.containsKey('serial')) {
      context.handle(
        _serialMeta,
        serial.isAcceptableOrUnknown(data['serial']!, _serialMeta),
      );
    } else if (isInserting) {
      context.missing(_serialMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {
    accountReference,
    periodReference,
    serial,
  };
  @override
  CachedAcademicPeriod map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedAcademicPeriod(
      accountReference: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}account_reference'],
      )!,
      cachedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}cached_at'],
      )!,
      expiresAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}expires_at'],
      )!,
      dataVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}data_version'],
      )!,
      schemaVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}schema_version'],
      )!,
      periodReference: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}period_reference'],
      )!,
      serial: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}serial'],
      )!,
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      )!,
    );
  }

  @override
  $CachedAcademicPeriodsTable createAlias(String alias) {
    return $CachedAcademicPeriodsTable(attachedDatabase, alias);
  }
}

class CachedAcademicPeriod extends DataClass
    implements Insertable<CachedAcademicPeriod> {
  final String accountReference;
  final DateTime cachedAt;
  final DateTime expiresAt;
  final int dataVersion;
  final int schemaVersion;
  final String periodReference;
  final String serial;
  final String payload;
  const CachedAcademicPeriod({
    required this.accountReference,
    required this.cachedAt,
    required this.expiresAt,
    required this.dataVersion,
    required this.schemaVersion,
    required this.periodReference,
    required this.serial,
    required this.payload,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['account_reference'] = Variable<String>(accountReference);
    map['cached_at'] = Variable<DateTime>(cachedAt);
    map['expires_at'] = Variable<DateTime>(expiresAt);
    map['data_version'] = Variable<int>(dataVersion);
    map['schema_version'] = Variable<int>(schemaVersion);
    map['period_reference'] = Variable<String>(periodReference);
    map['serial'] = Variable<String>(serial);
    map['payload'] = Variable<String>(payload);
    return map;
  }

  CachedAcademicPeriodsCompanion toCompanion(bool nullToAbsent) {
    return CachedAcademicPeriodsCompanion(
      accountReference: Value(accountReference),
      cachedAt: Value(cachedAt),
      expiresAt: Value(expiresAt),
      dataVersion: Value(dataVersion),
      schemaVersion: Value(schemaVersion),
      periodReference: Value(periodReference),
      serial: Value(serial),
      payload: Value(payload),
    );
  }

  factory CachedAcademicPeriod.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedAcademicPeriod(
      accountReference: serializer.fromJson<String>(json['accountReference']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
      expiresAt: serializer.fromJson<DateTime>(json['expiresAt']),
      dataVersion: serializer.fromJson<int>(json['dataVersion']),
      schemaVersion: serializer.fromJson<int>(json['schemaVersion']),
      periodReference: serializer.fromJson<String>(json['periodReference']),
      serial: serializer.fromJson<String>(json['serial']),
      payload: serializer.fromJson<String>(json['payload']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'accountReference': serializer.toJson<String>(accountReference),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
      'expiresAt': serializer.toJson<DateTime>(expiresAt),
      'dataVersion': serializer.toJson<int>(dataVersion),
      'schemaVersion': serializer.toJson<int>(schemaVersion),
      'periodReference': serializer.toJson<String>(periodReference),
      'serial': serializer.toJson<String>(serial),
      'payload': serializer.toJson<String>(payload),
    };
  }

  CachedAcademicPeriod copyWith({
    String? accountReference,
    DateTime? cachedAt,
    DateTime? expiresAt,
    int? dataVersion,
    int? schemaVersion,
    String? periodReference,
    String? serial,
    String? payload,
  }) => CachedAcademicPeriod(
    accountReference: accountReference ?? this.accountReference,
    cachedAt: cachedAt ?? this.cachedAt,
    expiresAt: expiresAt ?? this.expiresAt,
    dataVersion: dataVersion ?? this.dataVersion,
    schemaVersion: schemaVersion ?? this.schemaVersion,
    periodReference: periodReference ?? this.periodReference,
    serial: serial ?? this.serial,
    payload: payload ?? this.payload,
  );
  CachedAcademicPeriod copyWithCompanion(CachedAcademicPeriodsCompanion data) {
    return CachedAcademicPeriod(
      accountReference: data.accountReference.present
          ? data.accountReference.value
          : this.accountReference,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
      expiresAt: data.expiresAt.present ? data.expiresAt.value : this.expiresAt,
      dataVersion: data.dataVersion.present
          ? data.dataVersion.value
          : this.dataVersion,
      schemaVersion: data.schemaVersion.present
          ? data.schemaVersion.value
          : this.schemaVersion,
      periodReference: data.periodReference.present
          ? data.periodReference.value
          : this.periodReference,
      serial: data.serial.present ? data.serial.value : this.serial,
      payload: data.payload.present ? data.payload.value : this.payload,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedAcademicPeriod(')
          ..write('accountReference: $accountReference, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('dataVersion: $dataVersion, ')
          ..write('schemaVersion: $schemaVersion, ')
          ..write('periodReference: $periodReference, ')
          ..write('serial: $serial, ')
          ..write('payload: $payload')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    accountReference,
    cachedAt,
    expiresAt,
    dataVersion,
    schemaVersion,
    periodReference,
    serial,
    payload,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedAcademicPeriod &&
          other.accountReference == this.accountReference &&
          other.cachedAt == this.cachedAt &&
          other.expiresAt == this.expiresAt &&
          other.dataVersion == this.dataVersion &&
          other.schemaVersion == this.schemaVersion &&
          other.periodReference == this.periodReference &&
          other.serial == this.serial &&
          other.payload == this.payload);
}

class CachedAcademicPeriodsCompanion
    extends UpdateCompanion<CachedAcademicPeriod> {
  final Value<String> accountReference;
  final Value<DateTime> cachedAt;
  final Value<DateTime> expiresAt;
  final Value<int> dataVersion;
  final Value<int> schemaVersion;
  final Value<String> periodReference;
  final Value<String> serial;
  final Value<String> payload;
  final Value<int> rowid;
  const CachedAcademicPeriodsCompanion({
    this.accountReference = const Value.absent(),
    this.cachedAt = const Value.absent(),
    this.expiresAt = const Value.absent(),
    this.dataVersion = const Value.absent(),
    this.schemaVersion = const Value.absent(),
    this.periodReference = const Value.absent(),
    this.serial = const Value.absent(),
    this.payload = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedAcademicPeriodsCompanion.insert({
    required String accountReference,
    required DateTime cachedAt,
    required DateTime expiresAt,
    this.dataVersion = const Value.absent(),
    this.schemaVersion = const Value.absent(),
    required String periodReference,
    required String serial,
    required String payload,
    this.rowid = const Value.absent(),
  }) : accountReference = Value(accountReference),
       cachedAt = Value(cachedAt),
       expiresAt = Value(expiresAt),
       periodReference = Value(periodReference),
       serial = Value(serial),
       payload = Value(payload);
  static Insertable<CachedAcademicPeriod> custom({
    Expression<String>? accountReference,
    Expression<DateTime>? cachedAt,
    Expression<DateTime>? expiresAt,
    Expression<int>? dataVersion,
    Expression<int>? schemaVersion,
    Expression<String>? periodReference,
    Expression<String>? serial,
    Expression<String>? payload,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (accountReference != null) 'account_reference': accountReference,
      if (cachedAt != null) 'cached_at': cachedAt,
      if (expiresAt != null) 'expires_at': expiresAt,
      if (dataVersion != null) 'data_version': dataVersion,
      if (schemaVersion != null) 'schema_version': schemaVersion,
      if (periodReference != null) 'period_reference': periodReference,
      if (serial != null) 'serial': serial,
      if (payload != null) 'payload': payload,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedAcademicPeriodsCompanion copyWith({
    Value<String>? accountReference,
    Value<DateTime>? cachedAt,
    Value<DateTime>? expiresAt,
    Value<int>? dataVersion,
    Value<int>? schemaVersion,
    Value<String>? periodReference,
    Value<String>? serial,
    Value<String>? payload,
    Value<int>? rowid,
  }) {
    return CachedAcademicPeriodsCompanion(
      accountReference: accountReference ?? this.accountReference,
      cachedAt: cachedAt ?? this.cachedAt,
      expiresAt: expiresAt ?? this.expiresAt,
      dataVersion: dataVersion ?? this.dataVersion,
      schemaVersion: schemaVersion ?? this.schemaVersion,
      periodReference: periodReference ?? this.periodReference,
      serial: serial ?? this.serial,
      payload: payload ?? this.payload,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (accountReference.present) {
      map['account_reference'] = Variable<String>(accountReference.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    if (expiresAt.present) {
      map['expires_at'] = Variable<DateTime>(expiresAt.value);
    }
    if (dataVersion.present) {
      map['data_version'] = Variable<int>(dataVersion.value);
    }
    if (schemaVersion.present) {
      map['schema_version'] = Variable<int>(schemaVersion.value);
    }
    if (periodReference.present) {
      map['period_reference'] = Variable<String>(periodReference.value);
    }
    if (serial.present) {
      map['serial'] = Variable<String>(serial.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedAcademicPeriodsCompanion(')
          ..write('accountReference: $accountReference, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('dataVersion: $dataVersion, ')
          ..write('schemaVersion: $schemaVersion, ')
          ..write('periodReference: $periodReference, ')
          ..write('serial: $serial, ')
          ..write('payload: $payload, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CachedStudentClassesTable extends CachedStudentClasses
    with TableInfo<$CachedStudentClassesTable, CachedStudentClassesData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedStudentClassesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _accountReferenceMeta = const VerificationMeta(
    'accountReference',
  );
  @override
  late final GeneratedColumn<String> accountReference = GeneratedColumn<String>(
    'account_reference',
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
  static const VerificationMeta _dataVersionMeta = const VerificationMeta(
    'dataVersion',
  );
  @override
  late final GeneratedColumn<int> dataVersion = GeneratedColumn<int>(
    'data_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _schemaVersionMeta = const VerificationMeta(
    'schemaVersion',
  );
  @override
  late final GeneratedColumn<int> schemaVersion = GeneratedColumn<int>(
    'schema_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _classReferenceMeta = const VerificationMeta(
    'classReference',
  );
  @override
  late final GeneratedColumn<String> classReference = GeneratedColumn<String>(
    'class_reference',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _serialMeta = const VerificationMeta('serial');
  @override
  late final GeneratedColumn<String> serial = GeneratedColumn<String>(
    'serial',
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
  @override
  List<GeneratedColumn> get $columns => [
    accountReference,
    cachedAt,
    expiresAt,
    dataVersion,
    schemaVersion,
    classReference,
    serial,
    payload,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_student_classes';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedStudentClassesData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('account_reference')) {
      context.handle(
        _accountReferenceMeta,
        accountReference.isAcceptableOrUnknown(
          data['account_reference']!,
          _accountReferenceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_accountReferenceMeta);
    }
    if (data.containsKey('cached_at')) {
      context.handle(
        _cachedAtMeta,
        cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_cachedAtMeta);
    }
    if (data.containsKey('expires_at')) {
      context.handle(
        _expiresAtMeta,
        expiresAt.isAcceptableOrUnknown(data['expires_at']!, _expiresAtMeta),
      );
    } else if (isInserting) {
      context.missing(_expiresAtMeta);
    }
    if (data.containsKey('data_version')) {
      context.handle(
        _dataVersionMeta,
        dataVersion.isAcceptableOrUnknown(
          data['data_version']!,
          _dataVersionMeta,
        ),
      );
    }
    if (data.containsKey('schema_version')) {
      context.handle(
        _schemaVersionMeta,
        schemaVersion.isAcceptableOrUnknown(
          data['schema_version']!,
          _schemaVersionMeta,
        ),
      );
    }
    if (data.containsKey('class_reference')) {
      context.handle(
        _classReferenceMeta,
        classReference.isAcceptableOrUnknown(
          data['class_reference']!,
          _classReferenceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_classReferenceMeta);
    }
    if (data.containsKey('serial')) {
      context.handle(
        _serialMeta,
        serial.isAcceptableOrUnknown(data['serial']!, _serialMeta),
      );
    } else if (isInserting) {
      context.missing(_serialMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {
    accountReference,
    classReference,
    serial,
  };
  @override
  CachedStudentClassesData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedStudentClassesData(
      accountReference: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}account_reference'],
      )!,
      cachedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}cached_at'],
      )!,
      expiresAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}expires_at'],
      )!,
      dataVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}data_version'],
      )!,
      schemaVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}schema_version'],
      )!,
      classReference: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}class_reference'],
      )!,
      serial: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}serial'],
      )!,
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      )!,
    );
  }

  @override
  $CachedStudentClassesTable createAlias(String alias) {
    return $CachedStudentClassesTable(attachedDatabase, alias);
  }
}

class CachedStudentClassesData extends DataClass
    implements Insertable<CachedStudentClassesData> {
  final String accountReference;
  final DateTime cachedAt;
  final DateTime expiresAt;
  final int dataVersion;
  final int schemaVersion;
  final String classReference;
  final String serial;
  final String payload;
  const CachedStudentClassesData({
    required this.accountReference,
    required this.cachedAt,
    required this.expiresAt,
    required this.dataVersion,
    required this.schemaVersion,
    required this.classReference,
    required this.serial,
    required this.payload,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['account_reference'] = Variable<String>(accountReference);
    map['cached_at'] = Variable<DateTime>(cachedAt);
    map['expires_at'] = Variable<DateTime>(expiresAt);
    map['data_version'] = Variable<int>(dataVersion);
    map['schema_version'] = Variable<int>(schemaVersion);
    map['class_reference'] = Variable<String>(classReference);
    map['serial'] = Variable<String>(serial);
    map['payload'] = Variable<String>(payload);
    return map;
  }

  CachedStudentClassesCompanion toCompanion(bool nullToAbsent) {
    return CachedStudentClassesCompanion(
      accountReference: Value(accountReference),
      cachedAt: Value(cachedAt),
      expiresAt: Value(expiresAt),
      dataVersion: Value(dataVersion),
      schemaVersion: Value(schemaVersion),
      classReference: Value(classReference),
      serial: Value(serial),
      payload: Value(payload),
    );
  }

  factory CachedStudentClassesData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedStudentClassesData(
      accountReference: serializer.fromJson<String>(json['accountReference']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
      expiresAt: serializer.fromJson<DateTime>(json['expiresAt']),
      dataVersion: serializer.fromJson<int>(json['dataVersion']),
      schemaVersion: serializer.fromJson<int>(json['schemaVersion']),
      classReference: serializer.fromJson<String>(json['classReference']),
      serial: serializer.fromJson<String>(json['serial']),
      payload: serializer.fromJson<String>(json['payload']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'accountReference': serializer.toJson<String>(accountReference),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
      'expiresAt': serializer.toJson<DateTime>(expiresAt),
      'dataVersion': serializer.toJson<int>(dataVersion),
      'schemaVersion': serializer.toJson<int>(schemaVersion),
      'classReference': serializer.toJson<String>(classReference),
      'serial': serializer.toJson<String>(serial),
      'payload': serializer.toJson<String>(payload),
    };
  }

  CachedStudentClassesData copyWith({
    String? accountReference,
    DateTime? cachedAt,
    DateTime? expiresAt,
    int? dataVersion,
    int? schemaVersion,
    String? classReference,
    String? serial,
    String? payload,
  }) => CachedStudentClassesData(
    accountReference: accountReference ?? this.accountReference,
    cachedAt: cachedAt ?? this.cachedAt,
    expiresAt: expiresAt ?? this.expiresAt,
    dataVersion: dataVersion ?? this.dataVersion,
    schemaVersion: schemaVersion ?? this.schemaVersion,
    classReference: classReference ?? this.classReference,
    serial: serial ?? this.serial,
    payload: payload ?? this.payload,
  );
  CachedStudentClassesData copyWithCompanion(
    CachedStudentClassesCompanion data,
  ) {
    return CachedStudentClassesData(
      accountReference: data.accountReference.present
          ? data.accountReference.value
          : this.accountReference,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
      expiresAt: data.expiresAt.present ? data.expiresAt.value : this.expiresAt,
      dataVersion: data.dataVersion.present
          ? data.dataVersion.value
          : this.dataVersion,
      schemaVersion: data.schemaVersion.present
          ? data.schemaVersion.value
          : this.schemaVersion,
      classReference: data.classReference.present
          ? data.classReference.value
          : this.classReference,
      serial: data.serial.present ? data.serial.value : this.serial,
      payload: data.payload.present ? data.payload.value : this.payload,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedStudentClassesData(')
          ..write('accountReference: $accountReference, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('dataVersion: $dataVersion, ')
          ..write('schemaVersion: $schemaVersion, ')
          ..write('classReference: $classReference, ')
          ..write('serial: $serial, ')
          ..write('payload: $payload')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    accountReference,
    cachedAt,
    expiresAt,
    dataVersion,
    schemaVersion,
    classReference,
    serial,
    payload,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedStudentClassesData &&
          other.accountReference == this.accountReference &&
          other.cachedAt == this.cachedAt &&
          other.expiresAt == this.expiresAt &&
          other.dataVersion == this.dataVersion &&
          other.schemaVersion == this.schemaVersion &&
          other.classReference == this.classReference &&
          other.serial == this.serial &&
          other.payload == this.payload);
}

class CachedStudentClassesCompanion
    extends UpdateCompanion<CachedStudentClassesData> {
  final Value<String> accountReference;
  final Value<DateTime> cachedAt;
  final Value<DateTime> expiresAt;
  final Value<int> dataVersion;
  final Value<int> schemaVersion;
  final Value<String> classReference;
  final Value<String> serial;
  final Value<String> payload;
  final Value<int> rowid;
  const CachedStudentClassesCompanion({
    this.accountReference = const Value.absent(),
    this.cachedAt = const Value.absent(),
    this.expiresAt = const Value.absent(),
    this.dataVersion = const Value.absent(),
    this.schemaVersion = const Value.absent(),
    this.classReference = const Value.absent(),
    this.serial = const Value.absent(),
    this.payload = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedStudentClassesCompanion.insert({
    required String accountReference,
    required DateTime cachedAt,
    required DateTime expiresAt,
    this.dataVersion = const Value.absent(),
    this.schemaVersion = const Value.absent(),
    required String classReference,
    required String serial,
    required String payload,
    this.rowid = const Value.absent(),
  }) : accountReference = Value(accountReference),
       cachedAt = Value(cachedAt),
       expiresAt = Value(expiresAt),
       classReference = Value(classReference),
       serial = Value(serial),
       payload = Value(payload);
  static Insertable<CachedStudentClassesData> custom({
    Expression<String>? accountReference,
    Expression<DateTime>? cachedAt,
    Expression<DateTime>? expiresAt,
    Expression<int>? dataVersion,
    Expression<int>? schemaVersion,
    Expression<String>? classReference,
    Expression<String>? serial,
    Expression<String>? payload,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (accountReference != null) 'account_reference': accountReference,
      if (cachedAt != null) 'cached_at': cachedAt,
      if (expiresAt != null) 'expires_at': expiresAt,
      if (dataVersion != null) 'data_version': dataVersion,
      if (schemaVersion != null) 'schema_version': schemaVersion,
      if (classReference != null) 'class_reference': classReference,
      if (serial != null) 'serial': serial,
      if (payload != null) 'payload': payload,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedStudentClassesCompanion copyWith({
    Value<String>? accountReference,
    Value<DateTime>? cachedAt,
    Value<DateTime>? expiresAt,
    Value<int>? dataVersion,
    Value<int>? schemaVersion,
    Value<String>? classReference,
    Value<String>? serial,
    Value<String>? payload,
    Value<int>? rowid,
  }) {
    return CachedStudentClassesCompanion(
      accountReference: accountReference ?? this.accountReference,
      cachedAt: cachedAt ?? this.cachedAt,
      expiresAt: expiresAt ?? this.expiresAt,
      dataVersion: dataVersion ?? this.dataVersion,
      schemaVersion: schemaVersion ?? this.schemaVersion,
      classReference: classReference ?? this.classReference,
      serial: serial ?? this.serial,
      payload: payload ?? this.payload,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (accountReference.present) {
      map['account_reference'] = Variable<String>(accountReference.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    if (expiresAt.present) {
      map['expires_at'] = Variable<DateTime>(expiresAt.value);
    }
    if (dataVersion.present) {
      map['data_version'] = Variable<int>(dataVersion.value);
    }
    if (schemaVersion.present) {
      map['schema_version'] = Variable<int>(schemaVersion.value);
    }
    if (classReference.present) {
      map['class_reference'] = Variable<String>(classReference.value);
    }
    if (serial.present) {
      map['serial'] = Variable<String>(serial.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedStudentClassesCompanion(')
          ..write('accountReference: $accountReference, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('dataVersion: $dataVersion, ')
          ..write('schemaVersion: $schemaVersion, ')
          ..write('classReference: $classReference, ')
          ..write('serial: $serial, ')
          ..write('payload: $payload, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CachedPaymentItemsTable extends CachedPaymentItems
    with TableInfo<$CachedPaymentItemsTable, CachedPaymentItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedPaymentItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _accountReferenceMeta = const VerificationMeta(
    'accountReference',
  );
  @override
  late final GeneratedColumn<String> accountReference = GeneratedColumn<String>(
    'account_reference',
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
  static const VerificationMeta _dataVersionMeta = const VerificationMeta(
    'dataVersion',
  );
  @override
  late final GeneratedColumn<int> dataVersion = GeneratedColumn<int>(
    'data_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _schemaVersionMeta = const VerificationMeta(
    'schemaVersion',
  );
  @override
  late final GeneratedColumn<int> schemaVersion = GeneratedColumn<int>(
    'schema_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _itemReferenceMeta = const VerificationMeta(
    'itemReference',
  );
  @override
  late final GeneratedColumn<String> itemReference = GeneratedColumn<String>(
    'item_reference',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _serialMeta = const VerificationMeta('serial');
  @override
  late final GeneratedColumn<String> serial = GeneratedColumn<String>(
    'serial',
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
  @override
  List<GeneratedColumn> get $columns => [
    accountReference,
    cachedAt,
    expiresAt,
    dataVersion,
    schemaVersion,
    itemReference,
    serial,
    payload,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_payment_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedPaymentItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('account_reference')) {
      context.handle(
        _accountReferenceMeta,
        accountReference.isAcceptableOrUnknown(
          data['account_reference']!,
          _accountReferenceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_accountReferenceMeta);
    }
    if (data.containsKey('cached_at')) {
      context.handle(
        _cachedAtMeta,
        cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_cachedAtMeta);
    }
    if (data.containsKey('expires_at')) {
      context.handle(
        _expiresAtMeta,
        expiresAt.isAcceptableOrUnknown(data['expires_at']!, _expiresAtMeta),
      );
    } else if (isInserting) {
      context.missing(_expiresAtMeta);
    }
    if (data.containsKey('data_version')) {
      context.handle(
        _dataVersionMeta,
        dataVersion.isAcceptableOrUnknown(
          data['data_version']!,
          _dataVersionMeta,
        ),
      );
    }
    if (data.containsKey('schema_version')) {
      context.handle(
        _schemaVersionMeta,
        schemaVersion.isAcceptableOrUnknown(
          data['schema_version']!,
          _schemaVersionMeta,
        ),
      );
    }
    if (data.containsKey('item_reference')) {
      context.handle(
        _itemReferenceMeta,
        itemReference.isAcceptableOrUnknown(
          data['item_reference']!,
          _itemReferenceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_itemReferenceMeta);
    }
    if (data.containsKey('serial')) {
      context.handle(
        _serialMeta,
        serial.isAcceptableOrUnknown(data['serial']!, _serialMeta),
      );
    } else if (isInserting) {
      context.missing(_serialMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {
    accountReference,
    itemReference,
    serial,
  };
  @override
  CachedPaymentItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedPaymentItem(
      accountReference: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}account_reference'],
      )!,
      cachedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}cached_at'],
      )!,
      expiresAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}expires_at'],
      )!,
      dataVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}data_version'],
      )!,
      schemaVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}schema_version'],
      )!,
      itemReference: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}item_reference'],
      )!,
      serial: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}serial'],
      )!,
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      )!,
    );
  }

  @override
  $CachedPaymentItemsTable createAlias(String alias) {
    return $CachedPaymentItemsTable(attachedDatabase, alias);
  }
}

class CachedPaymentItem extends DataClass
    implements Insertable<CachedPaymentItem> {
  final String accountReference;
  final DateTime cachedAt;
  final DateTime expiresAt;
  final int dataVersion;
  final int schemaVersion;
  final String itemReference;
  final String serial;
  final String payload;
  const CachedPaymentItem({
    required this.accountReference,
    required this.cachedAt,
    required this.expiresAt,
    required this.dataVersion,
    required this.schemaVersion,
    required this.itemReference,
    required this.serial,
    required this.payload,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['account_reference'] = Variable<String>(accountReference);
    map['cached_at'] = Variable<DateTime>(cachedAt);
    map['expires_at'] = Variable<DateTime>(expiresAt);
    map['data_version'] = Variable<int>(dataVersion);
    map['schema_version'] = Variable<int>(schemaVersion);
    map['item_reference'] = Variable<String>(itemReference);
    map['serial'] = Variable<String>(serial);
    map['payload'] = Variable<String>(payload);
    return map;
  }

  CachedPaymentItemsCompanion toCompanion(bool nullToAbsent) {
    return CachedPaymentItemsCompanion(
      accountReference: Value(accountReference),
      cachedAt: Value(cachedAt),
      expiresAt: Value(expiresAt),
      dataVersion: Value(dataVersion),
      schemaVersion: Value(schemaVersion),
      itemReference: Value(itemReference),
      serial: Value(serial),
      payload: Value(payload),
    );
  }

  factory CachedPaymentItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedPaymentItem(
      accountReference: serializer.fromJson<String>(json['accountReference']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
      expiresAt: serializer.fromJson<DateTime>(json['expiresAt']),
      dataVersion: serializer.fromJson<int>(json['dataVersion']),
      schemaVersion: serializer.fromJson<int>(json['schemaVersion']),
      itemReference: serializer.fromJson<String>(json['itemReference']),
      serial: serializer.fromJson<String>(json['serial']),
      payload: serializer.fromJson<String>(json['payload']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'accountReference': serializer.toJson<String>(accountReference),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
      'expiresAt': serializer.toJson<DateTime>(expiresAt),
      'dataVersion': serializer.toJson<int>(dataVersion),
      'schemaVersion': serializer.toJson<int>(schemaVersion),
      'itemReference': serializer.toJson<String>(itemReference),
      'serial': serializer.toJson<String>(serial),
      'payload': serializer.toJson<String>(payload),
    };
  }

  CachedPaymentItem copyWith({
    String? accountReference,
    DateTime? cachedAt,
    DateTime? expiresAt,
    int? dataVersion,
    int? schemaVersion,
    String? itemReference,
    String? serial,
    String? payload,
  }) => CachedPaymentItem(
    accountReference: accountReference ?? this.accountReference,
    cachedAt: cachedAt ?? this.cachedAt,
    expiresAt: expiresAt ?? this.expiresAt,
    dataVersion: dataVersion ?? this.dataVersion,
    schemaVersion: schemaVersion ?? this.schemaVersion,
    itemReference: itemReference ?? this.itemReference,
    serial: serial ?? this.serial,
    payload: payload ?? this.payload,
  );
  CachedPaymentItem copyWithCompanion(CachedPaymentItemsCompanion data) {
    return CachedPaymentItem(
      accountReference: data.accountReference.present
          ? data.accountReference.value
          : this.accountReference,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
      expiresAt: data.expiresAt.present ? data.expiresAt.value : this.expiresAt,
      dataVersion: data.dataVersion.present
          ? data.dataVersion.value
          : this.dataVersion,
      schemaVersion: data.schemaVersion.present
          ? data.schemaVersion.value
          : this.schemaVersion,
      itemReference: data.itemReference.present
          ? data.itemReference.value
          : this.itemReference,
      serial: data.serial.present ? data.serial.value : this.serial,
      payload: data.payload.present ? data.payload.value : this.payload,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedPaymentItem(')
          ..write('accountReference: $accountReference, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('dataVersion: $dataVersion, ')
          ..write('schemaVersion: $schemaVersion, ')
          ..write('itemReference: $itemReference, ')
          ..write('serial: $serial, ')
          ..write('payload: $payload')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    accountReference,
    cachedAt,
    expiresAt,
    dataVersion,
    schemaVersion,
    itemReference,
    serial,
    payload,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedPaymentItem &&
          other.accountReference == this.accountReference &&
          other.cachedAt == this.cachedAt &&
          other.expiresAt == this.expiresAt &&
          other.dataVersion == this.dataVersion &&
          other.schemaVersion == this.schemaVersion &&
          other.itemReference == this.itemReference &&
          other.serial == this.serial &&
          other.payload == this.payload);
}

class CachedPaymentItemsCompanion extends UpdateCompanion<CachedPaymentItem> {
  final Value<String> accountReference;
  final Value<DateTime> cachedAt;
  final Value<DateTime> expiresAt;
  final Value<int> dataVersion;
  final Value<int> schemaVersion;
  final Value<String> itemReference;
  final Value<String> serial;
  final Value<String> payload;
  final Value<int> rowid;
  const CachedPaymentItemsCompanion({
    this.accountReference = const Value.absent(),
    this.cachedAt = const Value.absent(),
    this.expiresAt = const Value.absent(),
    this.dataVersion = const Value.absent(),
    this.schemaVersion = const Value.absent(),
    this.itemReference = const Value.absent(),
    this.serial = const Value.absent(),
    this.payload = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedPaymentItemsCompanion.insert({
    required String accountReference,
    required DateTime cachedAt,
    required DateTime expiresAt,
    this.dataVersion = const Value.absent(),
    this.schemaVersion = const Value.absent(),
    required String itemReference,
    required String serial,
    required String payload,
    this.rowid = const Value.absent(),
  }) : accountReference = Value(accountReference),
       cachedAt = Value(cachedAt),
       expiresAt = Value(expiresAt),
       itemReference = Value(itemReference),
       serial = Value(serial),
       payload = Value(payload);
  static Insertable<CachedPaymentItem> custom({
    Expression<String>? accountReference,
    Expression<DateTime>? cachedAt,
    Expression<DateTime>? expiresAt,
    Expression<int>? dataVersion,
    Expression<int>? schemaVersion,
    Expression<String>? itemReference,
    Expression<String>? serial,
    Expression<String>? payload,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (accountReference != null) 'account_reference': accountReference,
      if (cachedAt != null) 'cached_at': cachedAt,
      if (expiresAt != null) 'expires_at': expiresAt,
      if (dataVersion != null) 'data_version': dataVersion,
      if (schemaVersion != null) 'schema_version': schemaVersion,
      if (itemReference != null) 'item_reference': itemReference,
      if (serial != null) 'serial': serial,
      if (payload != null) 'payload': payload,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedPaymentItemsCompanion copyWith({
    Value<String>? accountReference,
    Value<DateTime>? cachedAt,
    Value<DateTime>? expiresAt,
    Value<int>? dataVersion,
    Value<int>? schemaVersion,
    Value<String>? itemReference,
    Value<String>? serial,
    Value<String>? payload,
    Value<int>? rowid,
  }) {
    return CachedPaymentItemsCompanion(
      accountReference: accountReference ?? this.accountReference,
      cachedAt: cachedAt ?? this.cachedAt,
      expiresAt: expiresAt ?? this.expiresAt,
      dataVersion: dataVersion ?? this.dataVersion,
      schemaVersion: schemaVersion ?? this.schemaVersion,
      itemReference: itemReference ?? this.itemReference,
      serial: serial ?? this.serial,
      payload: payload ?? this.payload,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (accountReference.present) {
      map['account_reference'] = Variable<String>(accountReference.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    if (expiresAt.present) {
      map['expires_at'] = Variable<DateTime>(expiresAt.value);
    }
    if (dataVersion.present) {
      map['data_version'] = Variable<int>(dataVersion.value);
    }
    if (schemaVersion.present) {
      map['schema_version'] = Variable<int>(schemaVersion.value);
    }
    if (itemReference.present) {
      map['item_reference'] = Variable<String>(itemReference.value);
    }
    if (serial.present) {
      map['serial'] = Variable<String>(serial.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedPaymentItemsCompanion(')
          ..write('accountReference: $accountReference, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('dataVersion: $dataVersion, ')
          ..write('schemaVersion: $schemaVersion, ')
          ..write('itemReference: $itemReference, ')
          ..write('serial: $serial, ')
          ..write('payload: $payload, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CartDraftsTable extends CartDrafts
    with TableInfo<$CartDraftsTable, CartDraft> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CartDraftsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _draftIdMeta = const VerificationMeta(
    'draftId',
  );
  @override
  late final GeneratedColumn<String> draftId = GeneratedColumn<String>(
    'draft_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _accountReferenceMeta = const VerificationMeta(
    'accountReference',
  );
  @override
  late final GeneratedColumn<String> accountReference = GeneratedColumn<String>(
    'account_reference',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _serialMeta = const VerificationMeta('serial');
  @override
  late final GeneratedColumn<String> serial = GeneratedColumn<String>(
    'serial',
    aliasedName,
    false,
    type: DriftSqlType.string,
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
    draftId,
    accountReference,
    serial,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cart_drafts';
  @override
  VerificationContext validateIntegrity(
    Insertable<CartDraft> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('draft_id')) {
      context.handle(
        _draftIdMeta,
        draftId.isAcceptableOrUnknown(data['draft_id']!, _draftIdMeta),
      );
    } else if (isInserting) {
      context.missing(_draftIdMeta);
    }
    if (data.containsKey('account_reference')) {
      context.handle(
        _accountReferenceMeta,
        accountReference.isAcceptableOrUnknown(
          data['account_reference']!,
          _accountReferenceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_accountReferenceMeta);
    }
    if (data.containsKey('serial')) {
      context.handle(
        _serialMeta,
        serial.isAcceptableOrUnknown(data['serial']!, _serialMeta),
      );
    } else if (isInserting) {
      context.missing(_serialMeta);
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
  Set<GeneratedColumn> get $primaryKey => {draftId};
  @override
  CartDraft map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CartDraft(
      draftId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}draft_id'],
      )!,
      accountReference: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}account_reference'],
      )!,
      serial: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}serial'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $CartDraftsTable createAlias(String alias) {
    return $CartDraftsTable(attachedDatabase, alias);
  }
}

class CartDraft extends DataClass implements Insertable<CartDraft> {
  final String draftId;
  final String accountReference;
  final String serial;
  final DateTime updatedAt;
  const CartDraft({
    required this.draftId,
    required this.accountReference,
    required this.serial,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['draft_id'] = Variable<String>(draftId);
    map['account_reference'] = Variable<String>(accountReference);
    map['serial'] = Variable<String>(serial);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  CartDraftsCompanion toCompanion(bool nullToAbsent) {
    return CartDraftsCompanion(
      draftId: Value(draftId),
      accountReference: Value(accountReference),
      serial: Value(serial),
      updatedAt: Value(updatedAt),
    );
  }

  factory CartDraft.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CartDraft(
      draftId: serializer.fromJson<String>(json['draftId']),
      accountReference: serializer.fromJson<String>(json['accountReference']),
      serial: serializer.fromJson<String>(json['serial']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'draftId': serializer.toJson<String>(draftId),
      'accountReference': serializer.toJson<String>(accountReference),
      'serial': serializer.toJson<String>(serial),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  CartDraft copyWith({
    String? draftId,
    String? accountReference,
    String? serial,
    DateTime? updatedAt,
  }) => CartDraft(
    draftId: draftId ?? this.draftId,
    accountReference: accountReference ?? this.accountReference,
    serial: serial ?? this.serial,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  CartDraft copyWithCompanion(CartDraftsCompanion data) {
    return CartDraft(
      draftId: data.draftId.present ? data.draftId.value : this.draftId,
      accountReference: data.accountReference.present
          ? data.accountReference.value
          : this.accountReference,
      serial: data.serial.present ? data.serial.value : this.serial,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CartDraft(')
          ..write('draftId: $draftId, ')
          ..write('accountReference: $accountReference, ')
          ..write('serial: $serial, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(draftId, accountReference, serial, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CartDraft &&
          other.draftId == this.draftId &&
          other.accountReference == this.accountReference &&
          other.serial == this.serial &&
          other.updatedAt == this.updatedAt);
}

class CartDraftsCompanion extends UpdateCompanion<CartDraft> {
  final Value<String> draftId;
  final Value<String> accountReference;
  final Value<String> serial;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const CartDraftsCompanion({
    this.draftId = const Value.absent(),
    this.accountReference = const Value.absent(),
    this.serial = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CartDraftsCompanion.insert({
    required String draftId,
    required String accountReference,
    required String serial,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : draftId = Value(draftId),
       accountReference = Value(accountReference),
       serial = Value(serial),
       updatedAt = Value(updatedAt);
  static Insertable<CartDraft> custom({
    Expression<String>? draftId,
    Expression<String>? accountReference,
    Expression<String>? serial,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (draftId != null) 'draft_id': draftId,
      if (accountReference != null) 'account_reference': accountReference,
      if (serial != null) 'serial': serial,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CartDraftsCompanion copyWith({
    Value<String>? draftId,
    Value<String>? accountReference,
    Value<String>? serial,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return CartDraftsCompanion(
      draftId: draftId ?? this.draftId,
      accountReference: accountReference ?? this.accountReference,
      serial: serial ?? this.serial,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (draftId.present) {
      map['draft_id'] = Variable<String>(draftId.value);
    }
    if (accountReference.present) {
      map['account_reference'] = Variable<String>(accountReference.value);
    }
    if (serial.present) {
      map['serial'] = Variable<String>(serial.value);
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
    return (StringBuffer('CartDraftsCompanion(')
          ..write('draftId: $draftId, ')
          ..write('accountReference: $accountReference, ')
          ..write('serial: $serial, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CartDraftItemsTable extends CartDraftItems
    with TableInfo<$CartDraftItemsTable, CartDraftItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CartDraftItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _draftIdMeta = const VerificationMeta(
    'draftId',
  );
  @override
  late final GeneratedColumn<String> draftId = GeneratedColumn<String>(
    'draft_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _itemReferenceMeta = const VerificationMeta(
    'itemReference',
  );
  @override
  late final GeneratedColumn<String> itemReference = GeneratedColumn<String>(
    'item_reference',
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
  @override
  List<GeneratedColumn> get $columns => [draftId, itemReference, payload];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cart_draft_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<CartDraftItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('draft_id')) {
      context.handle(
        _draftIdMeta,
        draftId.isAcceptableOrUnknown(data['draft_id']!, _draftIdMeta),
      );
    } else if (isInserting) {
      context.missing(_draftIdMeta);
    }
    if (data.containsKey('item_reference')) {
      context.handle(
        _itemReferenceMeta,
        itemReference.isAcceptableOrUnknown(
          data['item_reference']!,
          _itemReferenceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_itemReferenceMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {draftId, itemReference};
  @override
  CartDraftItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CartDraftItem(
      draftId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}draft_id'],
      )!,
      itemReference: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}item_reference'],
      )!,
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      )!,
    );
  }

  @override
  $CartDraftItemsTable createAlias(String alias) {
    return $CartDraftItemsTable(attachedDatabase, alias);
  }
}

class CartDraftItem extends DataClass implements Insertable<CartDraftItem> {
  final String draftId;
  final String itemReference;
  final String payload;
  const CartDraftItem({
    required this.draftId,
    required this.itemReference,
    required this.payload,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['draft_id'] = Variable<String>(draftId);
    map['item_reference'] = Variable<String>(itemReference);
    map['payload'] = Variable<String>(payload);
    return map;
  }

  CartDraftItemsCompanion toCompanion(bool nullToAbsent) {
    return CartDraftItemsCompanion(
      draftId: Value(draftId),
      itemReference: Value(itemReference),
      payload: Value(payload),
    );
  }

  factory CartDraftItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CartDraftItem(
      draftId: serializer.fromJson<String>(json['draftId']),
      itemReference: serializer.fromJson<String>(json['itemReference']),
      payload: serializer.fromJson<String>(json['payload']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'draftId': serializer.toJson<String>(draftId),
      'itemReference': serializer.toJson<String>(itemReference),
      'payload': serializer.toJson<String>(payload),
    };
  }

  CartDraftItem copyWith({
    String? draftId,
    String? itemReference,
    String? payload,
  }) => CartDraftItem(
    draftId: draftId ?? this.draftId,
    itemReference: itemReference ?? this.itemReference,
    payload: payload ?? this.payload,
  );
  CartDraftItem copyWithCompanion(CartDraftItemsCompanion data) {
    return CartDraftItem(
      draftId: data.draftId.present ? data.draftId.value : this.draftId,
      itemReference: data.itemReference.present
          ? data.itemReference.value
          : this.itemReference,
      payload: data.payload.present ? data.payload.value : this.payload,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CartDraftItem(')
          ..write('draftId: $draftId, ')
          ..write('itemReference: $itemReference, ')
          ..write('payload: $payload')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(draftId, itemReference, payload);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CartDraftItem &&
          other.draftId == this.draftId &&
          other.itemReference == this.itemReference &&
          other.payload == this.payload);
}

class CartDraftItemsCompanion extends UpdateCompanion<CartDraftItem> {
  final Value<String> draftId;
  final Value<String> itemReference;
  final Value<String> payload;
  final Value<int> rowid;
  const CartDraftItemsCompanion({
    this.draftId = const Value.absent(),
    this.itemReference = const Value.absent(),
    this.payload = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CartDraftItemsCompanion.insert({
    required String draftId,
    required String itemReference,
    required String payload,
    this.rowid = const Value.absent(),
  }) : draftId = Value(draftId),
       itemReference = Value(itemReference),
       payload = Value(payload);
  static Insertable<CartDraftItem> custom({
    Expression<String>? draftId,
    Expression<String>? itemReference,
    Expression<String>? payload,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (draftId != null) 'draft_id': draftId,
      if (itemReference != null) 'item_reference': itemReference,
      if (payload != null) 'payload': payload,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CartDraftItemsCompanion copyWith({
    Value<String>? draftId,
    Value<String>? itemReference,
    Value<String>? payload,
    Value<int>? rowid,
  }) {
    return CartDraftItemsCompanion(
      draftId: draftId ?? this.draftId,
      itemReference: itemReference ?? this.itemReference,
      payload: payload ?? this.payload,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (draftId.present) {
      map['draft_id'] = Variable<String>(draftId.value);
    }
    if (itemReference.present) {
      map['item_reference'] = Variable<String>(itemReference.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CartDraftItemsCompanion(')
          ..write('draftId: $draftId, ')
          ..write('itemReference: $itemReference, ')
          ..write('payload: $payload, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CachedPaymentMethodsTable extends CachedPaymentMethods
    with TableInfo<$CachedPaymentMethodsTable, CachedPaymentMethod> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedPaymentMethodsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _accountReferenceMeta = const VerificationMeta(
    'accountReference',
  );
  @override
  late final GeneratedColumn<String> accountReference = GeneratedColumn<String>(
    'account_reference',
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
  static const VerificationMeta _dataVersionMeta = const VerificationMeta(
    'dataVersion',
  );
  @override
  late final GeneratedColumn<int> dataVersion = GeneratedColumn<int>(
    'data_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _schemaVersionMeta = const VerificationMeta(
    'schemaVersion',
  );
  @override
  late final GeneratedColumn<int> schemaVersion = GeneratedColumn<int>(
    'schema_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _methodCodeMeta = const VerificationMeta(
    'methodCode',
  );
  @override
  late final GeneratedColumn<String> methodCode = GeneratedColumn<String>(
    'method_code',
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
  @override
  List<GeneratedColumn> get $columns => [
    accountReference,
    cachedAt,
    expiresAt,
    dataVersion,
    schemaVersion,
    methodCode,
    payload,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_payment_methods';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedPaymentMethod> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('account_reference')) {
      context.handle(
        _accountReferenceMeta,
        accountReference.isAcceptableOrUnknown(
          data['account_reference']!,
          _accountReferenceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_accountReferenceMeta);
    }
    if (data.containsKey('cached_at')) {
      context.handle(
        _cachedAtMeta,
        cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_cachedAtMeta);
    }
    if (data.containsKey('expires_at')) {
      context.handle(
        _expiresAtMeta,
        expiresAt.isAcceptableOrUnknown(data['expires_at']!, _expiresAtMeta),
      );
    } else if (isInserting) {
      context.missing(_expiresAtMeta);
    }
    if (data.containsKey('data_version')) {
      context.handle(
        _dataVersionMeta,
        dataVersion.isAcceptableOrUnknown(
          data['data_version']!,
          _dataVersionMeta,
        ),
      );
    }
    if (data.containsKey('schema_version')) {
      context.handle(
        _schemaVersionMeta,
        schemaVersion.isAcceptableOrUnknown(
          data['schema_version']!,
          _schemaVersionMeta,
        ),
      );
    }
    if (data.containsKey('method_code')) {
      context.handle(
        _methodCodeMeta,
        methodCode.isAcceptableOrUnknown(data['method_code']!, _methodCodeMeta),
      );
    } else if (isInserting) {
      context.missing(_methodCodeMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {accountReference, methodCode};
  @override
  CachedPaymentMethod map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedPaymentMethod(
      accountReference: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}account_reference'],
      )!,
      cachedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}cached_at'],
      )!,
      expiresAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}expires_at'],
      )!,
      dataVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}data_version'],
      )!,
      schemaVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}schema_version'],
      )!,
      methodCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}method_code'],
      )!,
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      )!,
    );
  }

  @override
  $CachedPaymentMethodsTable createAlias(String alias) {
    return $CachedPaymentMethodsTable(attachedDatabase, alias);
  }
}

class CachedPaymentMethod extends DataClass
    implements Insertable<CachedPaymentMethod> {
  final String accountReference;
  final DateTime cachedAt;
  final DateTime expiresAt;
  final int dataVersion;
  final int schemaVersion;
  final String methodCode;
  final String payload;
  const CachedPaymentMethod({
    required this.accountReference,
    required this.cachedAt,
    required this.expiresAt,
    required this.dataVersion,
    required this.schemaVersion,
    required this.methodCode,
    required this.payload,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['account_reference'] = Variable<String>(accountReference);
    map['cached_at'] = Variable<DateTime>(cachedAt);
    map['expires_at'] = Variable<DateTime>(expiresAt);
    map['data_version'] = Variable<int>(dataVersion);
    map['schema_version'] = Variable<int>(schemaVersion);
    map['method_code'] = Variable<String>(methodCode);
    map['payload'] = Variable<String>(payload);
    return map;
  }

  CachedPaymentMethodsCompanion toCompanion(bool nullToAbsent) {
    return CachedPaymentMethodsCompanion(
      accountReference: Value(accountReference),
      cachedAt: Value(cachedAt),
      expiresAt: Value(expiresAt),
      dataVersion: Value(dataVersion),
      schemaVersion: Value(schemaVersion),
      methodCode: Value(methodCode),
      payload: Value(payload),
    );
  }

  factory CachedPaymentMethod.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedPaymentMethod(
      accountReference: serializer.fromJson<String>(json['accountReference']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
      expiresAt: serializer.fromJson<DateTime>(json['expiresAt']),
      dataVersion: serializer.fromJson<int>(json['dataVersion']),
      schemaVersion: serializer.fromJson<int>(json['schemaVersion']),
      methodCode: serializer.fromJson<String>(json['methodCode']),
      payload: serializer.fromJson<String>(json['payload']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'accountReference': serializer.toJson<String>(accountReference),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
      'expiresAt': serializer.toJson<DateTime>(expiresAt),
      'dataVersion': serializer.toJson<int>(dataVersion),
      'schemaVersion': serializer.toJson<int>(schemaVersion),
      'methodCode': serializer.toJson<String>(methodCode),
      'payload': serializer.toJson<String>(payload),
    };
  }

  CachedPaymentMethod copyWith({
    String? accountReference,
    DateTime? cachedAt,
    DateTime? expiresAt,
    int? dataVersion,
    int? schemaVersion,
    String? methodCode,
    String? payload,
  }) => CachedPaymentMethod(
    accountReference: accountReference ?? this.accountReference,
    cachedAt: cachedAt ?? this.cachedAt,
    expiresAt: expiresAt ?? this.expiresAt,
    dataVersion: dataVersion ?? this.dataVersion,
    schemaVersion: schemaVersion ?? this.schemaVersion,
    methodCode: methodCode ?? this.methodCode,
    payload: payload ?? this.payload,
  );
  CachedPaymentMethod copyWithCompanion(CachedPaymentMethodsCompanion data) {
    return CachedPaymentMethod(
      accountReference: data.accountReference.present
          ? data.accountReference.value
          : this.accountReference,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
      expiresAt: data.expiresAt.present ? data.expiresAt.value : this.expiresAt,
      dataVersion: data.dataVersion.present
          ? data.dataVersion.value
          : this.dataVersion,
      schemaVersion: data.schemaVersion.present
          ? data.schemaVersion.value
          : this.schemaVersion,
      methodCode: data.methodCode.present
          ? data.methodCode.value
          : this.methodCode,
      payload: data.payload.present ? data.payload.value : this.payload,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedPaymentMethod(')
          ..write('accountReference: $accountReference, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('dataVersion: $dataVersion, ')
          ..write('schemaVersion: $schemaVersion, ')
          ..write('methodCode: $methodCode, ')
          ..write('payload: $payload')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    accountReference,
    cachedAt,
    expiresAt,
    dataVersion,
    schemaVersion,
    methodCode,
    payload,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedPaymentMethod &&
          other.accountReference == this.accountReference &&
          other.cachedAt == this.cachedAt &&
          other.expiresAt == this.expiresAt &&
          other.dataVersion == this.dataVersion &&
          other.schemaVersion == this.schemaVersion &&
          other.methodCode == this.methodCode &&
          other.payload == this.payload);
}

class CachedPaymentMethodsCompanion
    extends UpdateCompanion<CachedPaymentMethod> {
  final Value<String> accountReference;
  final Value<DateTime> cachedAt;
  final Value<DateTime> expiresAt;
  final Value<int> dataVersion;
  final Value<int> schemaVersion;
  final Value<String> methodCode;
  final Value<String> payload;
  final Value<int> rowid;
  const CachedPaymentMethodsCompanion({
    this.accountReference = const Value.absent(),
    this.cachedAt = const Value.absent(),
    this.expiresAt = const Value.absent(),
    this.dataVersion = const Value.absent(),
    this.schemaVersion = const Value.absent(),
    this.methodCode = const Value.absent(),
    this.payload = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedPaymentMethodsCompanion.insert({
    required String accountReference,
    required DateTime cachedAt,
    required DateTime expiresAt,
    this.dataVersion = const Value.absent(),
    this.schemaVersion = const Value.absent(),
    required String methodCode,
    required String payload,
    this.rowid = const Value.absent(),
  }) : accountReference = Value(accountReference),
       cachedAt = Value(cachedAt),
       expiresAt = Value(expiresAt),
       methodCode = Value(methodCode),
       payload = Value(payload);
  static Insertable<CachedPaymentMethod> custom({
    Expression<String>? accountReference,
    Expression<DateTime>? cachedAt,
    Expression<DateTime>? expiresAt,
    Expression<int>? dataVersion,
    Expression<int>? schemaVersion,
    Expression<String>? methodCode,
    Expression<String>? payload,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (accountReference != null) 'account_reference': accountReference,
      if (cachedAt != null) 'cached_at': cachedAt,
      if (expiresAt != null) 'expires_at': expiresAt,
      if (dataVersion != null) 'data_version': dataVersion,
      if (schemaVersion != null) 'schema_version': schemaVersion,
      if (methodCode != null) 'method_code': methodCode,
      if (payload != null) 'payload': payload,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedPaymentMethodsCompanion copyWith({
    Value<String>? accountReference,
    Value<DateTime>? cachedAt,
    Value<DateTime>? expiresAt,
    Value<int>? dataVersion,
    Value<int>? schemaVersion,
    Value<String>? methodCode,
    Value<String>? payload,
    Value<int>? rowid,
  }) {
    return CachedPaymentMethodsCompanion(
      accountReference: accountReference ?? this.accountReference,
      cachedAt: cachedAt ?? this.cachedAt,
      expiresAt: expiresAt ?? this.expiresAt,
      dataVersion: dataVersion ?? this.dataVersion,
      schemaVersion: schemaVersion ?? this.schemaVersion,
      methodCode: methodCode ?? this.methodCode,
      payload: payload ?? this.payload,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (accountReference.present) {
      map['account_reference'] = Variable<String>(accountReference.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    if (expiresAt.present) {
      map['expires_at'] = Variable<DateTime>(expiresAt.value);
    }
    if (dataVersion.present) {
      map['data_version'] = Variable<int>(dataVersion.value);
    }
    if (schemaVersion.present) {
      map['schema_version'] = Variable<int>(schemaVersion.value);
    }
    if (methodCode.present) {
      map['method_code'] = Variable<String>(methodCode.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedPaymentMethodsCompanion(')
          ..write('accountReference: $accountReference, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('dataVersion: $dataVersion, ')
          ..write('schemaVersion: $schemaVersion, ')
          ..write('methodCode: $methodCode, ')
          ..write('payload: $payload, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CachedInvoicePreviewsTable extends CachedInvoicePreviews
    with TableInfo<$CachedInvoicePreviewsTable, CachedInvoicePreview> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedInvoicePreviewsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _accountReferenceMeta = const VerificationMeta(
    'accountReference',
  );
  @override
  late final GeneratedColumn<String> accountReference = GeneratedColumn<String>(
    'account_reference',
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
  static const VerificationMeta _dataVersionMeta = const VerificationMeta(
    'dataVersion',
  );
  @override
  late final GeneratedColumn<int> dataVersion = GeneratedColumn<int>(
    'data_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _schemaVersionMeta = const VerificationMeta(
    'schemaVersion',
  );
  @override
  late final GeneratedColumn<int> schemaVersion = GeneratedColumn<int>(
    'schema_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _previewReferenceMeta = const VerificationMeta(
    'previewReference',
  );
  @override
  late final GeneratedColumn<String> previewReference = GeneratedColumn<String>(
    'preview_reference',
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
  @override
  List<GeneratedColumn> get $columns => [
    accountReference,
    cachedAt,
    expiresAt,
    dataVersion,
    schemaVersion,
    previewReference,
    payload,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_invoice_previews';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedInvoicePreview> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('account_reference')) {
      context.handle(
        _accountReferenceMeta,
        accountReference.isAcceptableOrUnknown(
          data['account_reference']!,
          _accountReferenceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_accountReferenceMeta);
    }
    if (data.containsKey('cached_at')) {
      context.handle(
        _cachedAtMeta,
        cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_cachedAtMeta);
    }
    if (data.containsKey('expires_at')) {
      context.handle(
        _expiresAtMeta,
        expiresAt.isAcceptableOrUnknown(data['expires_at']!, _expiresAtMeta),
      );
    } else if (isInserting) {
      context.missing(_expiresAtMeta);
    }
    if (data.containsKey('data_version')) {
      context.handle(
        _dataVersionMeta,
        dataVersion.isAcceptableOrUnknown(
          data['data_version']!,
          _dataVersionMeta,
        ),
      );
    }
    if (data.containsKey('schema_version')) {
      context.handle(
        _schemaVersionMeta,
        schemaVersion.isAcceptableOrUnknown(
          data['schema_version']!,
          _schemaVersionMeta,
        ),
      );
    }
    if (data.containsKey('preview_reference')) {
      context.handle(
        _previewReferenceMeta,
        previewReference.isAcceptableOrUnknown(
          data['preview_reference']!,
          _previewReferenceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_previewReferenceMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {accountReference, previewReference};
  @override
  CachedInvoicePreview map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedInvoicePreview(
      accountReference: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}account_reference'],
      )!,
      cachedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}cached_at'],
      )!,
      expiresAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}expires_at'],
      )!,
      dataVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}data_version'],
      )!,
      schemaVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}schema_version'],
      )!,
      previewReference: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}preview_reference'],
      )!,
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      )!,
    );
  }

  @override
  $CachedInvoicePreviewsTable createAlias(String alias) {
    return $CachedInvoicePreviewsTable(attachedDatabase, alias);
  }
}

class CachedInvoicePreview extends DataClass
    implements Insertable<CachedInvoicePreview> {
  final String accountReference;
  final DateTime cachedAt;
  final DateTime expiresAt;
  final int dataVersion;
  final int schemaVersion;
  final String previewReference;
  final String payload;
  const CachedInvoicePreview({
    required this.accountReference,
    required this.cachedAt,
    required this.expiresAt,
    required this.dataVersion,
    required this.schemaVersion,
    required this.previewReference,
    required this.payload,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['account_reference'] = Variable<String>(accountReference);
    map['cached_at'] = Variable<DateTime>(cachedAt);
    map['expires_at'] = Variable<DateTime>(expiresAt);
    map['data_version'] = Variable<int>(dataVersion);
    map['schema_version'] = Variable<int>(schemaVersion);
    map['preview_reference'] = Variable<String>(previewReference);
    map['payload'] = Variable<String>(payload);
    return map;
  }

  CachedInvoicePreviewsCompanion toCompanion(bool nullToAbsent) {
    return CachedInvoicePreviewsCompanion(
      accountReference: Value(accountReference),
      cachedAt: Value(cachedAt),
      expiresAt: Value(expiresAt),
      dataVersion: Value(dataVersion),
      schemaVersion: Value(schemaVersion),
      previewReference: Value(previewReference),
      payload: Value(payload),
    );
  }

  factory CachedInvoicePreview.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedInvoicePreview(
      accountReference: serializer.fromJson<String>(json['accountReference']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
      expiresAt: serializer.fromJson<DateTime>(json['expiresAt']),
      dataVersion: serializer.fromJson<int>(json['dataVersion']),
      schemaVersion: serializer.fromJson<int>(json['schemaVersion']),
      previewReference: serializer.fromJson<String>(json['previewReference']),
      payload: serializer.fromJson<String>(json['payload']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'accountReference': serializer.toJson<String>(accountReference),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
      'expiresAt': serializer.toJson<DateTime>(expiresAt),
      'dataVersion': serializer.toJson<int>(dataVersion),
      'schemaVersion': serializer.toJson<int>(schemaVersion),
      'previewReference': serializer.toJson<String>(previewReference),
      'payload': serializer.toJson<String>(payload),
    };
  }

  CachedInvoicePreview copyWith({
    String? accountReference,
    DateTime? cachedAt,
    DateTime? expiresAt,
    int? dataVersion,
    int? schemaVersion,
    String? previewReference,
    String? payload,
  }) => CachedInvoicePreview(
    accountReference: accountReference ?? this.accountReference,
    cachedAt: cachedAt ?? this.cachedAt,
    expiresAt: expiresAt ?? this.expiresAt,
    dataVersion: dataVersion ?? this.dataVersion,
    schemaVersion: schemaVersion ?? this.schemaVersion,
    previewReference: previewReference ?? this.previewReference,
    payload: payload ?? this.payload,
  );
  CachedInvoicePreview copyWithCompanion(CachedInvoicePreviewsCompanion data) {
    return CachedInvoicePreview(
      accountReference: data.accountReference.present
          ? data.accountReference.value
          : this.accountReference,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
      expiresAt: data.expiresAt.present ? data.expiresAt.value : this.expiresAt,
      dataVersion: data.dataVersion.present
          ? data.dataVersion.value
          : this.dataVersion,
      schemaVersion: data.schemaVersion.present
          ? data.schemaVersion.value
          : this.schemaVersion,
      previewReference: data.previewReference.present
          ? data.previewReference.value
          : this.previewReference,
      payload: data.payload.present ? data.payload.value : this.payload,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedInvoicePreview(')
          ..write('accountReference: $accountReference, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('dataVersion: $dataVersion, ')
          ..write('schemaVersion: $schemaVersion, ')
          ..write('previewReference: $previewReference, ')
          ..write('payload: $payload')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    accountReference,
    cachedAt,
    expiresAt,
    dataVersion,
    schemaVersion,
    previewReference,
    payload,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedInvoicePreview &&
          other.accountReference == this.accountReference &&
          other.cachedAt == this.cachedAt &&
          other.expiresAt == this.expiresAt &&
          other.dataVersion == this.dataVersion &&
          other.schemaVersion == this.schemaVersion &&
          other.previewReference == this.previewReference &&
          other.payload == this.payload);
}

class CachedInvoicePreviewsCompanion
    extends UpdateCompanion<CachedInvoicePreview> {
  final Value<String> accountReference;
  final Value<DateTime> cachedAt;
  final Value<DateTime> expiresAt;
  final Value<int> dataVersion;
  final Value<int> schemaVersion;
  final Value<String> previewReference;
  final Value<String> payload;
  final Value<int> rowid;
  const CachedInvoicePreviewsCompanion({
    this.accountReference = const Value.absent(),
    this.cachedAt = const Value.absent(),
    this.expiresAt = const Value.absent(),
    this.dataVersion = const Value.absent(),
    this.schemaVersion = const Value.absent(),
    this.previewReference = const Value.absent(),
    this.payload = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedInvoicePreviewsCompanion.insert({
    required String accountReference,
    required DateTime cachedAt,
    required DateTime expiresAt,
    this.dataVersion = const Value.absent(),
    this.schemaVersion = const Value.absent(),
    required String previewReference,
    required String payload,
    this.rowid = const Value.absent(),
  }) : accountReference = Value(accountReference),
       cachedAt = Value(cachedAt),
       expiresAt = Value(expiresAt),
       previewReference = Value(previewReference),
       payload = Value(payload);
  static Insertable<CachedInvoicePreview> custom({
    Expression<String>? accountReference,
    Expression<DateTime>? cachedAt,
    Expression<DateTime>? expiresAt,
    Expression<int>? dataVersion,
    Expression<int>? schemaVersion,
    Expression<String>? previewReference,
    Expression<String>? payload,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (accountReference != null) 'account_reference': accountReference,
      if (cachedAt != null) 'cached_at': cachedAt,
      if (expiresAt != null) 'expires_at': expiresAt,
      if (dataVersion != null) 'data_version': dataVersion,
      if (schemaVersion != null) 'schema_version': schemaVersion,
      if (previewReference != null) 'preview_reference': previewReference,
      if (payload != null) 'payload': payload,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedInvoicePreviewsCompanion copyWith({
    Value<String>? accountReference,
    Value<DateTime>? cachedAt,
    Value<DateTime>? expiresAt,
    Value<int>? dataVersion,
    Value<int>? schemaVersion,
    Value<String>? previewReference,
    Value<String>? payload,
    Value<int>? rowid,
  }) {
    return CachedInvoicePreviewsCompanion(
      accountReference: accountReference ?? this.accountReference,
      cachedAt: cachedAt ?? this.cachedAt,
      expiresAt: expiresAt ?? this.expiresAt,
      dataVersion: dataVersion ?? this.dataVersion,
      schemaVersion: schemaVersion ?? this.schemaVersion,
      previewReference: previewReference ?? this.previewReference,
      payload: payload ?? this.payload,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (accountReference.present) {
      map['account_reference'] = Variable<String>(accountReference.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    if (expiresAt.present) {
      map['expires_at'] = Variable<DateTime>(expiresAt.value);
    }
    if (dataVersion.present) {
      map['data_version'] = Variable<int>(dataVersion.value);
    }
    if (schemaVersion.present) {
      map['schema_version'] = Variable<int>(schemaVersion.value);
    }
    if (previewReference.present) {
      map['preview_reference'] = Variable<String>(previewReference.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedInvoicePreviewsCompanion(')
          ..write('accountReference: $accountReference, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('dataVersion: $dataVersion, ')
          ..write('schemaVersion: $schemaVersion, ')
          ..write('previewReference: $previewReference, ')
          ..write('payload: $payload, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CachedPaymentTransactionsTable extends CachedPaymentTransactions
    with TableInfo<$CachedPaymentTransactionsTable, CachedPaymentTransaction> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedPaymentTransactionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _accountReferenceMeta = const VerificationMeta(
    'accountReference',
  );
  @override
  late final GeneratedColumn<String> accountReference = GeneratedColumn<String>(
    'account_reference',
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
  static const VerificationMeta _dataVersionMeta = const VerificationMeta(
    'dataVersion',
  );
  @override
  late final GeneratedColumn<int> dataVersion = GeneratedColumn<int>(
    'data_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _schemaVersionMeta = const VerificationMeta(
    'schemaVersion',
  );
  @override
  late final GeneratedColumn<int> schemaVersion = GeneratedColumn<int>(
    'schema_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _merchantReferenceMeta = const VerificationMeta(
    'merchantReference',
  );
  @override
  late final GeneratedColumn<String> merchantReference =
      GeneratedColumn<String>(
        'merchant_reference',
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
  @override
  List<GeneratedColumn> get $columns => [
    accountReference,
    cachedAt,
    expiresAt,
    dataVersion,
    schemaVersion,
    merchantReference,
    payload,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_payment_transactions';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedPaymentTransaction> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('account_reference')) {
      context.handle(
        _accountReferenceMeta,
        accountReference.isAcceptableOrUnknown(
          data['account_reference']!,
          _accountReferenceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_accountReferenceMeta);
    }
    if (data.containsKey('cached_at')) {
      context.handle(
        _cachedAtMeta,
        cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_cachedAtMeta);
    }
    if (data.containsKey('expires_at')) {
      context.handle(
        _expiresAtMeta,
        expiresAt.isAcceptableOrUnknown(data['expires_at']!, _expiresAtMeta),
      );
    } else if (isInserting) {
      context.missing(_expiresAtMeta);
    }
    if (data.containsKey('data_version')) {
      context.handle(
        _dataVersionMeta,
        dataVersion.isAcceptableOrUnknown(
          data['data_version']!,
          _dataVersionMeta,
        ),
      );
    }
    if (data.containsKey('schema_version')) {
      context.handle(
        _schemaVersionMeta,
        schemaVersion.isAcceptableOrUnknown(
          data['schema_version']!,
          _schemaVersionMeta,
        ),
      );
    }
    if (data.containsKey('merchant_reference')) {
      context.handle(
        _merchantReferenceMeta,
        merchantReference.isAcceptableOrUnknown(
          data['merchant_reference']!,
          _merchantReferenceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_merchantReferenceMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {accountReference, merchantReference};
  @override
  CachedPaymentTransaction map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedPaymentTransaction(
      accountReference: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}account_reference'],
      )!,
      cachedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}cached_at'],
      )!,
      expiresAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}expires_at'],
      )!,
      dataVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}data_version'],
      )!,
      schemaVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}schema_version'],
      )!,
      merchantReference: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}merchant_reference'],
      )!,
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      )!,
    );
  }

  @override
  $CachedPaymentTransactionsTable createAlias(String alias) {
    return $CachedPaymentTransactionsTable(attachedDatabase, alias);
  }
}

class CachedPaymentTransaction extends DataClass
    implements Insertable<CachedPaymentTransaction> {
  final String accountReference;
  final DateTime cachedAt;
  final DateTime expiresAt;
  final int dataVersion;
  final int schemaVersion;
  final String merchantReference;
  final String payload;
  const CachedPaymentTransaction({
    required this.accountReference,
    required this.cachedAt,
    required this.expiresAt,
    required this.dataVersion,
    required this.schemaVersion,
    required this.merchantReference,
    required this.payload,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['account_reference'] = Variable<String>(accountReference);
    map['cached_at'] = Variable<DateTime>(cachedAt);
    map['expires_at'] = Variable<DateTime>(expiresAt);
    map['data_version'] = Variable<int>(dataVersion);
    map['schema_version'] = Variable<int>(schemaVersion);
    map['merchant_reference'] = Variable<String>(merchantReference);
    map['payload'] = Variable<String>(payload);
    return map;
  }

  CachedPaymentTransactionsCompanion toCompanion(bool nullToAbsent) {
    return CachedPaymentTransactionsCompanion(
      accountReference: Value(accountReference),
      cachedAt: Value(cachedAt),
      expiresAt: Value(expiresAt),
      dataVersion: Value(dataVersion),
      schemaVersion: Value(schemaVersion),
      merchantReference: Value(merchantReference),
      payload: Value(payload),
    );
  }

  factory CachedPaymentTransaction.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedPaymentTransaction(
      accountReference: serializer.fromJson<String>(json['accountReference']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
      expiresAt: serializer.fromJson<DateTime>(json['expiresAt']),
      dataVersion: serializer.fromJson<int>(json['dataVersion']),
      schemaVersion: serializer.fromJson<int>(json['schemaVersion']),
      merchantReference: serializer.fromJson<String>(json['merchantReference']),
      payload: serializer.fromJson<String>(json['payload']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'accountReference': serializer.toJson<String>(accountReference),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
      'expiresAt': serializer.toJson<DateTime>(expiresAt),
      'dataVersion': serializer.toJson<int>(dataVersion),
      'schemaVersion': serializer.toJson<int>(schemaVersion),
      'merchantReference': serializer.toJson<String>(merchantReference),
      'payload': serializer.toJson<String>(payload),
    };
  }

  CachedPaymentTransaction copyWith({
    String? accountReference,
    DateTime? cachedAt,
    DateTime? expiresAt,
    int? dataVersion,
    int? schemaVersion,
    String? merchantReference,
    String? payload,
  }) => CachedPaymentTransaction(
    accountReference: accountReference ?? this.accountReference,
    cachedAt: cachedAt ?? this.cachedAt,
    expiresAt: expiresAt ?? this.expiresAt,
    dataVersion: dataVersion ?? this.dataVersion,
    schemaVersion: schemaVersion ?? this.schemaVersion,
    merchantReference: merchantReference ?? this.merchantReference,
    payload: payload ?? this.payload,
  );
  CachedPaymentTransaction copyWithCompanion(
    CachedPaymentTransactionsCompanion data,
  ) {
    return CachedPaymentTransaction(
      accountReference: data.accountReference.present
          ? data.accountReference.value
          : this.accountReference,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
      expiresAt: data.expiresAt.present ? data.expiresAt.value : this.expiresAt,
      dataVersion: data.dataVersion.present
          ? data.dataVersion.value
          : this.dataVersion,
      schemaVersion: data.schemaVersion.present
          ? data.schemaVersion.value
          : this.schemaVersion,
      merchantReference: data.merchantReference.present
          ? data.merchantReference.value
          : this.merchantReference,
      payload: data.payload.present ? data.payload.value : this.payload,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedPaymentTransaction(')
          ..write('accountReference: $accountReference, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('dataVersion: $dataVersion, ')
          ..write('schemaVersion: $schemaVersion, ')
          ..write('merchantReference: $merchantReference, ')
          ..write('payload: $payload')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    accountReference,
    cachedAt,
    expiresAt,
    dataVersion,
    schemaVersion,
    merchantReference,
    payload,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedPaymentTransaction &&
          other.accountReference == this.accountReference &&
          other.cachedAt == this.cachedAt &&
          other.expiresAt == this.expiresAt &&
          other.dataVersion == this.dataVersion &&
          other.schemaVersion == this.schemaVersion &&
          other.merchantReference == this.merchantReference &&
          other.payload == this.payload);
}

class CachedPaymentTransactionsCompanion
    extends UpdateCompanion<CachedPaymentTransaction> {
  final Value<String> accountReference;
  final Value<DateTime> cachedAt;
  final Value<DateTime> expiresAt;
  final Value<int> dataVersion;
  final Value<int> schemaVersion;
  final Value<String> merchantReference;
  final Value<String> payload;
  final Value<int> rowid;
  const CachedPaymentTransactionsCompanion({
    this.accountReference = const Value.absent(),
    this.cachedAt = const Value.absent(),
    this.expiresAt = const Value.absent(),
    this.dataVersion = const Value.absent(),
    this.schemaVersion = const Value.absent(),
    this.merchantReference = const Value.absent(),
    this.payload = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedPaymentTransactionsCompanion.insert({
    required String accountReference,
    required DateTime cachedAt,
    required DateTime expiresAt,
    this.dataVersion = const Value.absent(),
    this.schemaVersion = const Value.absent(),
    required String merchantReference,
    required String payload,
    this.rowid = const Value.absent(),
  }) : accountReference = Value(accountReference),
       cachedAt = Value(cachedAt),
       expiresAt = Value(expiresAt),
       merchantReference = Value(merchantReference),
       payload = Value(payload);
  static Insertable<CachedPaymentTransaction> custom({
    Expression<String>? accountReference,
    Expression<DateTime>? cachedAt,
    Expression<DateTime>? expiresAt,
    Expression<int>? dataVersion,
    Expression<int>? schemaVersion,
    Expression<String>? merchantReference,
    Expression<String>? payload,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (accountReference != null) 'account_reference': accountReference,
      if (cachedAt != null) 'cached_at': cachedAt,
      if (expiresAt != null) 'expires_at': expiresAt,
      if (dataVersion != null) 'data_version': dataVersion,
      if (schemaVersion != null) 'schema_version': schemaVersion,
      if (merchantReference != null) 'merchant_reference': merchantReference,
      if (payload != null) 'payload': payload,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedPaymentTransactionsCompanion copyWith({
    Value<String>? accountReference,
    Value<DateTime>? cachedAt,
    Value<DateTime>? expiresAt,
    Value<int>? dataVersion,
    Value<int>? schemaVersion,
    Value<String>? merchantReference,
    Value<String>? payload,
    Value<int>? rowid,
  }) {
    return CachedPaymentTransactionsCompanion(
      accountReference: accountReference ?? this.accountReference,
      cachedAt: cachedAt ?? this.cachedAt,
      expiresAt: expiresAt ?? this.expiresAt,
      dataVersion: dataVersion ?? this.dataVersion,
      schemaVersion: schemaVersion ?? this.schemaVersion,
      merchantReference: merchantReference ?? this.merchantReference,
      payload: payload ?? this.payload,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (accountReference.present) {
      map['account_reference'] = Variable<String>(accountReference.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    if (expiresAt.present) {
      map['expires_at'] = Variable<DateTime>(expiresAt.value);
    }
    if (dataVersion.present) {
      map['data_version'] = Variable<int>(dataVersion.value);
    }
    if (schemaVersion.present) {
      map['schema_version'] = Variable<int>(schemaVersion.value);
    }
    if (merchantReference.present) {
      map['merchant_reference'] = Variable<String>(merchantReference.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedPaymentTransactionsCompanion(')
          ..write('accountReference: $accountReference, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('dataVersion: $dataVersion, ')
          ..write('schemaVersion: $schemaVersion, ')
          ..write('merchantReference: $merchantReference, ')
          ..write('payload: $payload, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SyncMetadataTable extends SyncMetadata
    with TableInfo<$SyncMetadataTable, SyncMetadataData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncMetadataTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _accountReferenceMeta = const VerificationMeta(
    'accountReference',
  );
  @override
  late final GeneratedColumn<String> accountReference = GeneratedColumn<String>(
    'account_reference',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
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
  List<GeneratedColumn> get $columns => [accountReference, key, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_metadata';
  @override
  VerificationContext validateIntegrity(
    Insertable<SyncMetadataData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('account_reference')) {
      context.handle(
        _accountReferenceMeta,
        accountReference.isAcceptableOrUnknown(
          data['account_reference']!,
          _accountReferenceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_accountReferenceMeta);
    }
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
  Set<GeneratedColumn> get $primaryKey => {accountReference, key};
  @override
  SyncMetadataData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncMetadataData(
      accountReference: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}account_reference'],
      )!,
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
  $SyncMetadataTable createAlias(String alias) {
    return $SyncMetadataTable(attachedDatabase, alias);
  }
}

class SyncMetadataData extends DataClass
    implements Insertable<SyncMetadataData> {
  final String accountReference;
  final String key;
  final String value;
  const SyncMetadataData({
    required this.accountReference,
    required this.key,
    required this.value,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['account_reference'] = Variable<String>(accountReference);
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    return map;
  }

  SyncMetadataCompanion toCompanion(bool nullToAbsent) {
    return SyncMetadataCompanion(
      accountReference: Value(accountReference),
      key: Value(key),
      value: Value(value),
    );
  }

  factory SyncMetadataData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncMetadataData(
      accountReference: serializer.fromJson<String>(json['accountReference']),
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'accountReference': serializer.toJson<String>(accountReference),
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
    };
  }

  SyncMetadataData copyWith({
    String? accountReference,
    String? key,
    String? value,
  }) => SyncMetadataData(
    accountReference: accountReference ?? this.accountReference,
    key: key ?? this.key,
    value: value ?? this.value,
  );
  SyncMetadataData copyWithCompanion(SyncMetadataCompanion data) {
    return SyncMetadataData(
      accountReference: data.accountReference.present
          ? data.accountReference.value
          : this.accountReference,
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncMetadataData(')
          ..write('accountReference: $accountReference, ')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(accountReference, key, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncMetadataData &&
          other.accountReference == this.accountReference &&
          other.key == this.key &&
          other.value == this.value);
}

class SyncMetadataCompanion extends UpdateCompanion<SyncMetadataData> {
  final Value<String> accountReference;
  final Value<String> key;
  final Value<String> value;
  final Value<int> rowid;
  const SyncMetadataCompanion({
    this.accountReference = const Value.absent(),
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SyncMetadataCompanion.insert({
    required String accountReference,
    required String key,
    required String value,
    this.rowid = const Value.absent(),
  }) : accountReference = Value(accountReference),
       key = Value(key),
       value = Value(value);
  static Insertable<SyncMetadataData> custom({
    Expression<String>? accountReference,
    Expression<String>? key,
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (accountReference != null) 'account_reference': accountReference,
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SyncMetadataCompanion copyWith({
    Value<String>? accountReference,
    Value<String>? key,
    Value<String>? value,
    Value<int>? rowid,
  }) {
    return SyncMetadataCompanion(
      accountReference: accountReference ?? this.accountReference,
      key: key ?? this.key,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (accountReference.present) {
      map['account_reference'] = Variable<String>(accountReference.value);
    }
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
    return (StringBuffer('SyncMetadataCompanion(')
          ..write('accountReference: $accountReference, ')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SyncOutboxTable extends SyncOutbox
    with TableInfo<$SyncOutboxTable, SyncOutboxData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncOutboxTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _operationIdMeta = const VerificationMeta(
    'operationId',
  );
  @override
  late final GeneratedColumn<String> operationId = GeneratedColumn<String>(
    'operation_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _accountReferenceMeta = const VerificationMeta(
    'accountReference',
  );
  @override
  late final GeneratedColumn<String> accountReference = GeneratedColumn<String>(
    'account_reference',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _operationTypeMeta = const VerificationMeta(
    'operationType',
  );
  @override
  late final GeneratedColumn<String> operationType = GeneratedColumn<String>(
    'operation_type',
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
  @override
  List<GeneratedColumn> get $columns => [
    operationId,
    accountReference,
    operationType,
    payload,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_outbox';
  @override
  VerificationContext validateIntegrity(
    Insertable<SyncOutboxData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('operation_id')) {
      context.handle(
        _operationIdMeta,
        operationId.isAcceptableOrUnknown(
          data['operation_id']!,
          _operationIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_operationIdMeta);
    }
    if (data.containsKey('account_reference')) {
      context.handle(
        _accountReferenceMeta,
        accountReference.isAcceptableOrUnknown(
          data['account_reference']!,
          _accountReferenceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_accountReferenceMeta);
    }
    if (data.containsKey('operation_type')) {
      context.handle(
        _operationTypeMeta,
        operationType.isAcceptableOrUnknown(
          data['operation_type']!,
          _operationTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_operationTypeMeta);
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {operationId};
  @override
  SyncOutboxData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncOutboxData(
      operationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}operation_id'],
      )!,
      accountReference: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}account_reference'],
      )!,
      operationType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}operation_type'],
      )!,
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $SyncOutboxTable createAlias(String alias) {
    return $SyncOutboxTable(attachedDatabase, alias);
  }
}

class SyncOutboxData extends DataClass implements Insertable<SyncOutboxData> {
  final String operationId;
  final String accountReference;
  final String operationType;
  final String payload;
  final DateTime createdAt;
  const SyncOutboxData({
    required this.operationId,
    required this.accountReference,
    required this.operationType,
    required this.payload,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['operation_id'] = Variable<String>(operationId);
    map['account_reference'] = Variable<String>(accountReference);
    map['operation_type'] = Variable<String>(operationType);
    map['payload'] = Variable<String>(payload);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  SyncOutboxCompanion toCompanion(bool nullToAbsent) {
    return SyncOutboxCompanion(
      operationId: Value(operationId),
      accountReference: Value(accountReference),
      operationType: Value(operationType),
      payload: Value(payload),
      createdAt: Value(createdAt),
    );
  }

  factory SyncOutboxData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncOutboxData(
      operationId: serializer.fromJson<String>(json['operationId']),
      accountReference: serializer.fromJson<String>(json['accountReference']),
      operationType: serializer.fromJson<String>(json['operationType']),
      payload: serializer.fromJson<String>(json['payload']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'operationId': serializer.toJson<String>(operationId),
      'accountReference': serializer.toJson<String>(accountReference),
      'operationType': serializer.toJson<String>(operationType),
      'payload': serializer.toJson<String>(payload),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  SyncOutboxData copyWith({
    String? operationId,
    String? accountReference,
    String? operationType,
    String? payload,
    DateTime? createdAt,
  }) => SyncOutboxData(
    operationId: operationId ?? this.operationId,
    accountReference: accountReference ?? this.accountReference,
    operationType: operationType ?? this.operationType,
    payload: payload ?? this.payload,
    createdAt: createdAt ?? this.createdAt,
  );
  SyncOutboxData copyWithCompanion(SyncOutboxCompanion data) {
    return SyncOutboxData(
      operationId: data.operationId.present
          ? data.operationId.value
          : this.operationId,
      accountReference: data.accountReference.present
          ? data.accountReference.value
          : this.accountReference,
      operationType: data.operationType.present
          ? data.operationType.value
          : this.operationType,
      payload: data.payload.present ? data.payload.value : this.payload,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncOutboxData(')
          ..write('operationId: $operationId, ')
          ..write('accountReference: $accountReference, ')
          ..write('operationType: $operationType, ')
          ..write('payload: $payload, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    operationId,
    accountReference,
    operationType,
    payload,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncOutboxData &&
          other.operationId == this.operationId &&
          other.accountReference == this.accountReference &&
          other.operationType == this.operationType &&
          other.payload == this.payload &&
          other.createdAt == this.createdAt);
}

class SyncOutboxCompanion extends UpdateCompanion<SyncOutboxData> {
  final Value<String> operationId;
  final Value<String> accountReference;
  final Value<String> operationType;
  final Value<String> payload;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const SyncOutboxCompanion({
    this.operationId = const Value.absent(),
    this.accountReference = const Value.absent(),
    this.operationType = const Value.absent(),
    this.payload = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SyncOutboxCompanion.insert({
    required String operationId,
    required String accountReference,
    required String operationType,
    required String payload,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : operationId = Value(operationId),
       accountReference = Value(accountReference),
       operationType = Value(operationType),
       payload = Value(payload),
       createdAt = Value(createdAt);
  static Insertable<SyncOutboxData> custom({
    Expression<String>? operationId,
    Expression<String>? accountReference,
    Expression<String>? operationType,
    Expression<String>? payload,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (operationId != null) 'operation_id': operationId,
      if (accountReference != null) 'account_reference': accountReference,
      if (operationType != null) 'operation_type': operationType,
      if (payload != null) 'payload': payload,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SyncOutboxCompanion copyWith({
    Value<String>? operationId,
    Value<String>? accountReference,
    Value<String>? operationType,
    Value<String>? payload,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return SyncOutboxCompanion(
      operationId: operationId ?? this.operationId,
      accountReference: accountReference ?? this.accountReference,
      operationType: operationType ?? this.operationType,
      payload: payload ?? this.payload,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (operationId.present) {
      map['operation_id'] = Variable<String>(operationId.value);
    }
    if (accountReference.present) {
      map['account_reference'] = Variable<String>(accountReference.value);
    }
    if (operationType.present) {
      map['operation_type'] = Variable<String>(operationType.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncOutboxCompanion(')
          ..write('operationId: $operationId, ')
          ..write('accountReference: $accountReference, ')
          ..write('operationType: $operationType, ')
          ..write('payload: $payload, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$LocalDatabase extends GeneratedDatabase {
  _$LocalDatabase(QueryExecutor e) : super(e);
  $LocalDatabaseManager get managers => $LocalDatabaseManager(this);
  late final $CachedChildrenTable cachedChildren = $CachedChildrenTable(this);
  late final $CachedAcademicPeriodsTable cachedAcademicPeriods =
      $CachedAcademicPeriodsTable(this);
  late final $CachedStudentClassesTable cachedStudentClasses =
      $CachedStudentClassesTable(this);
  late final $CachedPaymentItemsTable cachedPaymentItems =
      $CachedPaymentItemsTable(this);
  late final $CartDraftsTable cartDrafts = $CartDraftsTable(this);
  late final $CartDraftItemsTable cartDraftItems = $CartDraftItemsTable(this);
  late final $CachedPaymentMethodsTable cachedPaymentMethods =
      $CachedPaymentMethodsTable(this);
  late final $CachedInvoicePreviewsTable cachedInvoicePreviews =
      $CachedInvoicePreviewsTable(this);
  late final $CachedPaymentTransactionsTable cachedPaymentTransactions =
      $CachedPaymentTransactionsTable(this);
  late final $SyncMetadataTable syncMetadata = $SyncMetadataTable(this);
  late final $SyncOutboxTable syncOutbox = $SyncOutboxTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    cachedChildren,
    cachedAcademicPeriods,
    cachedStudentClasses,
    cachedPaymentItems,
    cartDrafts,
    cartDraftItems,
    cachedPaymentMethods,
    cachedInvoicePreviews,
    cachedPaymentTransactions,
    syncMetadata,
    syncOutbox,
  ];
}

typedef $$CachedChildrenTableCreateCompanionBuilder =
    CachedChildrenCompanion Function({
      required String accountReference,
      required DateTime cachedAt,
      required DateTime expiresAt,
      Value<int> dataVersion,
      Value<int> schemaVersion,
      required String serial,
      required String payload,
      Value<int> rowid,
    });
typedef $$CachedChildrenTableUpdateCompanionBuilder =
    CachedChildrenCompanion Function({
      Value<String> accountReference,
      Value<DateTime> cachedAt,
      Value<DateTime> expiresAt,
      Value<int> dataVersion,
      Value<int> schemaVersion,
      Value<String> serial,
      Value<String> payload,
      Value<int> rowid,
    });

class $$CachedChildrenTableFilterComposer
    extends Composer<_$LocalDatabase, $CachedChildrenTable> {
  $$CachedChildrenTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get accountReference => $composableBuilder(
    column: $table.accountReference,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dataVersion => $composableBuilder(
    column: $table.dataVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get schemaVersion => $composableBuilder(
    column: $table.schemaVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get serial => $composableBuilder(
    column: $table.serial,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CachedChildrenTableOrderingComposer
    extends Composer<_$LocalDatabase, $CachedChildrenTable> {
  $$CachedChildrenTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get accountReference => $composableBuilder(
    column: $table.accountReference,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dataVersion => $composableBuilder(
    column: $table.dataVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get schemaVersion => $composableBuilder(
    column: $table.schemaVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get serial => $composableBuilder(
    column: $table.serial,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CachedChildrenTableAnnotationComposer
    extends Composer<_$LocalDatabase, $CachedChildrenTable> {
  $$CachedChildrenTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get accountReference => $composableBuilder(
    column: $table.accountReference,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get expiresAt =>
      $composableBuilder(column: $table.expiresAt, builder: (column) => column);

  GeneratedColumn<int> get dataVersion => $composableBuilder(
    column: $table.dataVersion,
    builder: (column) => column,
  );

  GeneratedColumn<int> get schemaVersion => $composableBuilder(
    column: $table.schemaVersion,
    builder: (column) => column,
  );

  GeneratedColumn<String> get serial =>
      $composableBuilder(column: $table.serial, builder: (column) => column);

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);
}

class $$CachedChildrenTableTableManager
    extends
        RootTableManager<
          _$LocalDatabase,
          $CachedChildrenTable,
          CachedChildrenData,
          $$CachedChildrenTableFilterComposer,
          $$CachedChildrenTableOrderingComposer,
          $$CachedChildrenTableAnnotationComposer,
          $$CachedChildrenTableCreateCompanionBuilder,
          $$CachedChildrenTableUpdateCompanionBuilder,
          (
            CachedChildrenData,
            BaseReferences<
              _$LocalDatabase,
              $CachedChildrenTable,
              CachedChildrenData
            >,
          ),
          CachedChildrenData,
          PrefetchHooks Function()
        > {
  $$CachedChildrenTableTableManager(
    _$LocalDatabase db,
    $CachedChildrenTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedChildrenTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedChildrenTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedChildrenTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> accountReference = const Value.absent(),
                Value<DateTime> cachedAt = const Value.absent(),
                Value<DateTime> expiresAt = const Value.absent(),
                Value<int> dataVersion = const Value.absent(),
                Value<int> schemaVersion = const Value.absent(),
                Value<String> serial = const Value.absent(),
                Value<String> payload = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedChildrenCompanion(
                accountReference: accountReference,
                cachedAt: cachedAt,
                expiresAt: expiresAt,
                dataVersion: dataVersion,
                schemaVersion: schemaVersion,
                serial: serial,
                payload: payload,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String accountReference,
                required DateTime cachedAt,
                required DateTime expiresAt,
                Value<int> dataVersion = const Value.absent(),
                Value<int> schemaVersion = const Value.absent(),
                required String serial,
                required String payload,
                Value<int> rowid = const Value.absent(),
              }) => CachedChildrenCompanion.insert(
                accountReference: accountReference,
                cachedAt: cachedAt,
                expiresAt: expiresAt,
                dataVersion: dataVersion,
                schemaVersion: schemaVersion,
                serial: serial,
                payload: payload,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CachedChildrenTableProcessedTableManager =
    ProcessedTableManager<
      _$LocalDatabase,
      $CachedChildrenTable,
      CachedChildrenData,
      $$CachedChildrenTableFilterComposer,
      $$CachedChildrenTableOrderingComposer,
      $$CachedChildrenTableAnnotationComposer,
      $$CachedChildrenTableCreateCompanionBuilder,
      $$CachedChildrenTableUpdateCompanionBuilder,
      (
        CachedChildrenData,
        BaseReferences<
          _$LocalDatabase,
          $CachedChildrenTable,
          CachedChildrenData
        >,
      ),
      CachedChildrenData,
      PrefetchHooks Function()
    >;
typedef $$CachedAcademicPeriodsTableCreateCompanionBuilder =
    CachedAcademicPeriodsCompanion Function({
      required String accountReference,
      required DateTime cachedAt,
      required DateTime expiresAt,
      Value<int> dataVersion,
      Value<int> schemaVersion,
      required String periodReference,
      required String serial,
      required String payload,
      Value<int> rowid,
    });
typedef $$CachedAcademicPeriodsTableUpdateCompanionBuilder =
    CachedAcademicPeriodsCompanion Function({
      Value<String> accountReference,
      Value<DateTime> cachedAt,
      Value<DateTime> expiresAt,
      Value<int> dataVersion,
      Value<int> schemaVersion,
      Value<String> periodReference,
      Value<String> serial,
      Value<String> payload,
      Value<int> rowid,
    });

class $$CachedAcademicPeriodsTableFilterComposer
    extends Composer<_$LocalDatabase, $CachedAcademicPeriodsTable> {
  $$CachedAcademicPeriodsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get accountReference => $composableBuilder(
    column: $table.accountReference,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dataVersion => $composableBuilder(
    column: $table.dataVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get schemaVersion => $composableBuilder(
    column: $table.schemaVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get periodReference => $composableBuilder(
    column: $table.periodReference,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get serial => $composableBuilder(
    column: $table.serial,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CachedAcademicPeriodsTableOrderingComposer
    extends Composer<_$LocalDatabase, $CachedAcademicPeriodsTable> {
  $$CachedAcademicPeriodsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get accountReference => $composableBuilder(
    column: $table.accountReference,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dataVersion => $composableBuilder(
    column: $table.dataVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get schemaVersion => $composableBuilder(
    column: $table.schemaVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get periodReference => $composableBuilder(
    column: $table.periodReference,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get serial => $composableBuilder(
    column: $table.serial,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CachedAcademicPeriodsTableAnnotationComposer
    extends Composer<_$LocalDatabase, $CachedAcademicPeriodsTable> {
  $$CachedAcademicPeriodsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get accountReference => $composableBuilder(
    column: $table.accountReference,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get expiresAt =>
      $composableBuilder(column: $table.expiresAt, builder: (column) => column);

  GeneratedColumn<int> get dataVersion => $composableBuilder(
    column: $table.dataVersion,
    builder: (column) => column,
  );

  GeneratedColumn<int> get schemaVersion => $composableBuilder(
    column: $table.schemaVersion,
    builder: (column) => column,
  );

  GeneratedColumn<String> get periodReference => $composableBuilder(
    column: $table.periodReference,
    builder: (column) => column,
  );

  GeneratedColumn<String> get serial =>
      $composableBuilder(column: $table.serial, builder: (column) => column);

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);
}

class $$CachedAcademicPeriodsTableTableManager
    extends
        RootTableManager<
          _$LocalDatabase,
          $CachedAcademicPeriodsTable,
          CachedAcademicPeriod,
          $$CachedAcademicPeriodsTableFilterComposer,
          $$CachedAcademicPeriodsTableOrderingComposer,
          $$CachedAcademicPeriodsTableAnnotationComposer,
          $$CachedAcademicPeriodsTableCreateCompanionBuilder,
          $$CachedAcademicPeriodsTableUpdateCompanionBuilder,
          (
            CachedAcademicPeriod,
            BaseReferences<
              _$LocalDatabase,
              $CachedAcademicPeriodsTable,
              CachedAcademicPeriod
            >,
          ),
          CachedAcademicPeriod,
          PrefetchHooks Function()
        > {
  $$CachedAcademicPeriodsTableTableManager(
    _$LocalDatabase db,
    $CachedAcademicPeriodsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedAcademicPeriodsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$CachedAcademicPeriodsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$CachedAcademicPeriodsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> accountReference = const Value.absent(),
                Value<DateTime> cachedAt = const Value.absent(),
                Value<DateTime> expiresAt = const Value.absent(),
                Value<int> dataVersion = const Value.absent(),
                Value<int> schemaVersion = const Value.absent(),
                Value<String> periodReference = const Value.absent(),
                Value<String> serial = const Value.absent(),
                Value<String> payload = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedAcademicPeriodsCompanion(
                accountReference: accountReference,
                cachedAt: cachedAt,
                expiresAt: expiresAt,
                dataVersion: dataVersion,
                schemaVersion: schemaVersion,
                periodReference: periodReference,
                serial: serial,
                payload: payload,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String accountReference,
                required DateTime cachedAt,
                required DateTime expiresAt,
                Value<int> dataVersion = const Value.absent(),
                Value<int> schemaVersion = const Value.absent(),
                required String periodReference,
                required String serial,
                required String payload,
                Value<int> rowid = const Value.absent(),
              }) => CachedAcademicPeriodsCompanion.insert(
                accountReference: accountReference,
                cachedAt: cachedAt,
                expiresAt: expiresAt,
                dataVersion: dataVersion,
                schemaVersion: schemaVersion,
                periodReference: periodReference,
                serial: serial,
                payload: payload,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CachedAcademicPeriodsTableProcessedTableManager =
    ProcessedTableManager<
      _$LocalDatabase,
      $CachedAcademicPeriodsTable,
      CachedAcademicPeriod,
      $$CachedAcademicPeriodsTableFilterComposer,
      $$CachedAcademicPeriodsTableOrderingComposer,
      $$CachedAcademicPeriodsTableAnnotationComposer,
      $$CachedAcademicPeriodsTableCreateCompanionBuilder,
      $$CachedAcademicPeriodsTableUpdateCompanionBuilder,
      (
        CachedAcademicPeriod,
        BaseReferences<
          _$LocalDatabase,
          $CachedAcademicPeriodsTable,
          CachedAcademicPeriod
        >,
      ),
      CachedAcademicPeriod,
      PrefetchHooks Function()
    >;
typedef $$CachedStudentClassesTableCreateCompanionBuilder =
    CachedStudentClassesCompanion Function({
      required String accountReference,
      required DateTime cachedAt,
      required DateTime expiresAt,
      Value<int> dataVersion,
      Value<int> schemaVersion,
      required String classReference,
      required String serial,
      required String payload,
      Value<int> rowid,
    });
typedef $$CachedStudentClassesTableUpdateCompanionBuilder =
    CachedStudentClassesCompanion Function({
      Value<String> accountReference,
      Value<DateTime> cachedAt,
      Value<DateTime> expiresAt,
      Value<int> dataVersion,
      Value<int> schemaVersion,
      Value<String> classReference,
      Value<String> serial,
      Value<String> payload,
      Value<int> rowid,
    });

class $$CachedStudentClassesTableFilterComposer
    extends Composer<_$LocalDatabase, $CachedStudentClassesTable> {
  $$CachedStudentClassesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get accountReference => $composableBuilder(
    column: $table.accountReference,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dataVersion => $composableBuilder(
    column: $table.dataVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get schemaVersion => $composableBuilder(
    column: $table.schemaVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get classReference => $composableBuilder(
    column: $table.classReference,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get serial => $composableBuilder(
    column: $table.serial,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CachedStudentClassesTableOrderingComposer
    extends Composer<_$LocalDatabase, $CachedStudentClassesTable> {
  $$CachedStudentClassesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get accountReference => $composableBuilder(
    column: $table.accountReference,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dataVersion => $composableBuilder(
    column: $table.dataVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get schemaVersion => $composableBuilder(
    column: $table.schemaVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get classReference => $composableBuilder(
    column: $table.classReference,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get serial => $composableBuilder(
    column: $table.serial,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CachedStudentClassesTableAnnotationComposer
    extends Composer<_$LocalDatabase, $CachedStudentClassesTable> {
  $$CachedStudentClassesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get accountReference => $composableBuilder(
    column: $table.accountReference,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get expiresAt =>
      $composableBuilder(column: $table.expiresAt, builder: (column) => column);

  GeneratedColumn<int> get dataVersion => $composableBuilder(
    column: $table.dataVersion,
    builder: (column) => column,
  );

  GeneratedColumn<int> get schemaVersion => $composableBuilder(
    column: $table.schemaVersion,
    builder: (column) => column,
  );

  GeneratedColumn<String> get classReference => $composableBuilder(
    column: $table.classReference,
    builder: (column) => column,
  );

  GeneratedColumn<String> get serial =>
      $composableBuilder(column: $table.serial, builder: (column) => column);

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);
}

class $$CachedStudentClassesTableTableManager
    extends
        RootTableManager<
          _$LocalDatabase,
          $CachedStudentClassesTable,
          CachedStudentClassesData,
          $$CachedStudentClassesTableFilterComposer,
          $$CachedStudentClassesTableOrderingComposer,
          $$CachedStudentClassesTableAnnotationComposer,
          $$CachedStudentClassesTableCreateCompanionBuilder,
          $$CachedStudentClassesTableUpdateCompanionBuilder,
          (
            CachedStudentClassesData,
            BaseReferences<
              _$LocalDatabase,
              $CachedStudentClassesTable,
              CachedStudentClassesData
            >,
          ),
          CachedStudentClassesData,
          PrefetchHooks Function()
        > {
  $$CachedStudentClassesTableTableManager(
    _$LocalDatabase db,
    $CachedStudentClassesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedStudentClassesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedStudentClassesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$CachedStudentClassesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> accountReference = const Value.absent(),
                Value<DateTime> cachedAt = const Value.absent(),
                Value<DateTime> expiresAt = const Value.absent(),
                Value<int> dataVersion = const Value.absent(),
                Value<int> schemaVersion = const Value.absent(),
                Value<String> classReference = const Value.absent(),
                Value<String> serial = const Value.absent(),
                Value<String> payload = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedStudentClassesCompanion(
                accountReference: accountReference,
                cachedAt: cachedAt,
                expiresAt: expiresAt,
                dataVersion: dataVersion,
                schemaVersion: schemaVersion,
                classReference: classReference,
                serial: serial,
                payload: payload,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String accountReference,
                required DateTime cachedAt,
                required DateTime expiresAt,
                Value<int> dataVersion = const Value.absent(),
                Value<int> schemaVersion = const Value.absent(),
                required String classReference,
                required String serial,
                required String payload,
                Value<int> rowid = const Value.absent(),
              }) => CachedStudentClassesCompanion.insert(
                accountReference: accountReference,
                cachedAt: cachedAt,
                expiresAt: expiresAt,
                dataVersion: dataVersion,
                schemaVersion: schemaVersion,
                classReference: classReference,
                serial: serial,
                payload: payload,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CachedStudentClassesTableProcessedTableManager =
    ProcessedTableManager<
      _$LocalDatabase,
      $CachedStudentClassesTable,
      CachedStudentClassesData,
      $$CachedStudentClassesTableFilterComposer,
      $$CachedStudentClassesTableOrderingComposer,
      $$CachedStudentClassesTableAnnotationComposer,
      $$CachedStudentClassesTableCreateCompanionBuilder,
      $$CachedStudentClassesTableUpdateCompanionBuilder,
      (
        CachedStudentClassesData,
        BaseReferences<
          _$LocalDatabase,
          $CachedStudentClassesTable,
          CachedStudentClassesData
        >,
      ),
      CachedStudentClassesData,
      PrefetchHooks Function()
    >;
typedef $$CachedPaymentItemsTableCreateCompanionBuilder =
    CachedPaymentItemsCompanion Function({
      required String accountReference,
      required DateTime cachedAt,
      required DateTime expiresAt,
      Value<int> dataVersion,
      Value<int> schemaVersion,
      required String itemReference,
      required String serial,
      required String payload,
      Value<int> rowid,
    });
typedef $$CachedPaymentItemsTableUpdateCompanionBuilder =
    CachedPaymentItemsCompanion Function({
      Value<String> accountReference,
      Value<DateTime> cachedAt,
      Value<DateTime> expiresAt,
      Value<int> dataVersion,
      Value<int> schemaVersion,
      Value<String> itemReference,
      Value<String> serial,
      Value<String> payload,
      Value<int> rowid,
    });

class $$CachedPaymentItemsTableFilterComposer
    extends Composer<_$LocalDatabase, $CachedPaymentItemsTable> {
  $$CachedPaymentItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get accountReference => $composableBuilder(
    column: $table.accountReference,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dataVersion => $composableBuilder(
    column: $table.dataVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get schemaVersion => $composableBuilder(
    column: $table.schemaVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get itemReference => $composableBuilder(
    column: $table.itemReference,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get serial => $composableBuilder(
    column: $table.serial,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CachedPaymentItemsTableOrderingComposer
    extends Composer<_$LocalDatabase, $CachedPaymentItemsTable> {
  $$CachedPaymentItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get accountReference => $composableBuilder(
    column: $table.accountReference,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dataVersion => $composableBuilder(
    column: $table.dataVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get schemaVersion => $composableBuilder(
    column: $table.schemaVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get itemReference => $composableBuilder(
    column: $table.itemReference,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get serial => $composableBuilder(
    column: $table.serial,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CachedPaymentItemsTableAnnotationComposer
    extends Composer<_$LocalDatabase, $CachedPaymentItemsTable> {
  $$CachedPaymentItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get accountReference => $composableBuilder(
    column: $table.accountReference,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get expiresAt =>
      $composableBuilder(column: $table.expiresAt, builder: (column) => column);

  GeneratedColumn<int> get dataVersion => $composableBuilder(
    column: $table.dataVersion,
    builder: (column) => column,
  );

  GeneratedColumn<int> get schemaVersion => $composableBuilder(
    column: $table.schemaVersion,
    builder: (column) => column,
  );

  GeneratedColumn<String> get itemReference => $composableBuilder(
    column: $table.itemReference,
    builder: (column) => column,
  );

  GeneratedColumn<String> get serial =>
      $composableBuilder(column: $table.serial, builder: (column) => column);

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);
}

class $$CachedPaymentItemsTableTableManager
    extends
        RootTableManager<
          _$LocalDatabase,
          $CachedPaymentItemsTable,
          CachedPaymentItem,
          $$CachedPaymentItemsTableFilterComposer,
          $$CachedPaymentItemsTableOrderingComposer,
          $$CachedPaymentItemsTableAnnotationComposer,
          $$CachedPaymentItemsTableCreateCompanionBuilder,
          $$CachedPaymentItemsTableUpdateCompanionBuilder,
          (
            CachedPaymentItem,
            BaseReferences<
              _$LocalDatabase,
              $CachedPaymentItemsTable,
              CachedPaymentItem
            >,
          ),
          CachedPaymentItem,
          PrefetchHooks Function()
        > {
  $$CachedPaymentItemsTableTableManager(
    _$LocalDatabase db,
    $CachedPaymentItemsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedPaymentItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedPaymentItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedPaymentItemsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> accountReference = const Value.absent(),
                Value<DateTime> cachedAt = const Value.absent(),
                Value<DateTime> expiresAt = const Value.absent(),
                Value<int> dataVersion = const Value.absent(),
                Value<int> schemaVersion = const Value.absent(),
                Value<String> itemReference = const Value.absent(),
                Value<String> serial = const Value.absent(),
                Value<String> payload = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedPaymentItemsCompanion(
                accountReference: accountReference,
                cachedAt: cachedAt,
                expiresAt: expiresAt,
                dataVersion: dataVersion,
                schemaVersion: schemaVersion,
                itemReference: itemReference,
                serial: serial,
                payload: payload,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String accountReference,
                required DateTime cachedAt,
                required DateTime expiresAt,
                Value<int> dataVersion = const Value.absent(),
                Value<int> schemaVersion = const Value.absent(),
                required String itemReference,
                required String serial,
                required String payload,
                Value<int> rowid = const Value.absent(),
              }) => CachedPaymentItemsCompanion.insert(
                accountReference: accountReference,
                cachedAt: cachedAt,
                expiresAt: expiresAt,
                dataVersion: dataVersion,
                schemaVersion: schemaVersion,
                itemReference: itemReference,
                serial: serial,
                payload: payload,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CachedPaymentItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$LocalDatabase,
      $CachedPaymentItemsTable,
      CachedPaymentItem,
      $$CachedPaymentItemsTableFilterComposer,
      $$CachedPaymentItemsTableOrderingComposer,
      $$CachedPaymentItemsTableAnnotationComposer,
      $$CachedPaymentItemsTableCreateCompanionBuilder,
      $$CachedPaymentItemsTableUpdateCompanionBuilder,
      (
        CachedPaymentItem,
        BaseReferences<
          _$LocalDatabase,
          $CachedPaymentItemsTable,
          CachedPaymentItem
        >,
      ),
      CachedPaymentItem,
      PrefetchHooks Function()
    >;
typedef $$CartDraftsTableCreateCompanionBuilder =
    CartDraftsCompanion Function({
      required String draftId,
      required String accountReference,
      required String serial,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$CartDraftsTableUpdateCompanionBuilder =
    CartDraftsCompanion Function({
      Value<String> draftId,
      Value<String> accountReference,
      Value<String> serial,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$CartDraftsTableFilterComposer
    extends Composer<_$LocalDatabase, $CartDraftsTable> {
  $$CartDraftsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get draftId => $composableBuilder(
    column: $table.draftId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get accountReference => $composableBuilder(
    column: $table.accountReference,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get serial => $composableBuilder(
    column: $table.serial,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CartDraftsTableOrderingComposer
    extends Composer<_$LocalDatabase, $CartDraftsTable> {
  $$CartDraftsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get draftId => $composableBuilder(
    column: $table.draftId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get accountReference => $composableBuilder(
    column: $table.accountReference,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get serial => $composableBuilder(
    column: $table.serial,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CartDraftsTableAnnotationComposer
    extends Composer<_$LocalDatabase, $CartDraftsTable> {
  $$CartDraftsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get draftId =>
      $composableBuilder(column: $table.draftId, builder: (column) => column);

  GeneratedColumn<String> get accountReference => $composableBuilder(
    column: $table.accountReference,
    builder: (column) => column,
  );

  GeneratedColumn<String> get serial =>
      $composableBuilder(column: $table.serial, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$CartDraftsTableTableManager
    extends
        RootTableManager<
          _$LocalDatabase,
          $CartDraftsTable,
          CartDraft,
          $$CartDraftsTableFilterComposer,
          $$CartDraftsTableOrderingComposer,
          $$CartDraftsTableAnnotationComposer,
          $$CartDraftsTableCreateCompanionBuilder,
          $$CartDraftsTableUpdateCompanionBuilder,
          (
            CartDraft,
            BaseReferences<_$LocalDatabase, $CartDraftsTable, CartDraft>,
          ),
          CartDraft,
          PrefetchHooks Function()
        > {
  $$CartDraftsTableTableManager(_$LocalDatabase db, $CartDraftsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CartDraftsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CartDraftsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CartDraftsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> draftId = const Value.absent(),
                Value<String> accountReference = const Value.absent(),
                Value<String> serial = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CartDraftsCompanion(
                draftId: draftId,
                accountReference: accountReference,
                serial: serial,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String draftId,
                required String accountReference,
                required String serial,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => CartDraftsCompanion.insert(
                draftId: draftId,
                accountReference: accountReference,
                serial: serial,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CartDraftsTableProcessedTableManager =
    ProcessedTableManager<
      _$LocalDatabase,
      $CartDraftsTable,
      CartDraft,
      $$CartDraftsTableFilterComposer,
      $$CartDraftsTableOrderingComposer,
      $$CartDraftsTableAnnotationComposer,
      $$CartDraftsTableCreateCompanionBuilder,
      $$CartDraftsTableUpdateCompanionBuilder,
      (CartDraft, BaseReferences<_$LocalDatabase, $CartDraftsTable, CartDraft>),
      CartDraft,
      PrefetchHooks Function()
    >;
typedef $$CartDraftItemsTableCreateCompanionBuilder =
    CartDraftItemsCompanion Function({
      required String draftId,
      required String itemReference,
      required String payload,
      Value<int> rowid,
    });
typedef $$CartDraftItemsTableUpdateCompanionBuilder =
    CartDraftItemsCompanion Function({
      Value<String> draftId,
      Value<String> itemReference,
      Value<String> payload,
      Value<int> rowid,
    });

class $$CartDraftItemsTableFilterComposer
    extends Composer<_$LocalDatabase, $CartDraftItemsTable> {
  $$CartDraftItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get draftId => $composableBuilder(
    column: $table.draftId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get itemReference => $composableBuilder(
    column: $table.itemReference,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CartDraftItemsTableOrderingComposer
    extends Composer<_$LocalDatabase, $CartDraftItemsTable> {
  $$CartDraftItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get draftId => $composableBuilder(
    column: $table.draftId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get itemReference => $composableBuilder(
    column: $table.itemReference,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CartDraftItemsTableAnnotationComposer
    extends Composer<_$LocalDatabase, $CartDraftItemsTable> {
  $$CartDraftItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get draftId =>
      $composableBuilder(column: $table.draftId, builder: (column) => column);

  GeneratedColumn<String> get itemReference => $composableBuilder(
    column: $table.itemReference,
    builder: (column) => column,
  );

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);
}

class $$CartDraftItemsTableTableManager
    extends
        RootTableManager<
          _$LocalDatabase,
          $CartDraftItemsTable,
          CartDraftItem,
          $$CartDraftItemsTableFilterComposer,
          $$CartDraftItemsTableOrderingComposer,
          $$CartDraftItemsTableAnnotationComposer,
          $$CartDraftItemsTableCreateCompanionBuilder,
          $$CartDraftItemsTableUpdateCompanionBuilder,
          (
            CartDraftItem,
            BaseReferences<
              _$LocalDatabase,
              $CartDraftItemsTable,
              CartDraftItem
            >,
          ),
          CartDraftItem,
          PrefetchHooks Function()
        > {
  $$CartDraftItemsTableTableManager(
    _$LocalDatabase db,
    $CartDraftItemsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CartDraftItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CartDraftItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CartDraftItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> draftId = const Value.absent(),
                Value<String> itemReference = const Value.absent(),
                Value<String> payload = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CartDraftItemsCompanion(
                draftId: draftId,
                itemReference: itemReference,
                payload: payload,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String draftId,
                required String itemReference,
                required String payload,
                Value<int> rowid = const Value.absent(),
              }) => CartDraftItemsCompanion.insert(
                draftId: draftId,
                itemReference: itemReference,
                payload: payload,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CartDraftItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$LocalDatabase,
      $CartDraftItemsTable,
      CartDraftItem,
      $$CartDraftItemsTableFilterComposer,
      $$CartDraftItemsTableOrderingComposer,
      $$CartDraftItemsTableAnnotationComposer,
      $$CartDraftItemsTableCreateCompanionBuilder,
      $$CartDraftItemsTableUpdateCompanionBuilder,
      (
        CartDraftItem,
        BaseReferences<_$LocalDatabase, $CartDraftItemsTable, CartDraftItem>,
      ),
      CartDraftItem,
      PrefetchHooks Function()
    >;
typedef $$CachedPaymentMethodsTableCreateCompanionBuilder =
    CachedPaymentMethodsCompanion Function({
      required String accountReference,
      required DateTime cachedAt,
      required DateTime expiresAt,
      Value<int> dataVersion,
      Value<int> schemaVersion,
      required String methodCode,
      required String payload,
      Value<int> rowid,
    });
typedef $$CachedPaymentMethodsTableUpdateCompanionBuilder =
    CachedPaymentMethodsCompanion Function({
      Value<String> accountReference,
      Value<DateTime> cachedAt,
      Value<DateTime> expiresAt,
      Value<int> dataVersion,
      Value<int> schemaVersion,
      Value<String> methodCode,
      Value<String> payload,
      Value<int> rowid,
    });

class $$CachedPaymentMethodsTableFilterComposer
    extends Composer<_$LocalDatabase, $CachedPaymentMethodsTable> {
  $$CachedPaymentMethodsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get accountReference => $composableBuilder(
    column: $table.accountReference,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dataVersion => $composableBuilder(
    column: $table.dataVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get schemaVersion => $composableBuilder(
    column: $table.schemaVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get methodCode => $composableBuilder(
    column: $table.methodCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CachedPaymentMethodsTableOrderingComposer
    extends Composer<_$LocalDatabase, $CachedPaymentMethodsTable> {
  $$CachedPaymentMethodsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get accountReference => $composableBuilder(
    column: $table.accountReference,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dataVersion => $composableBuilder(
    column: $table.dataVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get schemaVersion => $composableBuilder(
    column: $table.schemaVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get methodCode => $composableBuilder(
    column: $table.methodCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CachedPaymentMethodsTableAnnotationComposer
    extends Composer<_$LocalDatabase, $CachedPaymentMethodsTable> {
  $$CachedPaymentMethodsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get accountReference => $composableBuilder(
    column: $table.accountReference,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get expiresAt =>
      $composableBuilder(column: $table.expiresAt, builder: (column) => column);

  GeneratedColumn<int> get dataVersion => $composableBuilder(
    column: $table.dataVersion,
    builder: (column) => column,
  );

  GeneratedColumn<int> get schemaVersion => $composableBuilder(
    column: $table.schemaVersion,
    builder: (column) => column,
  );

  GeneratedColumn<String> get methodCode => $composableBuilder(
    column: $table.methodCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);
}

class $$CachedPaymentMethodsTableTableManager
    extends
        RootTableManager<
          _$LocalDatabase,
          $CachedPaymentMethodsTable,
          CachedPaymentMethod,
          $$CachedPaymentMethodsTableFilterComposer,
          $$CachedPaymentMethodsTableOrderingComposer,
          $$CachedPaymentMethodsTableAnnotationComposer,
          $$CachedPaymentMethodsTableCreateCompanionBuilder,
          $$CachedPaymentMethodsTableUpdateCompanionBuilder,
          (
            CachedPaymentMethod,
            BaseReferences<
              _$LocalDatabase,
              $CachedPaymentMethodsTable,
              CachedPaymentMethod
            >,
          ),
          CachedPaymentMethod,
          PrefetchHooks Function()
        > {
  $$CachedPaymentMethodsTableTableManager(
    _$LocalDatabase db,
    $CachedPaymentMethodsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedPaymentMethodsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedPaymentMethodsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$CachedPaymentMethodsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> accountReference = const Value.absent(),
                Value<DateTime> cachedAt = const Value.absent(),
                Value<DateTime> expiresAt = const Value.absent(),
                Value<int> dataVersion = const Value.absent(),
                Value<int> schemaVersion = const Value.absent(),
                Value<String> methodCode = const Value.absent(),
                Value<String> payload = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedPaymentMethodsCompanion(
                accountReference: accountReference,
                cachedAt: cachedAt,
                expiresAt: expiresAt,
                dataVersion: dataVersion,
                schemaVersion: schemaVersion,
                methodCode: methodCode,
                payload: payload,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String accountReference,
                required DateTime cachedAt,
                required DateTime expiresAt,
                Value<int> dataVersion = const Value.absent(),
                Value<int> schemaVersion = const Value.absent(),
                required String methodCode,
                required String payload,
                Value<int> rowid = const Value.absent(),
              }) => CachedPaymentMethodsCompanion.insert(
                accountReference: accountReference,
                cachedAt: cachedAt,
                expiresAt: expiresAt,
                dataVersion: dataVersion,
                schemaVersion: schemaVersion,
                methodCode: methodCode,
                payload: payload,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CachedPaymentMethodsTableProcessedTableManager =
    ProcessedTableManager<
      _$LocalDatabase,
      $CachedPaymentMethodsTable,
      CachedPaymentMethod,
      $$CachedPaymentMethodsTableFilterComposer,
      $$CachedPaymentMethodsTableOrderingComposer,
      $$CachedPaymentMethodsTableAnnotationComposer,
      $$CachedPaymentMethodsTableCreateCompanionBuilder,
      $$CachedPaymentMethodsTableUpdateCompanionBuilder,
      (
        CachedPaymentMethod,
        BaseReferences<
          _$LocalDatabase,
          $CachedPaymentMethodsTable,
          CachedPaymentMethod
        >,
      ),
      CachedPaymentMethod,
      PrefetchHooks Function()
    >;
typedef $$CachedInvoicePreviewsTableCreateCompanionBuilder =
    CachedInvoicePreviewsCompanion Function({
      required String accountReference,
      required DateTime cachedAt,
      required DateTime expiresAt,
      Value<int> dataVersion,
      Value<int> schemaVersion,
      required String previewReference,
      required String payload,
      Value<int> rowid,
    });
typedef $$CachedInvoicePreviewsTableUpdateCompanionBuilder =
    CachedInvoicePreviewsCompanion Function({
      Value<String> accountReference,
      Value<DateTime> cachedAt,
      Value<DateTime> expiresAt,
      Value<int> dataVersion,
      Value<int> schemaVersion,
      Value<String> previewReference,
      Value<String> payload,
      Value<int> rowid,
    });

class $$CachedInvoicePreviewsTableFilterComposer
    extends Composer<_$LocalDatabase, $CachedInvoicePreviewsTable> {
  $$CachedInvoicePreviewsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get accountReference => $composableBuilder(
    column: $table.accountReference,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dataVersion => $composableBuilder(
    column: $table.dataVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get schemaVersion => $composableBuilder(
    column: $table.schemaVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get previewReference => $composableBuilder(
    column: $table.previewReference,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CachedInvoicePreviewsTableOrderingComposer
    extends Composer<_$LocalDatabase, $CachedInvoicePreviewsTable> {
  $$CachedInvoicePreviewsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get accountReference => $composableBuilder(
    column: $table.accountReference,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dataVersion => $composableBuilder(
    column: $table.dataVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get schemaVersion => $composableBuilder(
    column: $table.schemaVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get previewReference => $composableBuilder(
    column: $table.previewReference,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CachedInvoicePreviewsTableAnnotationComposer
    extends Composer<_$LocalDatabase, $CachedInvoicePreviewsTable> {
  $$CachedInvoicePreviewsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get accountReference => $composableBuilder(
    column: $table.accountReference,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get expiresAt =>
      $composableBuilder(column: $table.expiresAt, builder: (column) => column);

  GeneratedColumn<int> get dataVersion => $composableBuilder(
    column: $table.dataVersion,
    builder: (column) => column,
  );

  GeneratedColumn<int> get schemaVersion => $composableBuilder(
    column: $table.schemaVersion,
    builder: (column) => column,
  );

  GeneratedColumn<String> get previewReference => $composableBuilder(
    column: $table.previewReference,
    builder: (column) => column,
  );

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);
}

class $$CachedInvoicePreviewsTableTableManager
    extends
        RootTableManager<
          _$LocalDatabase,
          $CachedInvoicePreviewsTable,
          CachedInvoicePreview,
          $$CachedInvoicePreviewsTableFilterComposer,
          $$CachedInvoicePreviewsTableOrderingComposer,
          $$CachedInvoicePreviewsTableAnnotationComposer,
          $$CachedInvoicePreviewsTableCreateCompanionBuilder,
          $$CachedInvoicePreviewsTableUpdateCompanionBuilder,
          (
            CachedInvoicePreview,
            BaseReferences<
              _$LocalDatabase,
              $CachedInvoicePreviewsTable,
              CachedInvoicePreview
            >,
          ),
          CachedInvoicePreview,
          PrefetchHooks Function()
        > {
  $$CachedInvoicePreviewsTableTableManager(
    _$LocalDatabase db,
    $CachedInvoicePreviewsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedInvoicePreviewsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$CachedInvoicePreviewsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$CachedInvoicePreviewsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> accountReference = const Value.absent(),
                Value<DateTime> cachedAt = const Value.absent(),
                Value<DateTime> expiresAt = const Value.absent(),
                Value<int> dataVersion = const Value.absent(),
                Value<int> schemaVersion = const Value.absent(),
                Value<String> previewReference = const Value.absent(),
                Value<String> payload = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedInvoicePreviewsCompanion(
                accountReference: accountReference,
                cachedAt: cachedAt,
                expiresAt: expiresAt,
                dataVersion: dataVersion,
                schemaVersion: schemaVersion,
                previewReference: previewReference,
                payload: payload,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String accountReference,
                required DateTime cachedAt,
                required DateTime expiresAt,
                Value<int> dataVersion = const Value.absent(),
                Value<int> schemaVersion = const Value.absent(),
                required String previewReference,
                required String payload,
                Value<int> rowid = const Value.absent(),
              }) => CachedInvoicePreviewsCompanion.insert(
                accountReference: accountReference,
                cachedAt: cachedAt,
                expiresAt: expiresAt,
                dataVersion: dataVersion,
                schemaVersion: schemaVersion,
                previewReference: previewReference,
                payload: payload,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CachedInvoicePreviewsTableProcessedTableManager =
    ProcessedTableManager<
      _$LocalDatabase,
      $CachedInvoicePreviewsTable,
      CachedInvoicePreview,
      $$CachedInvoicePreviewsTableFilterComposer,
      $$CachedInvoicePreviewsTableOrderingComposer,
      $$CachedInvoicePreviewsTableAnnotationComposer,
      $$CachedInvoicePreviewsTableCreateCompanionBuilder,
      $$CachedInvoicePreviewsTableUpdateCompanionBuilder,
      (
        CachedInvoicePreview,
        BaseReferences<
          _$LocalDatabase,
          $CachedInvoicePreviewsTable,
          CachedInvoicePreview
        >,
      ),
      CachedInvoicePreview,
      PrefetchHooks Function()
    >;
typedef $$CachedPaymentTransactionsTableCreateCompanionBuilder =
    CachedPaymentTransactionsCompanion Function({
      required String accountReference,
      required DateTime cachedAt,
      required DateTime expiresAt,
      Value<int> dataVersion,
      Value<int> schemaVersion,
      required String merchantReference,
      required String payload,
      Value<int> rowid,
    });
typedef $$CachedPaymentTransactionsTableUpdateCompanionBuilder =
    CachedPaymentTransactionsCompanion Function({
      Value<String> accountReference,
      Value<DateTime> cachedAt,
      Value<DateTime> expiresAt,
      Value<int> dataVersion,
      Value<int> schemaVersion,
      Value<String> merchantReference,
      Value<String> payload,
      Value<int> rowid,
    });

class $$CachedPaymentTransactionsTableFilterComposer
    extends Composer<_$LocalDatabase, $CachedPaymentTransactionsTable> {
  $$CachedPaymentTransactionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get accountReference => $composableBuilder(
    column: $table.accountReference,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dataVersion => $composableBuilder(
    column: $table.dataVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get schemaVersion => $composableBuilder(
    column: $table.schemaVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get merchantReference => $composableBuilder(
    column: $table.merchantReference,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CachedPaymentTransactionsTableOrderingComposer
    extends Composer<_$LocalDatabase, $CachedPaymentTransactionsTable> {
  $$CachedPaymentTransactionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get accountReference => $composableBuilder(
    column: $table.accountReference,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dataVersion => $composableBuilder(
    column: $table.dataVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get schemaVersion => $composableBuilder(
    column: $table.schemaVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get merchantReference => $composableBuilder(
    column: $table.merchantReference,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CachedPaymentTransactionsTableAnnotationComposer
    extends Composer<_$LocalDatabase, $CachedPaymentTransactionsTable> {
  $$CachedPaymentTransactionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get accountReference => $composableBuilder(
    column: $table.accountReference,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get expiresAt =>
      $composableBuilder(column: $table.expiresAt, builder: (column) => column);

  GeneratedColumn<int> get dataVersion => $composableBuilder(
    column: $table.dataVersion,
    builder: (column) => column,
  );

  GeneratedColumn<int> get schemaVersion => $composableBuilder(
    column: $table.schemaVersion,
    builder: (column) => column,
  );

  GeneratedColumn<String> get merchantReference => $composableBuilder(
    column: $table.merchantReference,
    builder: (column) => column,
  );

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);
}

class $$CachedPaymentTransactionsTableTableManager
    extends
        RootTableManager<
          _$LocalDatabase,
          $CachedPaymentTransactionsTable,
          CachedPaymentTransaction,
          $$CachedPaymentTransactionsTableFilterComposer,
          $$CachedPaymentTransactionsTableOrderingComposer,
          $$CachedPaymentTransactionsTableAnnotationComposer,
          $$CachedPaymentTransactionsTableCreateCompanionBuilder,
          $$CachedPaymentTransactionsTableUpdateCompanionBuilder,
          (
            CachedPaymentTransaction,
            BaseReferences<
              _$LocalDatabase,
              $CachedPaymentTransactionsTable,
              CachedPaymentTransaction
            >,
          ),
          CachedPaymentTransaction,
          PrefetchHooks Function()
        > {
  $$CachedPaymentTransactionsTableTableManager(
    _$LocalDatabase db,
    $CachedPaymentTransactionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedPaymentTransactionsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$CachedPaymentTransactionsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$CachedPaymentTransactionsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> accountReference = const Value.absent(),
                Value<DateTime> cachedAt = const Value.absent(),
                Value<DateTime> expiresAt = const Value.absent(),
                Value<int> dataVersion = const Value.absent(),
                Value<int> schemaVersion = const Value.absent(),
                Value<String> merchantReference = const Value.absent(),
                Value<String> payload = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedPaymentTransactionsCompanion(
                accountReference: accountReference,
                cachedAt: cachedAt,
                expiresAt: expiresAt,
                dataVersion: dataVersion,
                schemaVersion: schemaVersion,
                merchantReference: merchantReference,
                payload: payload,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String accountReference,
                required DateTime cachedAt,
                required DateTime expiresAt,
                Value<int> dataVersion = const Value.absent(),
                Value<int> schemaVersion = const Value.absent(),
                required String merchantReference,
                required String payload,
                Value<int> rowid = const Value.absent(),
              }) => CachedPaymentTransactionsCompanion.insert(
                accountReference: accountReference,
                cachedAt: cachedAt,
                expiresAt: expiresAt,
                dataVersion: dataVersion,
                schemaVersion: schemaVersion,
                merchantReference: merchantReference,
                payload: payload,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CachedPaymentTransactionsTableProcessedTableManager =
    ProcessedTableManager<
      _$LocalDatabase,
      $CachedPaymentTransactionsTable,
      CachedPaymentTransaction,
      $$CachedPaymentTransactionsTableFilterComposer,
      $$CachedPaymentTransactionsTableOrderingComposer,
      $$CachedPaymentTransactionsTableAnnotationComposer,
      $$CachedPaymentTransactionsTableCreateCompanionBuilder,
      $$CachedPaymentTransactionsTableUpdateCompanionBuilder,
      (
        CachedPaymentTransaction,
        BaseReferences<
          _$LocalDatabase,
          $CachedPaymentTransactionsTable,
          CachedPaymentTransaction
        >,
      ),
      CachedPaymentTransaction,
      PrefetchHooks Function()
    >;
typedef $$SyncMetadataTableCreateCompanionBuilder =
    SyncMetadataCompanion Function({
      required String accountReference,
      required String key,
      required String value,
      Value<int> rowid,
    });
typedef $$SyncMetadataTableUpdateCompanionBuilder =
    SyncMetadataCompanion Function({
      Value<String> accountReference,
      Value<String> key,
      Value<String> value,
      Value<int> rowid,
    });

class $$SyncMetadataTableFilterComposer
    extends Composer<_$LocalDatabase, $SyncMetadataTable> {
  $$SyncMetadataTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get accountReference => $composableBuilder(
    column: $table.accountReference,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SyncMetadataTableOrderingComposer
    extends Composer<_$LocalDatabase, $SyncMetadataTable> {
  $$SyncMetadataTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get accountReference => $composableBuilder(
    column: $table.accountReference,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SyncMetadataTableAnnotationComposer
    extends Composer<_$LocalDatabase, $SyncMetadataTable> {
  $$SyncMetadataTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get accountReference => $composableBuilder(
    column: $table.accountReference,
    builder: (column) => column,
  );

  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$SyncMetadataTableTableManager
    extends
        RootTableManager<
          _$LocalDatabase,
          $SyncMetadataTable,
          SyncMetadataData,
          $$SyncMetadataTableFilterComposer,
          $$SyncMetadataTableOrderingComposer,
          $$SyncMetadataTableAnnotationComposer,
          $$SyncMetadataTableCreateCompanionBuilder,
          $$SyncMetadataTableUpdateCompanionBuilder,
          (
            SyncMetadataData,
            BaseReferences<
              _$LocalDatabase,
              $SyncMetadataTable,
              SyncMetadataData
            >,
          ),
          SyncMetadataData,
          PrefetchHooks Function()
        > {
  $$SyncMetadataTableTableManager(_$LocalDatabase db, $SyncMetadataTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncMetadataTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncMetadataTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncMetadataTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> accountReference = const Value.absent(),
                Value<String> key = const Value.absent(),
                Value<String> value = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SyncMetadataCompanion(
                accountReference: accountReference,
                key: key,
                value: value,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String accountReference,
                required String key,
                required String value,
                Value<int> rowid = const Value.absent(),
              }) => SyncMetadataCompanion.insert(
                accountReference: accountReference,
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

typedef $$SyncMetadataTableProcessedTableManager =
    ProcessedTableManager<
      _$LocalDatabase,
      $SyncMetadataTable,
      SyncMetadataData,
      $$SyncMetadataTableFilterComposer,
      $$SyncMetadataTableOrderingComposer,
      $$SyncMetadataTableAnnotationComposer,
      $$SyncMetadataTableCreateCompanionBuilder,
      $$SyncMetadataTableUpdateCompanionBuilder,
      (
        SyncMetadataData,
        BaseReferences<_$LocalDatabase, $SyncMetadataTable, SyncMetadataData>,
      ),
      SyncMetadataData,
      PrefetchHooks Function()
    >;
typedef $$SyncOutboxTableCreateCompanionBuilder =
    SyncOutboxCompanion Function({
      required String operationId,
      required String accountReference,
      required String operationType,
      required String payload,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$SyncOutboxTableUpdateCompanionBuilder =
    SyncOutboxCompanion Function({
      Value<String> operationId,
      Value<String> accountReference,
      Value<String> operationType,
      Value<String> payload,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$SyncOutboxTableFilterComposer
    extends Composer<_$LocalDatabase, $SyncOutboxTable> {
  $$SyncOutboxTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get operationId => $composableBuilder(
    column: $table.operationId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get accountReference => $composableBuilder(
    column: $table.accountReference,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get operationType => $composableBuilder(
    column: $table.operationType,
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
}

class $$SyncOutboxTableOrderingComposer
    extends Composer<_$LocalDatabase, $SyncOutboxTable> {
  $$SyncOutboxTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get operationId => $composableBuilder(
    column: $table.operationId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get accountReference => $composableBuilder(
    column: $table.accountReference,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get operationType => $composableBuilder(
    column: $table.operationType,
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
}

class $$SyncOutboxTableAnnotationComposer
    extends Composer<_$LocalDatabase, $SyncOutboxTable> {
  $$SyncOutboxTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get operationId => $composableBuilder(
    column: $table.operationId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get accountReference => $composableBuilder(
    column: $table.accountReference,
    builder: (column) => column,
  );

  GeneratedColumn<String> get operationType => $composableBuilder(
    column: $table.operationType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$SyncOutboxTableTableManager
    extends
        RootTableManager<
          _$LocalDatabase,
          $SyncOutboxTable,
          SyncOutboxData,
          $$SyncOutboxTableFilterComposer,
          $$SyncOutboxTableOrderingComposer,
          $$SyncOutboxTableAnnotationComposer,
          $$SyncOutboxTableCreateCompanionBuilder,
          $$SyncOutboxTableUpdateCompanionBuilder,
          (
            SyncOutboxData,
            BaseReferences<_$LocalDatabase, $SyncOutboxTable, SyncOutboxData>,
          ),
          SyncOutboxData,
          PrefetchHooks Function()
        > {
  $$SyncOutboxTableTableManager(_$LocalDatabase db, $SyncOutboxTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncOutboxTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncOutboxTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncOutboxTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> operationId = const Value.absent(),
                Value<String> accountReference = const Value.absent(),
                Value<String> operationType = const Value.absent(),
                Value<String> payload = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SyncOutboxCompanion(
                operationId: operationId,
                accountReference: accountReference,
                operationType: operationType,
                payload: payload,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String operationId,
                required String accountReference,
                required String operationType,
                required String payload,
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => SyncOutboxCompanion.insert(
                operationId: operationId,
                accountReference: accountReference,
                operationType: operationType,
                payload: payload,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SyncOutboxTableProcessedTableManager =
    ProcessedTableManager<
      _$LocalDatabase,
      $SyncOutboxTable,
      SyncOutboxData,
      $$SyncOutboxTableFilterComposer,
      $$SyncOutboxTableOrderingComposer,
      $$SyncOutboxTableAnnotationComposer,
      $$SyncOutboxTableCreateCompanionBuilder,
      $$SyncOutboxTableUpdateCompanionBuilder,
      (
        SyncOutboxData,
        BaseReferences<_$LocalDatabase, $SyncOutboxTable, SyncOutboxData>,
      ),
      SyncOutboxData,
      PrefetchHooks Function()
    >;

class $LocalDatabaseManager {
  final _$LocalDatabase _db;
  $LocalDatabaseManager(this._db);
  $$CachedChildrenTableTableManager get cachedChildren =>
      $$CachedChildrenTableTableManager(_db, _db.cachedChildren);
  $$CachedAcademicPeriodsTableTableManager get cachedAcademicPeriods =>
      $$CachedAcademicPeriodsTableTableManager(_db, _db.cachedAcademicPeriods);
  $$CachedStudentClassesTableTableManager get cachedStudentClasses =>
      $$CachedStudentClassesTableTableManager(_db, _db.cachedStudentClasses);
  $$CachedPaymentItemsTableTableManager get cachedPaymentItems =>
      $$CachedPaymentItemsTableTableManager(_db, _db.cachedPaymentItems);
  $$CartDraftsTableTableManager get cartDrafts =>
      $$CartDraftsTableTableManager(_db, _db.cartDrafts);
  $$CartDraftItemsTableTableManager get cartDraftItems =>
      $$CartDraftItemsTableTableManager(_db, _db.cartDraftItems);
  $$CachedPaymentMethodsTableTableManager get cachedPaymentMethods =>
      $$CachedPaymentMethodsTableTableManager(_db, _db.cachedPaymentMethods);
  $$CachedInvoicePreviewsTableTableManager get cachedInvoicePreviews =>
      $$CachedInvoicePreviewsTableTableManager(_db, _db.cachedInvoicePreviews);
  $$CachedPaymentTransactionsTableTableManager get cachedPaymentTransactions =>
      $$CachedPaymentTransactionsTableTableManager(
        _db,
        _db.cachedPaymentTransactions,
      );
  $$SyncMetadataTableTableManager get syncMetadata =>
      $$SyncMetadataTableTableManager(_db, _db.syncMetadata);
  $$SyncOutboxTableTableManager get syncOutbox =>
      $$SyncOutboxTableTableManager(_db, _db.syncOutbox);
}
