import 'package:flutter/material.dart';
import 'package:video_player_app/screens/home.dart';
import 'package:video_player_app/widgets/age_picker.dart';
import 'package:video_player_app/widgets/circle_pickimage.dart';
import 'package:video_player_app/widgets/gender_picker.dart';
import 'package:video_player_app/widgets/text_input.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Create your account',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
        ),
        body: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.onPrimary.withOpacity(0.1),
                  Colors.black,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )),
            ),
            Positioned(
                left: 0,
                right: 0,
                top: 0,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    ImagePickerWidget(),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextInputWidget(
                        controller: _usernameController,
                        hintText: 'your name',
                        icon: Icons.person,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: AgePicker(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: GenderPicker(),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SizedBox(
                        width: size.width,
                        child: OutlinedButton(
                            onPressed: () {
                              saveData();
                            },
                            child: Text(
                              'save',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                            )),
                      ),
                    ),
                  ],
                ))
          ],
        ));
  }
  
  void saveData() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => HomeScreen(),
    ));
  }
}
