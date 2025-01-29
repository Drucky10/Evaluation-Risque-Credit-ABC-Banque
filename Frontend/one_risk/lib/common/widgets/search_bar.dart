import 'package:flutter/material.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      //height: 100,
      //color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical : 30),
      child: Stack(
        children: [
          TextField(
            decoration: InputDecoration(
              fillColor: const Color.fromARGB(255, 255, 255, 255),
              filled: true,
              border: OutlineInputBorder(
                borderRadius:BorderRadius.circular(20),
                borderSide : const BorderSide(width: 0, style: BorderStyle.none),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20,),
                prefixIcon: Icon(Icons.search_outlined, size: 30,),
                hintText: "Choissisez votre gâteau ",
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey.withOpacity(0.7),),
              ),

            ),
          Positioned(
            right: 12,
            bottom:16,
            child:Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFF5F67EA),
              ),
              child: const Icon(
                Icons.mic_outlined,
                color: Colors.white,
                size: 25,
              ),  
            ),
          ),
        ],
      ),
    );
  }
}