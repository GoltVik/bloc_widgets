part of 'bloc_widget.dart';

abstract class BlocListenerWidget<B extends BlocBase<S>, S>
    extends _BlocWidget {
  const BlocListenerWidget({super.key});

  bool listenWhen(S prev, S next) => true;

  void listener(BuildContext context, B bloc, S state) {}

  void onMount(B bloc) {}

  B bloc(BuildContext context) => context.read<B>();

  Widget build(BuildContext context, B bloc);

  @override
  Widget _build(BuildContext context) {
    final cubit = bloc(context);

    onMount(cubit);

    return BlocListener<B, S>(
      bloc: cubit,
      listenWhen: listenWhen,
      listener: (context, state) => listener(context, cubit, state),
      child: build(context, cubit),
    );
  }
}
