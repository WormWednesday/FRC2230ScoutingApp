import 'package:flutter/material.dart';


class TeamCard{

  TeamCard({
    required this.num,
    required this.name,
    required this.color
  });

  final int num;
  final String name;
  final Color color;

}

final List<TeamCard> teams = <TeamCard>[
  TeamCard(num: 1574, name: 'MisCar', color: const Color.fromARGB(255, 167, 133, 133)),
  TeamCard(num: 1576, name: 'Voltrix', color: const Color.fromARGB(255, 185, 159, 12)),
  TeamCard(num: 1577, name: 'Steampunk', color: Color.fromARGB(255, 218, 134, 9)),
  TeamCard(num: 1580, name: 'TheBlueMonkeys', color: const Color.fromARGB(255, 12, 148, 172)),
  TeamCard(num: 1657, name: 'Hamosad', color: const Color.fromARGB(255, 8, 107, 5)),
  TeamCard(num: 1690, name: 'Orbit', color: const Color.fromARGB(255, 24, 5, 107)),
  TeamCard(num: 1937, name: 'Elysium', color: const Color.fromARGB(255, 12, 73, 92)),
  TeamCard(num: 1942, name: 'Cinderella Tel-Nof', color: const Color.fromARGB(255, 228, 240, 153)),
  TeamCard(num: 1943, name: 'Neat Team', color: const Color.fromARGB(255, 122, 128, 90)),
  TeamCard(num: 1954, name: 'ElectroBunny', color: const Color.fromARGB(255, 39, 41, 48)),
  TeamCard(num: 2096, name: 'RoboActive', color: const Color.fromARGB(255, 198, 218, 18)),
  TeamCard(num: 2212, name: 'The Spikes', color: const Color.fromARGB(255, 18, 121, 218)),
  TeamCard(num: 2230, name: 'General Angels', color: const Color.fromARGB(255, 26, 11, 165)),
  TeamCard(num: 2231, name: 'OnyxTronix', color: const Color.fromARGB(255, 214, 204, 204)),
  TeamCard(num: 2630, name: 'Thunderbolts', color: const Color.fromARGB(255, 83, 73, 73)),
  TeamCard(num: 3065, name: 'Jatt', color: const Color.fromARGB(255, 255, 174, 0)),
  TeamCard(num: 3075, name: 'Ha-Dream Team', color: const Color.fromARGB(255, 152, 11, 165)),
  TeamCard(num: 3083, name: 'Artemis', color: const Color.fromARGB(255, 112, 108, 170)),
  TeamCard(num: 3211, name: 'The Y Team', color: const Color.fromARGB(255, 118, 227, 247)),
  TeamCard(num: 3316, name: 'D-Bug', color: const Color.fromARGB(255, 168, 112, 39)),
  TeamCard(num: 3339, name: 'BumbleB', color: const Color.fromARGB(255, 255, 217, 0)),
  TeamCard(num: 3388, name: 'Flash', color: const Color.fromARGB(255, 243, 23, 8)),
  TeamCard(num: 3835, name: 'Vulcan', color: const Color.fromARGB(255, 89, 117, 133)),
  TeamCard(num: 4319, name: 'Ladies FIRST', color: const Color.fromARGB(255, 238, 26, 149)),
  TeamCard(num: 4320, name: 'The Joker', color: const Color.fromARGB(255, 168, 15, 15)),
  TeamCard(num: 4338, name: 'Falcons', color: const Color.fromARGB(255, 226, 41, 9)),
  TeamCard(num: 4416, name: 'Skynet', color: const Color.fromARGB(255, 49, 95, 109)),
  TeamCard(num: 4586, name: 'PRIMO', color: const Color.fromARGB(255, 97, 137, 223)),
  TeamCard(num: 4590, name: 'GreenBlitz', color: const Color.fromARGB(255, 41, 167, 25)),
  TeamCard(num: 4661, name: 'The Red Piartes', color: const Color.fromARGB(255, 107, 5, 5)),
  TeamCard(num: 4744, name: 'Ninjas', color: const Color.fromARGB(255, 22, 37, 5)),
  TeamCard(num: 5135, name: 'Black Unicorns', color: const Color.fromARGB(255, 32, 32, 32)),
  TeamCard(num: 5291, name: 'Emperius', color: const Color.fromARGB(255, 124, 88, 12)),
  TeamCard(num: 5554, name: 'The Poros', color: const Color.fromARGB(255, 104, 127, 145)),
  TeamCard(num: 5614, name: 'Team Sycamore', color: const Color.fromARGB(255, 19, 151, 7)),
  TeamCard(num: 5635, name: 'Damacia', color: const Color.fromARGB(255, 78, 4, 67)),
  TeamCard(num: 5654, name: 'Phoenix', color: const Color.fromARGB(255, 255, 187, 0)),
  TeamCard(num: 5715, name: 'DRC', color: const Color.fromARGB(255, 88, 65, 190)),
  TeamCard(num: 5928, name: 'MetalBoost', color: const Color.fromARGB(255, 57, 62, 66)),
  TeamCard(num: 5951, name: 'Makers Assemble', color: const Color.fromARGB(255, 214, 74, 74)),
  TeamCard(num: 5987, name: 'Galaxia', color: const Color.fromARGB(255, 18, 109, 97)),
  TeamCard(num: 5990, name: 'TRIGON', color: const Color.fromARGB(255, 189, 37, 37)),
  TeamCard(num: 6104, name: 'Desert Eagles', color: const Color.fromARGB(255, 102, 52, 12)),
  TeamCard(num: 6168, name: 'Alzahrawi', color: const Color.fromARGB(255, 116, 102, 26)),
  TeamCard(num: 6230, name: 'Team Koi', color: const Color.fromARGB(255, 182, 104, 192)),
  TeamCard(num: 6738, name: 'Excalibur', color: const Color.fromARGB(255, 199, 202, 26)),
  TeamCard(num: 6740, name: 'Glue Gun & Glitter', color: const Color.fromARGB(255, 231, 7, 130)),
  TeamCard(num: 6741, name: 'Space Monkeys', color: const Color.fromARGB(255, 52, 57, 65)),
  TeamCard(num: 7039, name: 'X O', color: const Color.fromARGB(255, 219, 31, 62)),
  TeamCard(num: 7067, name: 'Team Streak', color: const Color.fromARGB(255, 248, 134, 58)),
  TeamCard(num: 7112, name: 'EverGreen', color: const Color.fromARGB(255, 51, 194, 82)),
  TeamCard(num: 7177, name: 'Amal Tayibe', color: const Color.fromARGB(255, 130, 156, 97)),
  TeamCard(num: 7845, name: '8BIT', color: const Color.fromARGB(255, 160, 147, 161)),
  TeamCard(num: 8175, name: 'Piece of Mind', color: const Color.fromARGB(255, 161, 53, 168)),
  TeamCard(num: 8223, name: 'Mariners', color: const Color.fromARGB(255, 133, 100, 36)),
  TeamCard(num: 8843, name: 'Amal Space', color: const Color.fromARGB(255, 33, 25, 46)),
];
