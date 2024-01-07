import 'package:flutter/material.dart';
import 'package:tri_api/api.dart';
import 'package:tri_api/model.dart';
import 'package:tri_api/widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController textController = TextEditingController();

  List<DiModel> dataa = [];

  bool isReady =false;
  _getData(String searchQuerry) {
    isReady=true;
    Api(key: searchQuerry).getModelApi().then((value) {
      setState(() {
        dataa = value ?? [];
        isReady =false;
      });
      
    }).onError((error, stackTrace) {
      print(error);
    });
  }


  @override
  void initState() {
    _getData(textController.text);
    super.initState();
  }

 @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color.fromARGB(255, 64, 59, 65),
    body: isReady == true
        ? const Center(child: CircularProgressIndicator())
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 15, 0),
                child: TextField(
                  onChanged: (value) {
                    _getData(value);
                  },
                 
                  controller: textController,
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    hintText: "Search",
                    suffixIcon: const Icon(Icons.search, color: Colors.white),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    iconColor: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: dataa.isEmpty
                    ? Center(child: Text('No data available', style: TextStyle(color: Colors.white)))
                    :ListView.builder(
  itemCount: dataa.length,
  itemBuilder: (context, index) {
    if (index >= dataa.length || index < 0) {
      return SizedBox.shrink(); 
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          dataa[index].word ?? '',
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 10),
        MyWidget(
          header: 'Part of Speech  :',
          value: dataa[index].meanings.isNotEmpty ? dataa[index].meanings[0].partOfSpeech ?? '' : '',
        ),
        const SizedBox(height: 10),
        Column(
          children: [
            MyWidget(
              header: 'synonyms:',
              value: dataa[index].meanings.isNotEmpty && dataa[index].meanings[0].synonyms.isNotEmpty
                  ? '${dataa[index].meanings[0].synonyms[0]}, ${dataa[index].meanings[0].synonyms.length > 1 ? dataa[index].meanings[0].synonyms[1] : ''}'
                  : '',
            ),
            const SizedBox(height: 10),
            MyWidget(
              header: 'definition:',
              value: dataa[index].meanings.isNotEmpty && dataa[index].meanings[0].definitions.isNotEmpty
                  ? dataa[index].meanings[0].definitions[0].definition ?? ''
                  : '',
            ),
          ],
        ),
      ],
    );
  },
),

              ),
            ],
          ),
  );
}
}