import 'package:anime_app/modules/filter_screen/filter_screen.dart';
import 'package:anime_app/shared/components/components.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: IconButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const FilterScreen()));
                        },
                        icon: const Icon(Icons.filter_alt_outlined)),
                    border: const OutlineInputBorder(),
                  ),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: vListViewItem(context),
                  ),
                  separatorBuilder: (context, index) => Container(height: 1,width: double.infinity,color: Colors.grey[300]),
                  itemCount: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
