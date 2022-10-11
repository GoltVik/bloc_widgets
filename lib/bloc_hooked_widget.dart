library bloc_hooked_widget;

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';

abstract class BlocHookedWidget<B extends BlocBase<S>, S> extends HookWidget {
  final bool _closeOnDispose;
  final List<dynamic> _keys;
  final _mountListener = ValueNotifier(false);
  late final B? _bloc;

  bool buildWhen(S state) => true;

  bool listenWhen(S state) => true;

  void listener(B bloc, S state, BuildContext context) {}

  void onMount(B bloc) {}

  B? bloc(BuildContext context) => null;

  BlocHookedWidget({
    super.key,
    bool closeOnDispose = false,
    List<dynamic> keys = const <dynamic>[],
  })  : _closeOnDispose = closeOnDispose,
        _keys = keys;

  @nonVirtual
  @override
  Widget build(BuildContext context) {
    if (!_mountListener.value) {
      _mountListener.value = true;
      _bloc = bloc(context);
      onMount(_bloc ?? context.read<B>());
    }

    final cubit =
        _bloc ?? useBloc<B>(closeOnDispose: _closeOnDispose, keys: _keys);

    useBlocListener<B, S>(cubit, listener, listenWhen: listenWhen);

    final state = useBlocBuilder<B, S>(cubit, buildWhen: buildWhen);

    return buildWithState(context, cubit, state);
  }

  Widget buildWithState(BuildContext context, B bloc, S state);
}
