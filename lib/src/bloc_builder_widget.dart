import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BlocBuilderWidget<B extends BlocBase<S>, S>
    extends StatelessWidget {
  const BlocBuilderWidget({super.key});

  bool buildWhen(S prev, S next) => true;

  void onMount(B bloc) {}

  B? bloc(BuildContext context) => null;

  @protected
  @override
  Widget build(BuildContext context) {
    final cubit = bloc(context) ?? context.read<B>();

    onMount(cubit);

    return BlocBuilder<B, S>(
      bloc: cubit,
      buildWhen: buildWhen,
      builder: (context, state) => buildWithState(context, cubit, state),
    );
  }

  Widget buildWithState(BuildContext context, B bloc, S state);
}
