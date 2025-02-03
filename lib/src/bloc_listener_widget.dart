part of 'bloc_widget.dart';

/// Widget implementation of the `BlocListener` from the `flutter_bloc`.
/// use this widget to listen to the changes of the `Bloc` and perform side effects when the state changes.
abstract class BlocListenerWidget<B extends BlocBase<S>, S>
    extends _BlocWidget {
  /// Main constructor for the `BlocListenerWidget`.
  const BlocListenerWidget({super.key});

  /// This method is called when the state changes.
  /// if it returns `true`, the widget listener will be called.
  bool listenWhen(S prev, S next) => true;

  /// This method is called when the state changes.
  void listener(BuildContext context, B bloc, S state) {}

  /// Because this is StatelessWidget, you can't use `initState` method.
  /// You can use this method to perform side effects when the widget is created.
  void onMount(B bloc) {}

  /// This method is used to get the `Bloc` instance.
  B bloc(BuildContext context) => context.read<B>();

  /// Custom build method to build the widget with the `Bloc`.
  /// Because this is `BlocListener`, you can't access the `state`.
  /// And widget represents static content.
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
