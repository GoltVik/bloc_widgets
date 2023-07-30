part of 'bloc_widget.dart';

abstract class BlocBuilderWidget<B extends BlocBase<S>, S> extends _BlocWidget {
  const BlocBuilderWidget({super.key});

  bool buildWhen(S prev, S next) => true;

  void onMount(B bloc) {}

  B bloc(BuildContext context) => context.read<B>();

  Widget build(BuildContext context, B bloc, S state);

  @override
  Widget _build(BuildContext context) {
    final cubit = bloc(context);

    onMount(cubit);

    return BlocBuilder<B, S>(
      bloc: cubit,
      buildWhen: buildWhen,
      builder: (context, state) => build(context, cubit, state),
    );
  }
}
