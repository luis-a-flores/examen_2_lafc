import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.add))
        ],
        
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: 
              Column(
                children: [
                    Cards(),
                    Cards()
                  ],
                )
          )
        ],
      ),
    );
  }
}

class Cards extends StatelessWidget {
  const Cards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.all(15),
      elevation: 10,
      child:
        Center(
          child:Column(
          children: [
            const Icon(
              Icons.account_circle,
              size: 200,
            ),
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
              title: const Text('Titulo'),
              subtitle: const Text(
                'este es el subtitulo del card. aqui podemos colocar decripciones'
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                IconButton(onPressed: (){}, icon: Icon(Icons.delete))
              ],
            )
          ],
      )
        )
        
    );
  }
}