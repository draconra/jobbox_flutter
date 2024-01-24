import 'package:flutter/material.dart';

import '../../../util/theme/icons.dart';
import '../image/icon_image.dart';
import '../input/text_field.dart';
import '../../../model/skill.dart';

class SearchAddItem extends StatelessWidget {
  // -- Props --
  final MyTextFieldProps props;
  final String? title;
  final List<Skill> skills;
  final bool isEditing;
  final Function(Skill) onTapRemove;

  const SearchAddItem({
    super.key,
    required this.props,
    this.title,
    required this.isEditing,
    required this.skills,
    required this.onTapRemove,
  });

  // -- UI --
  Widget _chip(
    BuildContext context,
    Skill skill,
    bool isEditing,
    Function(Skill) onTapRemove,
  ) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        highlightColor: Colors.white.withOpacity(0.1),
        splashColor: Colors.transparent,
        onTap: () => onTapRemove(skill),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Ink(
            padding: EdgeInsets.symmetric(horizontal: isEditing ? 14 : 18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: isEditing
                  ? Theme.of(context).colorScheme.secondary
                  : Colors.transparent,
              border: Border.all(
                width: isEditing ? 0 : 1,
                color: isEditing
                    ? Colors.transparent
                    : Theme.of(context).colorScheme.onBackground,
              ),
            ),
            child: Row(
              children: [
                if (isEditing)
                  Row(
                    children: [
                      MyIcon(
                        icon: AppIcons.xmark,
                        length: 16,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                Text(
                  skill.name,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: isEditing
                            ? Colors.white
                            : Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!isEditing) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title!,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(height: 6),
              ],
            ),
          Container(
            height: 44,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                final skill = skills[index];
                return _chip(
                  context,
                  skill,
                  false,
                  (_) => onTapRemove(skill),
                );
              },
              itemCount: skills.length,
            ),
          ),
        ],
      );
    } else {
      return Stack(
        alignment: AlignmentDirectional.center,
        children: [
          MyTextField(
            props: MyTextFieldProps(
              placeholder: props.placeholder,
              isOutlined: true,
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 11),
                child: MyIcon(
                  icon: AppIcons.magnifyingGlass,
                  length: 10,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              controller: props.controller,
            ),
          ),
          Positioned.fill(
            top: 4,
            bottom: 4,
            left: 42,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                final skill = skills[index];
                return _chip(
                  context,
                  skill,
                  true,
                  (_) => onTapRemove(skill),
                );
              },
              itemCount: skills.length,
            ),
          ),
        ],
      );
    }
  }
}
