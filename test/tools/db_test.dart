import 'package:elements/tools/db.dart';
import 'package:sembast/sembast.dart';
import 'package:test/test.dart';

void main() {
  group('Database Open', () {
    test('Should open database', () async {
      var db = DB();
      expect(await db.open(), true);
    });

    test('Should have same db name', () async {
      var db = DB(dbPath: 'test.db');
      await db.open();
      expect(db.db.path.contains(db.dbPath), true);
    });
  });

  group('Database Get Collection', () {
    test('Should give default reference', () async {
      var db = DB(dbPath: 'test.db');
      await db.open();
      expect(db.collection, StoreRef.main());
    });

    test('Should give defined collection reference', () async {
      var db = DB(dbPath: 'test.db', collectionName: 'foo');
      await db.open();
      expect(db.collection.name, 'foo');
    });
  });

  group('Database Insert Records', () {
    test('Should insert/update to default collection', () async {
      var db = DB(dbPath: 'test.db');
      await db.open();
      expect(await db.insert('foo', 'bar'), 'bar');
    });

    test('Should insert/update to default collection', () async {
      var db = DB(dbPath: 'test.db');
      await db.open();
      expect(await db.insert('foo', {'ping': 'pong'}), {'ping': 'pong'});
    });

    test('Should insert/update to default collection (using transaction)',
        () async {
      var db = DB(dbPath: 'test.db');
      await db.open();
      expect(await db.insert('foo', 'bar', useTransaction: true), 'bar');
    });

    test('Should insert/update to default collection (using transaction)',
        () async {
      var db = DB(dbPath: 'test.db');
      await db.open();
      expect(await db.insert('foo', {'ping': 'pong'}, useTransaction: true),
          {'ping': 'pong'});
    });

    test('Should merge data to default collection', () async {
      var db = DB(dbPath: 'test.db');
      await db.open();
      expect(await db.insert('foo', {'hello': 'world'}, merge: true),
          {'ping': 'pong', 'hello': 'world'});
    });

    test('Should merge data to default collection (using transaction)',
        () async {
      var db = DB(dbPath: 'test.db');
      await db.open();
      expect(
          await db.insert('foo', {'foo': 'bar'},
              merge: true, useTransaction: true),
          {'ping': 'pong', 'hello': 'world', 'foo': 'bar'});
    });

    // with collection name specified
    test('Should insert/update to with collection name specified', () async {
      var db = DB(dbPath: 'test.db');
      await db.open();
      expect(
          await db.insert('foo', 'bar', collectionName: 'test_insert'), 'bar');
    });

    test('Should insert/update to with collection name specified', () async {
      var db = DB(dbPath: 'test.db');
      await db.open();
      expect(
          await db.insert('foo', {'ping': 'pong'},
              collectionName: 'test_insert'),
          {'ping': 'pong'});
    });

    test(
        'Should insert/update to with collection name specified (using transaction)',
        () async {
      var db = DB(dbPath: 'test.db');
      await db.open();
      expect(
          await db.insert('foo', 'bar',
              useTransaction: true, collectionName: 'test_insert'),
          'bar');
    });

    test(
        'Should insert/update to with collection name specified (using transaction)',
        () async {
      var db = DB(dbPath: 'test.db');
      await db.open();
      expect(
          await db.insert('foo', {'ping': 'pong'},
              useTransaction: true, collectionName: 'test_insert'),
          {'ping': 'pong'});
    });

    test('Should merge data to with collection name specified', () async {
      var db = DB(dbPath: 'test.db');
      await db.open();
      expect(
          await db.insert('foo', {'hello': 'world'},
              merge: true, collectionName: 'test_insert'),
          {'ping': 'pong', 'hello': 'world'});
    });

    test(
        'Should merge data to with collection name specified (using transaction)',
        () async {
      var db = DB(dbPath: 'test.db');
      await db.open();
      expect(
          await db.insert('foo', {'foo': 'bar'},
              merge: true, useTransaction: true, collectionName: 'test_insert'),
          {'ping': 'pong', 'hello': 'world', 'foo': 'bar'});
    });
  });

  group('Database Delete Records', () {
    test('Delete from default collection', () async {
      var db = DB(dbPath: 'test.db');
      await db.open();
      await db.insert('yeet', {'hello': 'world'});
      expect(await db.delete('yeet'), 'yeet');
    });

    test('Delete from default collection (using transaction)', () async {
      var db = DB(dbPath: 'test.db');
      await db.open();
      await db.insert('yeet', {'hello': 'world'}, useTransaction: true);
      expect(await db.delete('yeet', useTransaction: true), 'yeet');
    });

    test('Delete from specified collection', () async {
      var db = DB(dbPath: 'test.db');
      await db.open();
      await db.insert('yeet', {'hello': 'world'},
          collectionName: 'test_delete');
      expect(await db.delete('yeet', collectionName: 'test_delete'), 'yeet');
    });

    test('Delete from specified collection (using transaction)', () async {
      var db = DB(dbPath: 'test.db');
      await db.open();
      await db.insert('yeet', {'hello': 'world'},
          useTransaction: true, collectionName: 'test_delete');
      expect(
          await db.delete('yeet',
              useTransaction: true, collectionName: 'test_delete'),
          'yeet');
    });
  });

  
}
