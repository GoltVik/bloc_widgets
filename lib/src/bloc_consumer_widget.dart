part of 'bloc_widget.dart';

/// Widget implementation of the `BlocConsumer` from the `flutter_bloc`.
/// use this widget to listen to the changes of the `Bloc` and rebuild the widget.
/// and also to perform side effects when the state changes.
abstract class BlocConsumerWidget<B extends BlocBase<S>, S>
    extends _BlocWidget {
  /// Main constructor for the `BlocConsumerWidget`.
  const BlocConsumerWidget({super.key});

  /// This method is called when the state changes.
  /// if it returns `true`, the widget listener will be called.
  bool listenWhen(S prev, S next) => true;

  /// This method is called when the state changes.
  void listener(BuildContext context, B bloc, S state) {}

  /// This method is called when the state changes.
  /// if it returns `true`, the widget will be rebuilt.
  bool buildWhen(S prev, S next) => true;

  /// Because this is StatelessWidget, you can't use `initState` method.
  /// You can use this method to perform side effects when the widget is created.
  void onMount(B bloc) {}

  /// This method is used to get the `Bloc` instance.
  B bloc(BuildContext context) => context.read<B>();

  /// Custom build method to build the widget with the `Bloc` and the `state`.
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
