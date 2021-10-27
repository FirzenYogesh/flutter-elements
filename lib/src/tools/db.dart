import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

import 'utils.dart';

export 'package:sembast/sembast.dart';
export 'package:sembast/sembast_io.dart';

class DB {
  final String dbPath;
  final int version;
  final String? password;
  final String? collectionName;

  final DatabaseFactory _dbFactory = databaseFactoryIo;
  late Database _db;
  bool _opened = false;

  Database get db => _db;
  bool get isOpened => _opened;

  StoreRef get collection => _getCollection(collectionName);

  DB({
    this.dbPath = 'database.db',
    this.version = 1,
    this.collectionName,
    this.password,
  });

  Future<bool> open() async {
    _db = await _dbFactory.openDatabase(
      dbPath,
      version: version,
    );
    _opened = Utils.isTruthy(_db);
    return _opened;
  }

  Future<dynamic> close() async {
    if (isOpened) {
      return _db.close();
    }
  }

  StoreRef _getCollection(String? collectionName) {
    var table = collectionName ?? this.collectionName;

    StoreRef store;
    if (Utils.isTruthy(table)) {
      // if (isIntegerKey) {
      //   store = stringMapStoreFactory.store(collectionName);
      // } else {
      //   store = intMapStoreFactory.store(collectionName);
      // }
      store = StoreRef(collectionName!);
    } else {
      store = StoreRef.main();
    }
    return store;
  }

  Future<List<RecordSnapshot>> find(
    Filter filter,
    List<SortOrder> sortOrders, {
    String? collectionName,
  }) async {
    var store = _getCollection(collectionName);
    var finder = Finder(filter: filter, sortOrders: sortOrders);
    return await store.find(db, finder: finder);
  }

  Future<dynamic> insert(
    dynamic key,
    dynamic value, {
    bool merge = true,
    String? collectionName,
    bool useTransaction = false,
  }) async {
    var store = _getCollection(collectionName);
    if (useTransaction) {
      return await db.transaction((transaction) async =>
          await store.record(key).put(transaction, value, merge: merge));
    } else {
      return await store.record(key).put(db, value, merge: merge);
    }
  }

  Future<dynamic> delete(
    dynamic key, {
    String? collectionName,
    bool useTransaction = false,
  }) async {
    var store = _getCollection(collectionName);
    if (useTransaction) {
      return await db.transaction(
          (transaction) async => await store.record(key).delete(transaction));
    } else {
      return await store.record(key).delete(db);
    }
  }

  Future<int> update(
    dynamic value, {
    String? collectionName,
    bool useTransaction = false,
    Filter? filter,
  }) async {
    var store = _getCollection(collectionName);
    if (useTransaction) {
      return await db.transaction((transaction) async => await store
          .update(transaction, value, finder: Finder(filter: filter)));
    } else {
      return await store.update(db, value, finder: Finder(filter: filter));
    }
  }
}
