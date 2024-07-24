import 'package:flutter/material.dart';

class ScoreboardRow extends StatelessWidget {
  final String name;
  final bool serving;
  final String sets;
  final String games;
  final String points;


  const ScoreboardRow({
    Key? key,
    required this.name,
    required this.serving,
    required this.sets,
    required this.games,
    required this.points,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 12, bottom: 7, top: 7),
                  // todo: ellipses if name too long
                  child: Text(
                    name,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 18,
                    ),
                  ),
                ),
                // Serving indicator
                Container(
                  padding: const EdgeInsets.only(right: 12),
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color:
                      serving ? Theme.of(context).colorScheme.primary : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Sets
          Container(
            alignment: Alignment.center,
            width: 30,
            color: Theme.of(context).colorScheme.primary.withOpacity(0.75),
            child: Text(
              sets.toString(),
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                // fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          // Games
          Container(
            alignment: Alignment.center,
            width: 30,
            color: Theme.of(context).colorScheme.primary,
            child: Text(
              games.toString(),
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                // fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          // Points
          Container(
            alignment: Alignment.center,
            width: 50,
            child: Text(
              points,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}