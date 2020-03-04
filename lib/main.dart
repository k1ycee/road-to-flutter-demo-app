import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:road_to_flutter_demo/learn/learn_call.dart';
import 'package:road_to_flutter_demo/learn/learn_model.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:road_to_flutter_demo/learn/news_memory.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
  // Future<List<Rates>> rates;
  // @override
  // void initState() {
  
  //   super.initState();
  // }
  
  RatesProvider ratesProvider = RatesProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('TechCrunch'),
        centerTitle: true,
      ),
      body: FutureBuilder<Rates>(
        future: ratesProvider.getRates(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data.articles.length,
              itemBuilder: (context,index){
                return ListTile(
                    // leading: CircleAvatar(child:Image.network('${snapshot.data.articles[index].urlToImage}'),),
                    title: Text(snapshot.data.articles[index].title,style: TextStyle(fontSize: 19, fontWeight: FontWeight.w300),),
                    subtitle: Text((snapshot.data.articles[index].author) == null ? 'Not available' : (snapshot.data.articles[index].author)),
                    trailing: IconButton(icon: Icon(Icons.launch,color: Colors.green,),
                    onPressed: ()async{
                      String url = (snapshot.data.articles[index].url);
                      if(await canLaunch(url)){
                        await launch(url);
                      }
                      else{
                        throw "can't launch $url";
                      }
                    },
                  ),
                );
              }
            );
          }
          return SpinKitPouringHourglass(color: Colors.black,size: 90,);
        },
      ),
    );
  }
}

