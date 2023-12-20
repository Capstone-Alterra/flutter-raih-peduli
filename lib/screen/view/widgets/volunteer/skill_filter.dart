// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_detail_volunteer.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_signin.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:provider/provider.dart';

class SkillFilter extends StatefulWidget {
  const SkillFilter({super.key});

  @override
  _SkillFilterState createState() => _SkillFilterState();
}

class _SkillFilterState extends State<SkillFilter> {
  late DetailVolunteerViewModel viewModel;
  late SignInViewModel sp;

  @override
  void initState() {
    super.initState();
    viewModel = Provider.of<DetailVolunteerViewModel>(context, listen: false);
    // sp = Provider.of<SignInViewModel>(context, listen: false);
    // viewModel.fetchSkill(
    //   accessToken: sp.accessTokenSharedPreference,
    //   refreshToken:sp.refreshTokenSharedPreference,
    // );
  }

  Widget _buildFilterOption(String title, List<String> options) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
              color: AppTheme.primaryColor,
            ),
          ),
          const SizedBox(height: 4.0),
          Row(
            children: [
              Consumer<DetailVolunteerViewModel>(
                builder: (context, contactModel, child) {
                  return Expanded(
                    child: Wrap(
                      spacing: 8.0,
                      runSpacing: 4.0,
                      children: options.map((option) {
                        return ChoiceChip(
                          label: Text(option),
                          selected: viewModel.selectedSkills.contains(option),
                          onSelected: (bool selected) {
                            if (selected) {
                              viewModel.addSkill(option);
                            } else {
                              viewModel.removeSkill(option);
                            }
                          },
                          labelStyle: TextStyle(
                            color: viewModel.selectedSkills.contains(option)
                                ? AppTheme.primaryColor
                                : Colors.grey,
                          ),
                          backgroundColor: Colors.white,
                          selectedColor: AppTheme.primaryColor.withOpacity(0.2),
                          shape: StadiumBorder(
                            side: BorderSide(
                              color: viewModel.selectedSkills.contains(option)
                                  ? AppTheme.primaryColor
                                  : Colors.grey.withOpacity(0.5),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Skill Yang Dimiliki',
                    style: TextStyle(
                      color: AppTheme.primaryColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              _buildFilterOption(
                '',
                viewModel.listSKill!.data.map((datum) => datum.name).toList(),
              ), // Menggunakan listSkill dari viewModel
            ],
          ),
        ),
      ),
    );
  }
}

Future<String?> showSkillFilter(BuildContext context) async {
  return await showModalBottomSheet<String>(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
    ),
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          height: MediaQuery.of(context).size.height * 0.5,
          child: const SkillFilter(),
        ),
      );
    },
  );
}
