import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_detail_volunteer.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:provider/provider.dart';

class SkillFilter extends StatefulWidget {
  @override
  _SkillFilterState createState() => _SkillFilterState();
}

class _SkillFilterState extends State<SkillFilter> {
  late DetailVolunteerViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = DetailVolunteerViewModel();
  }

  Widget _buildFilterOption(String title, List<String> options) {
  return Consumer<DetailVolunteerViewModel>(
    builder: (context, viewModel, child) {
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
                Expanded(
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
                ),
              ],
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      );
    },
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
                  const Padding(
                    padding: EdgeInsets.only(left: 90),
                    child: Text(
                      'Skill Yang Dimiliki',
                      style: TextStyle(
                        color: AppTheme.primaryColor,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                      _viewModel.clearSelectedSkills();
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              _buildFilterOption('', [
                'Pendidikan',
                'Teknologi',
                'Kesehatan',
                'Komunikasi',
                'Memasak',
                'Nguli',
                'Mutant'
              ]),
              Visibility(
                visible: _viewModel.selectedSkills.isNotEmpty,
                child: Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(
                          context, _viewModel.selectedSkills.join(', '));
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 100.0),
                      backgroundColor: AppTheme.primaryColor,
                    ),
                    child: const Text('Simpan'),
                  ),
                ),
              ),
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
          child: SkillFilter(),
        ),
      );
    },
  );
}
