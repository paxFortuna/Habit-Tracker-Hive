import 'package:flutter/material.dart';

import '../components/habit_tile.dart';
import '../components/my_alert_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // data structure for todays habit list
  List todaysHabitList = [
    // [ habitName, habitCompleted ]
    ['Morning Run', false],
    ['Read Book', false],
    ['Code App', false],
  ];

  // bool to control habit completed
  bool habitCompleted = false;

  // checkbox was tapped
  void checkBoxTapped(bool? value, int index) {
    setState(() {
      todaysHabitList[index][1] = value;
    });
  }

  // create a new habit
  final _newHabitNameController = TextEditingController();

  void createNewHabit() {
    // show alert dialog for user to enter the new habit details
    showDialog(
        context: context,
        builder: (context) {
          return MyAlertBox(
            controller: _newHabitNameController,
            hintText: 'Enter habit name..',
            onSave: saveNewHabit,
            onCancel: cancelNewHabit,
          );
        });
  }

  // save new habit
  void saveNewHabit() {
    // add new habit to todays habit list
    setState(() {
      todaysHabitList.add([_newHabitNameController.text, false]);
    });
    // clear textfield
    _newHabitNameController.clear();
  }

  // cancel new habit
  void cancelNewHabit() {
    // clear textfield
    _newHabitNameController.clear();
    // pop dialog box
    Navigator.of(context).pop();
  }

  // cancel new habit
  void cancelDialogBox() {
    // clear textfield
    _newHabitNameController.clear();

    // pop dialog box
    Navigator.of(context).pop();
  }

  // open habit settings to edit
  void openHabitSettings(int index) {
    showDialog(
        context: context,
        builder: (context) {
          return MyAlertBox(
            controller: _newHabitNameController,
            hintText: todaysHabitList[index][0],
            onSave: () => saveExistingHabit(index),
            onCancel: cancelDialogBox,
          );
        });
  }

  // save existing habit with a new name
  void saveExistingHabit(int index) {
    setState(() {
      todaysHabitList[index][0] = _newHabitNameController.text;
    });
    // clear textfield
    _newHabitNameController.clear();
    Navigator.of(context).pop();
  }

  // delete habit
  void deleteHabit(int index) {
    setState(() {
      todaysHabitList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: ListView.builder(
        itemCount: todaysHabitList.length,
        itemBuilder: (context, index) {
          return HabitTile(
            habitName: todaysHabitList[index][0],
            habitCompleted: todaysHabitList[index][1],
            onChanged: (value) => checkBoxTapped(value, index),
            settingsTapped: (context) => openHabitSettings(index),
            deleteTapped: (context) => deleteHabit(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewHabit,
      ),
    );
  }


}
