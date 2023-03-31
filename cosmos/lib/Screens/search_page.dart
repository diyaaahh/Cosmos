import 'package:cosmos/components.dart';
import'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  

  SearchPage({super.key});

  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Color.fromARGB(255, 58, 55, 55),
        title: const Text('Appbar', style: TextStyle(color: Colors.white),),
        actions:[
          IconButton(
          icon:Icon(Icons.search),
          onPressed:(){
            showSearch(
              context: context,
               delegate: CustomSearch(),
               );
          },),
           ]));
      
   
  }
}

  class CustomSearch extends SearchDelegate{
    final List<String> allData =[
      'Banepa','Dulikhel','Kathmandu','Panauti','28 Kilo','Hogwarts','Rome','Venice','Paris','Birmingham','Asgard','Green Gables'
      
    ];
   
      
    
    @override
    List <Widget> buildActions(BuildContext context) 
    {
      return[
         IconButton(
          icon:Icon(Icons.clear),
          onPressed: (){
            query='';
          },
        )
      ];
    }

     @override
    Widget buildLeading(BuildContext context) 
    {
      return IconButton(
         icon: Icon(Icons.arrow_back),
         onPressed: (){
          close(context, null);
         },
         );
    }
     @override
    Widget buildSuggestions(BuildContext context) 
    {
     List<String> matchQuery=[];
     for (var item in allData){
      if(item.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(item);
      }
     }
     return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder:(context,index){
        var result=matchQuery[index];
        // 
        return Container(
         // tileColor: Colors.amber,
         margin: EdgeInsets.all(5),
         decoration: BoxDecoration(
    border: Border.all(color: Colors.black),
    borderRadius: BorderRadius.circular(10),),
        child: ListTile(
          leading: Icon(Icons.directions_bus),
          title:Text(result)));
      }
     );
    }

     @override
    Widget buildResults(BuildContext context) 
    {
      List<String> matchQuery=[];
     for (var item in allData){
      if(item.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(item);
      }
     }
     return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder:(context,index){
        var result=matchQuery[index];
        return Container(
         // tileColor: Colors.amber,
         decoration: BoxDecoration(
    border: Border.all(color: Colors.grey),
    borderRadius: BorderRadius.circular(10),),
        child: ListTile(
          title:Text(result)));
      }
     );
    }
  }
