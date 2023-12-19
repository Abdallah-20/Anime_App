import 'package:anime_app/modules/genre_screen.dart';
import 'package:anime_app/shared/cubit/cubit.dart';
import 'package:anime_app/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool yearPressed = false;
  String ?dropDownValue;

  var startDateController = TextEditingController();
  var endDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppCubitStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
            toolbarHeight: 40,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 13),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text("Filter"),
                      const Spacer(),
                      TextButton(onPressed: () {}, child: const Text('Reset'))
                    ],
                  ),
                  buildFilterItem(
                      Colors.orange,
                      Icons.grid_view_rounded,
                      'Genre',
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 17,
                        color: Colors.grey,
                      ), () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const GenreScreen(),
                        ));
                  }),
                  const SizedBox(height: 10),
                  Column(
                    children: [
                      buildFilterItem(
                          Colors.red[900]!,
                          Icons.calendar_month_outlined,
                          'Release Year',
                          yearPressed
                              ? const Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 30,
                                  color: Colors.grey,
                                )
                              : const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 17,
                                  color: Colors.grey,
                                ), () {
                        setState(() {
                          yearPressed = !yearPressed;
                          // if (yearPressed) {
                          //   height = 250.0;
                          // }
                          // else{
                          //   height = 48.0;
                          // }
                        });
                      }),
                      AnimatedSize(
                        duration: const Duration(seconds: 1),
                        curve: Curves.fastOutSlowIn,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            // color: defaultColor,
                          ),
                          height: yearPressed ? null : 0.0,
                          child: Padding(
                            padding: const EdgeInsetsDirectional.only(
                                start: 10.0, end: 10, top: 10, bottom: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.grey.shade300,
                              ),
                              padding: const EdgeInsets.all(7),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text('Start Date '),
                                      TextFormField(
                                        controller: startDateController,
                                        keyboardType: TextInputType.datetime,
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color:
                                                    Colors.deepPurple.shade300,
                                                width: 2),
                                          ),
                                          contentPadding: EdgeInsets.zero,
                                          border: const OutlineInputBorder(),
                                          hintText: ' EX. M/Y',
                                          suffixIcon: IconButton(
                                              icon:
                                                  const Icon(Icons.date_range),
                                              color: Colors.deepPurple.shade300,
                                              onPressed: () {
                                                showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime.now(),
                                                  lastDate: DateTime.now(),
                                                ).then((value) =>
                                                    startDateController.text =
                                                        DateFormat.yM()
                                                            .format(value!));
                                              }),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 5),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text('End Date '),
                                      TextFormField(
                                        controller: endDateController,
                                        keyboardType: TextInputType.datetime,
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color:
                                                    Colors.deepPurple.shade300,
                                                width: 2),
                                          ),
                                          contentPadding: EdgeInsets.zero,
                                          border: const OutlineInputBorder(),
                                          hintText: ' EX. M/Y',
                                          suffixIcon: IconButton(
                                              icon:
                                                  const Icon(Icons.date_range),
                                              color: Colors.deepPurple.shade300,
                                              onPressed: () {
                                                showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime.now(),
                                                  lastDate: DateTime.now(),
                                                ).then((value) =>
                                                    endDateController.text =
                                                        DateFormat.yM()
                                                            .format(value!));
                                              }),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  buildFilterItem(
                      Colors.green,
                      Icons.place_outlined,
                      'Country',
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 17,
                        color: Colors.grey,
                      ),
                      () {}),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      CircleAvatar(
                          backgroundColor: Colors.blue[900],
                          child: const Icon(Icons.today, color: Colors.white)),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0,0,15.0,0),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              icon: const Icon(
                                Icons.arrow_forward_ios,
                                size: 17,
                                color: Colors.grey,
                              ),
                              hint: const Text('Age',style: TextStyle(color: Colors.black),),
                              value: dropDownValue,
                              isExpanded: true,
                              items: ['Rated G', 'Rated PG', 'Rated R', 'Rated X']
                                  .map((items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropDownValue = newValue!;
                                });
                              },
                              // dropdownColor:defaultColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildFilterItem(Color color, IconData icon, String text,
          Widget arrowIcon, Function function) =>
      Row(
        children: [
          CircleAvatar(
              backgroundColor: color, child: Icon(icon, color: Colors.white)),
          const SizedBox(width: 15),
          Text(text),
          const Spacer(),
          IconButton(
            onPressed: () {
              function();
            },
            icon: arrowIcon,
          ),
        ],
      );
}
