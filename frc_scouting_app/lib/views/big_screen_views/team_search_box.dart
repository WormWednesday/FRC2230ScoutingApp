import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:frc_scouting_app/misc/constants.dart';
import 'package:frc_scouting_app/misc/teams_list.dart';
import 'package:frc_scouting_app/views/big_screen_views/teams_info/quick_team_data.dart';


// ignore: use_key_in_widget_constructors
class TeamSearchBox extends StatelessWidget{

  final teamsSearch = teams;
  TeamSearchBox({
    required this.page
  });
  final PageController page;

  @override
  Widget build(BuildContext context) {
    return TypeAheadField<TeamCard?>(
      debounceDuration: const Duration(milliseconds: 500),
      textFieldConfiguration: const TextFieldConfiguration(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(),
          hintText: 'Search Team',
          fillColor: secondaryColor
        )
      ),
      suggestionsCallback: (final String pattern) => teamsSearch.where(
        (final TeamCard element) {
          if(pattern.toString().startsWith(RegExp(r'[1-9]'))){
            return element.num.toString().startsWith(pattern);
          } 
          return element.name.startsWith(pattern);
          }, 
      ).toList()..sort(
        (final TeamCard a, final TeamCard b) => a.num.compareTo(b.num),
      ),

       itemBuilder: (final BuildContext context, final TeamCard? suggestions) {
        final teamsSearch = suggestions!;

        return ListTile(
          title: Text('${teamsSearch.num} ${teamsSearch.name}')
        );
      }, 

       noItemsFoundBuilder: (final BuildContext context) => Container(
        height: 60,
        child: const Center(
          child: Text(
            "No Teams Found",
            style: TextStyle(fontSize: 16),
          ),
        ),
      ), 
      onSuggestionSelected: (final TeamCard? suggestions) {
        Navigator.push(context,
        MaterialPageRoute(builder: (context) => QuickTeamData(teamNum: suggestions!.num.toString()
        )));},
    );      
  }

}