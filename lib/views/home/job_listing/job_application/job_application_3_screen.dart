import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../util/theme/icons.dart';
import '../../../../util/theme/dimens.dart';
import '../../../../widgets/input/filled_button.dart';
import '../../../../widgets/image/step_indicator.dart';
import '../../../../widgets/input/dynamic_text_field.dart';
import '../../../../widgets/input/search_add_item_chip.dart';
import '../../../../widgets/input/text_field.dart';
import '../../../../widgets/item/file_item.dart';
import '../../../../widgets/item/group_header.dart';
import '../../../../widgets/navigation/top_bar.dart';
import '../../../../../model/job.dart';
import '../../../../../model/data/job_model_data.dart';
import '../../../../../model/data/user_model_data.dart';

class JobApplicationSheet3 extends StatefulWidget {
  // -- Props --
  final Job job;

  const JobApplicationSheet3({super.key, required this.job});

  @override
  State<JobApplicationSheet3> createState() => _JobApplicationSheet3State();
}

class _JobApplicationSheet3State extends State<JobApplicationSheet3> {
  // -- States --
  final _fullNameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _mobileNumberTextController = TextEditingController();
  final _additionalSkillsTextController = TextEditingController();

  bool _isContactInfoEditing = false;
  bool _isEmploymentInfoEditing = false;

  UserModelData? userModelData;

  // -- Lifecycle --
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      userModelData = Provider.of<UserModelData>(context, listen: false);
      setState(() {
        _fullNameTextController.text = userModelData?.fullName ?? '';
        _emailTextController.text = userModelData?.emailAddress ?? '';
        _mobileNumberTextController.text = userModelData?.mobileNumber ?? '';
      });
    });
  }

  // -- Actions --
  void _onTapBack(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _onTapSubmit(BuildContext context) {
    final modelData = Provider.of<UserModelData>(context, listen: false);
    modelData.applyJob(widget.job, onDone: () {
      Navigator.of(context).popUntil((route) => route.isFirst);
    });
  }

  void onTapEditContactInfo() {
    setState(() {
      _isContactInfoEditing = !_isContactInfoEditing;
    });
  }

  void onTapEditEmploymentInfo() {
    setState(() {
      _isEmploymentInfoEditing = !_isEmploymentInfoEditing;
    });
  }

  // -- UI --
  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).padding.bottom;
    final jobModelData = Provider.of<JobModelData>(context);

    return Scaffold(
      appBar: TopBar(
        dimissIcon: AppIcons.chevronLeft,
        onTapBack: () => _onTapBack(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        margin: const EdgeInsets.only(bottom: Dimensions.bottomPadding),
        alignment: AlignmentDirectional.bottomCenter,
        width: double.infinity,
        height: 58,
        child: MyFilledButton(
          title: 'Submit',
          onTap: () => _onTapSubmit(context),
        ),
      ),
      body: Container(
        color: Theme.of(context).colorScheme.background,
        margin: EdgeInsets.only(
            bottom: 58 + bottomInset + Dimensions.bottomPadding),
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 18, right: 18),
          child: Column(
            children: [
              const SizedBox(height: 8),
              Container(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  'Apply to ${widget.job.companyName}',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              const SizedBox(height: 18),
              const StepIndicator(step: JobApplicationSteps.reviewInfo),
              const SizedBox(height: 24),
              GroupHeader(
                title: 'Contact Info',
                onTapEdit: onTapEditContactInfo,
              ),
              const SizedBox(height: 18),
              CircleAvatar(
                radius: 48,
                backgroundImage: AssetImage(AppImages.face.path),
              ),
              const SizedBox(height: 12),
              DynamicTextField(
                isEditing: _isContactInfoEditing,
                props: MyTextFieldProps(
                  title: 'Full Name',
                  placeholder: 'Enter Full Name',
                  controller: _fullNameTextController,
                ),
              ),
              const SizedBox(height: 10),
              DynamicTextField(
                isEditing: _isContactInfoEditing,
                props: MyTextFieldProps(
                  title: 'Email',
                  placeholder: 'Enter Email',
                  controller: _emailTextController,
                ),
              ),
              const SizedBox(height: 10),
              DynamicTextField(
                isEditing: _isContactInfoEditing,
                props: MyTextFieldProps(
                  title: 'Mobile Number',
                  placeholder: 'Enter Mobile Number',
                  controller: _mobileNumberTextController,
                ),
              ),
              const SizedBox(height: 14),
              const Divider(),
              const SizedBox(height: 14),
              GroupHeader(
                title: 'Employment Information',
                onTapEdit: onTapEditEmploymentInfo,
              ),
              const SizedBox(height: 12),
              if (userModelData?.selectedResume != null)
                FileItem(
                  title: 'Resume',
                  fileDocument: userModelData!.selectedResume!,
                  isEditing: _isEmploymentInfoEditing,
                ),
              const SizedBox(height: 10),
              if (userModelData?.selectedCoverLetter != null)
                FileItem(
                  title: 'Cover Letter',
                  fileDocument: userModelData!.selectedCoverLetter!,
                  isEditing: _isEmploymentInfoEditing,
                ),
              const SizedBox(height: 10),
              SearchAddItem(
                title: 'Additional Skills',
                props: MyTextFieldProps(
                  placeholder: 'Add Skill',
                  controller: _additionalSkillsTextController,
                ),
                isEditing: false,
                skills: jobModelData.skills,
                onTapRemove: (skill) => {}, // jobModelData.removeSkill(skill),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
