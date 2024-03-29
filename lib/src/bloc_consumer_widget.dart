part of 'bloc_widget.dart';

abstract class BlocConsumerWidget<B extends BlocBase<S>, S>
    extends _BlocWidget {
  const BlocConsumerWidget({super.key});

  bool listenWhen(S prev, S next) => true;

  void listener(BuildContext context, B bloc, S state) {}

  bool buildWhen(S prev, S next) => true;

  void onMount(B bloc) {}

  B bloc(BuildContext context) => context.read<B>();

  Widget build(BuildContext context, B bloc, S state);

  @override
  Widget _build(BuildContext context) {
    final cubit = bloc(context);

    onMount(cubit);

    return BlocConsumer<B, S>(
      bloc: cubit,
      buildWhen: buildWhen,
      builder: (context, state) => build(context, cubit, state),
      listenWhen: listenWhen,
      listener: (context, state) => listener(context, cubit, state),
    );
  }
}
