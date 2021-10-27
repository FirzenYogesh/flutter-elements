import 'package:elements/src/tools/db.dart';
import 'package:sembast/sembast.dart';
import 'package:test/test.dart';

void main() async {
  group('Database Open', () {
    test('Should open database', () async {
      await DB.initialize();
      var db = DB.instance;
      expect(await db.open(), true);
    });

    test('Should have same db name', () async {
      await DB.initialize(dbPath: 'test.db');
      expect(DB.instance.db.path.contains(DB.instance.dbPath), true);
    });
  });

  group('Database Get Collection', () {
    test('Should give default reference', () async {
      await DB.initialize(dbPath: 'test.db');
      expect(DB.instance.collection, StoreRef.main());
    });

    test('Should give defined collection reference', () async {
      await DB.initialize(dbPath: 'test.db', collectionName: 'foo');
      expect(DB.instance.collection.name, 'foo');
    });
  });

  group('Database Insert Records', () {
    test('Should insert/update to default collection', () async {
      await DB.initialize(dbPath: 'test.db');
      expect(await DB.instance.insert('foo', 'bar'), 'bar');
    });

    test('Should insert/update to default collection', () async {
      await DB.initialize(dbPath: 'test.db');
      expect(
          await DB.instance.insert('foo', {'ping': 'pong'}), {'ping': 'pong'});
    });

    test('Should insert/update to default collection (using transaction)',
        () async {
      await DB.initialize(dbPath: 'test.db');
      expect(
          await DB.instance.insert('foo', 'bar', useTransaction: true), 'bar');
    });

    test('Should insert/update to default collection (using transaction)',
        () async {
      await DB.initialize(dbPath: 'test.db');
      expect(
          await DB.instance
              .insert('foo', {'ping': 'pong'}, useTransaction: true),
          {'ping': 'pong'});
    });

    test('Should merge data to default collection', () async {
      await DB.initialize(dbPath: 'test.db');
      expect(await DB.instance.insert('foo', {'hello': 'world'}, merge: true),
          {'ping': 'pong', 'hello': 'world'});
    });

    test('Should merge data to default collection (using transaction)',
        () async {
      await DB.initialize(dbPath: 'test.db');
      expect(
          await DB.instance
              .insert('foo', {'foo': 'bar'}, merge: true, useTransaction: true),
          {'ping': 'pong', 'hello': 'world', 'foo': 'bar'});
    });

    // with collection name specified
    test('Should insert/update to with collection name specified', () async {
      await DB.initialize(dbPath: 'test.db');
      expect(
          await DB.instance.insert('foo', 'bar', collectionName: 'test_insert'),
          'bar');
    });

    test('Should insert/update to with collection name specified', () async {
      await DB.initialize(dbPath: 'test.db');
      expect(
          await DB.instance
              .insert('foo', {'ping': 'pong'}, collectionName: 'test_insert'),
          {'ping': 'pong'});
    });

    test(
        'Should insert/update to with collection name specified (using transaction)',
        () async {
      await DB.initialize(dbPath: 'test.db');
      expect(
          await DB.instance.insert('foo', 'bar',
              useTransaction: true, collectionName: 'test_insert'),
          'bar');
    });

    test(
        'Should insert/update to with collection name specified (using transaction)',
        () async {
      await DB.initialize(dbPath: 'test.db');
      expect(
          await DB.instance.insert('foo', {'ping': 'pong'},
              useTransaction: true, collectionName: 'test_insert'),
          {'ping': 'pong'});
    });

    test('Should merge data to with collection name specified', () async {
      await DB.initialize(dbPath: 'test.db');
      expect(
          await DB.instance.insert('foo', {'hello': 'world'},
              merge: true, collectionName: 'test_insert'),
          {'ping': 'pong', 'hello': 'world'});
    });

    test(
        'Should merge data to with collection name specified (using transaction)',
        () async {
      await DB.initialize(dbPath: 'test.db');
      expect(
          await DB.instance.insert('foo', {'foo': 'bar'},
              merge: true, useTransaction: true, collectionName: 'test_insert'),
          {'ping': 'pong', 'hello': 'world', 'foo': 'bar'});
    });
  });

  group('Database Delete Records', () {
    test('Delete from default collection', () async {
      await DB.initialize(dbPath: 'test.db');
      await DB.instance.insert('yeet', {'hello': 'world'});
      expect(await DB.instance.delete('yeet'), 'yeet');
    });

    test('Delete from default collection (using transaction)', () async {
      await DB.initialize(dbPath: 'test.db');
      await DB.instance
          .insert('yeet', {'hello': 'world'}, useTransaction: true);
      expect(await DB.instance.delete('yeet', useTransaction: true), 'yeet');
    });

    test('Delete from specified collection', () async {
      await DB.initialize(dbPath: 'test.db');
      await DB.instance
          .insert('yeet', {'hello': 'world'}, collectionName: 'test_delete');
      expect(await DB.instance.delete('yeet', collectionName: 'test_delete'),
          'yeet');
    });

    test('Delete from specified collection (using transaction)', () async {
      await DB.initialize(dbPath: 'test.db');
      await DB.instance.insert('yeet', {'hello': 'world'},
          useTransaction: true, collectionName: 'test_delete');
      expect(
          await DB.instance.delete('yeet',
              useTransaction: true, collectionName: 'test_delete'),
          'yeet');
    });
  });
}
