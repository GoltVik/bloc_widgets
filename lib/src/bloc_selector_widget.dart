import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BlocSelectorWidget<B extends BlocBase<S>, S, V>
    extends StatelessWidget {
  const BlocSelectorWidget({super.key});

  V selector(B cubit, S state);

  void onMount(B bloc) {}

  B? bloc(BuildContext context) => null;

  @protected
  @override
  Widget build(BuildContext context) {
    final cubit = bloc(context) ?? context.read<B>();

    onMount(cubit);

    return BlocSelector<B, S, V>(
      bloc: cubit,
      selector: (state) => selector(cubit, state),
      builder: (context, selector) => buildWithState(context, cubit, selector),
    );
  }

  Widget buildWithState(BuildContext context, B bloc, V selector);
}
