part of './part_of_learn.dart';

class _PartOfAppbar extends StatelessWidget implements PreferredSizeWidget {
  const _PartOfAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Part of Learn', style: context.partOfLearn.titleLarge),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
