import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import 'matches/set_type.dart';
import 'matches/create_match_command.dart';

class CreateMatchForm extends StatefulWidget {
  const CreateMatchForm({super.key, required this.onSubmit});

  final void Function(CreateMatchCommand data) onSubmit;

  @override
  CreateMatchFormState createState() {
    return CreateMatchFormState();
  }
}

class CreateMatchFormState extends State<CreateMatchForm> {
  final _formKey = GlobalKey<FormState>();

  // todo: extract into dto which can be serialized to json for request
  String _playerOneName = "";
  String _playerTwoName = "";
  String _servingFirst = "";
  int _sets = 0;
  SetType _setType = SetType.sixAllAdvantageRule;
  SetType _finalSetType = SetType.sixAllAdvantageRule;

  String name() {
    var names = ['John Smith', 'Mary Jones', 'Harry Taylor', 'Emily Brown'];
    return names[Random().nextInt(names.length)];
  }

  final setTypeDropdownTextMap = {
    SetType.sixAllAdvantageRule: 'Six All Advantage Rule',
    SetType.sixAllTwelvePointTiebreaker: 'Six All Twelve Point Tiebreaker',
    SetType.wimbledonFinalSet: 'Wimbledon Final Set',
    SetType.superTiebreaker: 'Super Tiebreaker',
  };

  // todo: call create match api and hand off to scoring widget passing match id

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          // Todo: refactor into PlayerNameFormField
          TextFormField(
            decoration: InputDecoration(
              icon: const Icon(Icons.person),
              hintText: name(),
              labelText: 'Player one name',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'The name cannot be empty';
              }
              if (value.length < 2) {
                return 'The name must have at least two characters';
              }
              return null;
            },
            onChanged: (String value) {
              // setState so the serving first dropdown is updated
              setState(() {
                _playerOneName = value;
              });
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              icon: const Icon(Icons.person),
              hintText: name(),
              labelText: 'Player two name',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'The name cannot be empty';
              }
              if (value.length < 2) {
                return 'The name must have at least two characters';
              }
              return null;
            },
            onChanged: (String value) {
              // setState so the serving first dropdown is updated
              setState(() {
                _playerTwoName = value;
              });
            },
          ),
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
                icon: Icon(Icons.air), labelText: 'Serving first'),
            items: <DropdownMenuItem<String>>[
              DropdownMenuItem<String>(
                value: _playerOneName,
                child:
                    Text(_playerOneName == "" ? "Player One" : _playerOneName),
              ),
              DropdownMenuItem<String>(
                value: _playerTwoName,
                child:
                    Text(_playerTwoName == "" ? "Player Two" : _playerTwoName),
              ),
            ],
            onChanged: (value) {
              _servingFirst = value!;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.account_box),
              hintText: '3',
              labelText: 'Sets',
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            validator: (value) {
              if (value == null || value == "") {
                return 'Sets cannot be empty';
              }
              if (int.parse(value).isEven) {
                return 'Sets must be odd';
              }
              if (int.parse(value) > 5) {
                return 'Sets must be less than or equal to five';
              }
              if (int.parse(value) < 1) {
                return 'Sets must be at least one';
              }
              return null;
            },
            onChanged: (value) {
              // setState so the set type field can be shown/hidden
              setState(() {
                _sets = int.tryParse(value) ?? 0;
              });
            },
          ),
          if (_sets > 1)
            DropdownButtonFormField<SetType>(
              decoration: const InputDecoration(
                  icon: Icon(Icons.air), labelText: 'Set type'),
              items: SetType.values
                  .map((SetType setType) => DropdownMenuItem<SetType>(
                      value: setType,
                      child: Text(setTypeDropdownTextMap[setType]!)))
                  .toList(),
              onChanged: (value) {
                _setType = value!;
              },
            ),
          DropdownButtonFormField<SetType>(
            decoration: const InputDecoration(
                icon: Icon(Icons.air), labelText: 'Final set type'),
            items: SetType.values
                .map((SetType setType) => DropdownMenuItem<SetType>(
                    value: setType,
                    child: Text(setTypeDropdownTextMap[setType]!)))
                .toList(),
            onChanged: (value) {
              _finalSetType = value!;
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Show snack bar while making api request
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Creating the match...')),
                );

                // Create form data object
                var data = CreateMatchCommand(
                  [_playerOneName, _playerTwoName],
                  _servingFirst,
                  _sets,
                  _setType,
                  _finalSetType,
                );

                // Call onSubmit callback with the form data
                widget.onSubmit(data);

                // reset fields?
              }
              // Validate will highlight bad fields
              // Snack bar saying check update fields
            },
            child: const Text('Start'),
          ),
        ],
      ),
    );
  }
}
