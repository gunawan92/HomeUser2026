import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'local_database.g.dart';

mixin CacheMetadata on Table {
  TextColumn get accountReference => text()();
  DateTimeColumn get cachedAt => dateTime()();
  DateTimeColumn get expiresAt => dateTime()();
  IntColumn get dataVersion => integer().withDefault(const Constant(1))();
  IntColumn get schemaVersion => integer().withDefault(const Constant(1))();
}

class CachedChildren extends Table with CacheMetadata {
  TextColumn get serial => text()();
  TextColumn get payload => text()();
  @override
  Set<Column<Object>> get primaryKey => {accountReference, serial};
}

class CachedAcademicPeriods extends Table with CacheMetadata {
  TextColumn get periodReference => text()();
  TextColumn get serial => text()();
  TextColumn get payload => text()();
  @override
  Set<Column<Object>> get primaryKey => {
    accountReference,
    periodReference,
    serial,
  };
}

class CachedStudentClasses extends Table with CacheMetadata {
  TextColumn get classReference => text()();
  TextColumn get serial => text()();
  TextColumn get payload => text()();
  @override
  Set<Column<Object>> get primaryKey => {
    accountReference,
    classReference,
    serial,
  };
}

class CachedPaymentItems extends Table with CacheMetadata {
  TextColumn get itemReference => text()();
  TextColumn get serial => text()();
  TextColumn get payload => text()();
  @override
  Set<Column<Object>> get primaryKey => {
    accountReference,
    itemReference,
    serial,
  };
}

class CartDrafts extends Table {
  TextColumn get draftId => text()();
  TextColumn get accountReference => text()();
  TextColumn get serial => text()();
  DateTimeColumn get updatedAt => dateTime()();
  @override
  Set<Column<Object>> get primaryKey => {draftId};
}

class CartDraftItems extends Table {
  TextColumn get draftId => text()();
  TextColumn get itemReference => text()();
  TextColumn get payload => text()();
  @override
  Set<Column<Object>> get primaryKey => {draftId, itemReference};
}

class CachedPaymentMethods extends Table with CacheMetadata {
  TextColumn get methodCode => text()();
  TextColumn get payload => text()();
  @override
  Set<Column<Object>> get primaryKey => {accountReference, methodCode};
}

class CachedInvoicePreviews extends Table with CacheMetadata {
  TextColumn get previewReference => text()();
  TextColumn get payload => text()();
  @override
  Set<Column<Object>> get primaryKey => {accountReference, previewReference};
}

class CachedPaymentTransactions extends Table with CacheMetadata {
  TextColumn get merchantReference => text()();
  TextColumn get payload => text()();
  @override
  Set<Column<Object>> get primaryKey => {accountReference, merchantReference};
}

class SyncMetadata extends Table {
  TextColumn get accountReference => text()();
  TextColumn get key => text()();
  TextColumn get value => text()();
  @override
  Set<Column<Object>> get primaryKey => {accountReference, key};
}

class SyncOutbox extends Table {
  TextColumn get operationId => text()();
  TextColumn get accountReference => text()();
  TextColumn get operationType => text()();
  TextColumn get payload => text()();
  DateTimeColumn get createdAt => dateTime()();
  @override
  Set<Column<Object>> get primaryKey => {operationId};
}

@DriftDatabase(
  tables: [
    CachedChildren,
    CachedAcademicPeriods,
    CachedStudentClasses,
    CachedPaymentItems,
    CartDrafts,
    CartDraftItems,
    CachedPaymentMethods,
    CachedInvoicePreviews,
    CachedPaymentTransactions,
    SyncMetadata,
    SyncOutbox,
  ],
)
class LocalDatabase extends _$LocalDatabase {
  LocalDatabase() : super(driftDatabase(name: 'stela_local'));

  @override
  int get schemaVersion => 1;
}
