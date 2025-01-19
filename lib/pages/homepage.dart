import 'package:apinews/pages/articlecard.dart';
import 'package:apinews/pages/everyevent.dart';
import 'package:apinews/service/NewsService.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int index = 0;

  String selectedcategory = "general";

  bool ispressed = false;

  List<String> category = [
    "general",
    "sports",
    "business",
    "technology",
    "health"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff3c4cd4),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "News App",
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: NetworkImage(
                        "https://imgs.search.brave.com/EA1ntC_xxPTeNnThKZ3DCvh_XiKgMmbSVcradE8TeHo/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvMTU3/Mzk5ODcyL3Bob3Rv/L25ld3MuanBnP3M9/NjEyeDYxMiZ3PTAm/az0yMCZjPTgtaDNT/RkVJOWV4bTc3ODd0/NmRsVzVxN3dKRk5I/LURvbHctNE9HQ3RD/bzQ9"),
                    fit: BoxFit.fill)),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 62,
            child: ListView.builder(
              itemCount: category.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                ispressed = selectedcategory == category[index];
                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedcategory = category[index];
                    });
                  },
                  child: Container(
                      //width: 60,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color:
                              //  Colors.amber),
                              ispressed ? Colors.orange : Colors.white),
                      child: Text(category[index])),
                );
              },
            ),
          ),
          Expanded(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: FutureBuilder(
                  future: Newsservice().getNews(selectedcategory),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Everyevent(
                                        article: snapshot.data![index]),
                                  ),
                                );
                              });
                            },
                            child: AritcleCard(
                              article: snapshot.data![index],
                            ),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else {
                      return const SizedBox();
                    }
                  }),
            ),
          ),
        ],
      ),

      // body:
    );
  }
}
