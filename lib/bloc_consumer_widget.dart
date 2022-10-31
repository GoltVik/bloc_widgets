library bloc_consumer_widget;

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BlocConsumerWidget<B extends BlocBase<S>, S>
    extends StatelessWidget {
  bool buildWhen(S prev, S next) => true;

  bool listenWhen(S prev, S next) => true;

  void listener(BuildContext context, B bloc, S state) {}

  void onMount(B bloc) {}

  B? bloc(BuildContext context) => null;

  const BlocConsumerWidget({super.key});

  @nonVirtual
  @override
  Widget build(BuildContext context) {
    final cubit = bloc(context) ?? context.read<B>();

    onMount(cubit);

    return BlocConsumer<B, S>(
      bloc: cubit,
      buildWhen: buildWhen,
      builder: (context, state) => buildWithState(context, cubit, state),
      listenWhen: listenWhen,
      listener: (context, state) => listener(context, cubit, state),
    );
  }

  Widget buildWithState(BuildContext context, B bloc, S state);
}
