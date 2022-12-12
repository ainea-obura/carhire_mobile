import 'package:flutter/material.dart';
import '../services/hire_service.dart';
import '../models/hire.dart';

class MyHires extends StatefulWidget {
  const MyHires({Key? key}) : super(key: key);

  @override
  State<MyHires> createState() => _MyHiresState();
}

class _MyHiresState extends State<MyHires> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Hires'),
        backgroundColor: Color(0xFF00A368),
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder<Hire>(
            builder: (context, snapshot){
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }else{
                return ListView.builder(
                  shrinkWrap: true,
                    itemCount: snapshot.data!.hire.length,
                    itemBuilder: (context, index)=>Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 28,
                          backgroundImage: NetworkImage(
                            'https://source.unsplash.com/random/?Cryptocurrency&1'
                          ),
                        ),
                        title: Text(snapshot.data!.hire[index].carId.toString()),
                        subtitle: Row(
                          children: [
                            Expanded(child: Text(snapshot.data!.hire[index].start.toString())),
                            const SizedBox(width: 8),
                            const Icon(Icons.arrow_forward, color: Color(0xFF00A368)),
                            const SizedBox(width: 8),
                            Expanded(child: Text(snapshot.data!.hire[index].end.toString()))
                          ],
                        ),
                        trailing: const Icon(Icons.arrow_forward),
                      ),
                    )
                );
              }
            },
              future: fetchData(),
          ),
        ),
      ),
    );
  }
}

