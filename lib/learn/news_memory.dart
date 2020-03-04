// import 'dart:io';
// import 'dart:core';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
// import 'package:road_to_flutter_demo/learn/learn_model.dart';



// class NewsMemory{
//   static Database _dataBase;
//   static final NewsMemory newsMemory = NewsMemory._();
//   NewsMemory._();


//    Future<Database> get database async{
//     // here i'm trying to get a database if it exists 
//     if(_dataBase != null) return _dataBase;

//     _dataBase = await initNews();


//     return _dataBase;
//   }


//   Future<Database> initNews() async{
//     Directory directory = await getApplicationDocumentsDirectory();
//     String path = join(directory.path,'newsmem.db');


//     // var newsDatabase = await openDatabase(path, version: 1, onCreate: _crnewDB);
//     // return newsDatabase;

//     return await openDatabase(path, version:1 , onOpen: (newsMemory){},
//       onCreate: (Database newDb, int version) async{
//         await newDb.execute(
//           "CREATE TABLE News("
//           // 'articles '
//           'author TEXT,'
//           'title TEXT,'
//           'description TEXT,'
//           'url TEXT,'
//           'urlToImage TEXT,'
//           'content TEXT'
//           ")"
//         );
//       }
//     );
//   }

//   createNews(Rates article) async{
//     await deleteNews();
//     final db = await database;
//     final news = await db.insert('News', article.toJson());

//     return news;
//   }
//     Future<int> deleteNews() async{
//     final db = await database;
//     final news = db.rawDelete('DELETE FROM News');
//     return news;
//   }

//   Future<List<Rates>> fetchMemNews() async {
//     final news = await database;
//     final newsRes =  await news.rawQuery("SELECT * FROM NEWS");
    
//     List<Rates> list = 
//       newsRes.isNotEmpty ? newsRes.map((c) => Rates.fromJson(c)).toList() : [];
    
    
//     return list;
//   }
// }