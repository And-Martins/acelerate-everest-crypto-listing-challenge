import 'package:crypto_listing/cripto_details/controller/providers.dart';
import 'package:crypto_listing/shared/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DetailScreenProvidersTest extends ConsumerWidget {
  const DetailScreenProvidersTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(getDetailEndpointProvider);
    ref.watch(getDetailRepoProvider);
    ref.watch(getDetailUsecaseProvider);
    ref.watch(dioProvider);
    return const SizedBox();
  }
}
