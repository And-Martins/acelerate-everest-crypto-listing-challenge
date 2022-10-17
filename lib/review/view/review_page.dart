import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../l10n/translation_file.dart';
import '../../shared/widgets/default_appbar.dart';
import '../widgets/review_body.dart';

class ReviewPage extends ConsumerWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: DefaultAppbar(
        title: TranslationFile.of(context)!.reviewTitle,
        titleSize: 22,
      ),
      body: const ReviewBody(),
    );
  }
}
