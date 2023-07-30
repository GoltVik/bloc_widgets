part of 'bloc_widget.dart';

abstract class BlocSelectorWidget<B extends BlocBase<S>, S, V>
    extends _BlocWidget {
  const BlocSelectorWidget({super.key});

  V selector(S state);

  void onMount(B bloc) {}

  B bloc(BuildContext context) => context.read<B>();

  Widget build(BuildContext context, B bloc, V selector);

  @override
  Widget _build(BuildContext context) {
    final cubit = bloc(context);

    onMount(cubit);

    return BlocSelector<B, S, V>(
      bloc: cubit,
      selector: selector,
      builder: (context, value) => build(context, cubit, value),
    );
  }
}
