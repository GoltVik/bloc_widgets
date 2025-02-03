part of 'bloc_widget.dart';

/// Widget implementation of the `BlocSelector` from the `flutter_bloc`.
abstract class BlocSelectorWidget<B extends BlocBase<S>, S, V>
    extends _BlocWidget {
  /// Main constructor for the `BlocSelectorWidget`.
  const BlocSelectorWidget({super.key});

  /// This method is used to get the selection from `state`.
  V selector(S state);

  /// Because this is StatelessWidget, you can't use `initState` method.
  /// You can use this method to perform side effects when the widget is created.
  void onMount(B bloc) {}

  /// This method is used to get the `Bloc` instance.
  B bloc(BuildContext context) => context.read<B>();

  /// Custom build method to build the widget with the `Bloc` and selected object from `state`.
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
