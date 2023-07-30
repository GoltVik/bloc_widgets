import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bloc_listener_widget.dart';
part 'bloc_builder_widget.dart';
part 'bloc_consumer_widget.dart';
part 'bloc_selector_widget.dart';

abstract class _BlocWidget extends Widget {
  const _BlocWidget({super.key});

  @protected
  Widget _build(BuildContext context);

  @override
  ComponentElement createElement() => _BlocWidgetElement(this);
}

class _BlocWidgetElement extends ComponentElement {
  _BlocWidgetElement(_BlocWidget super.widget);

  @override
  Widget build() => (widget as _BlocWidget)._build(this);

  @override
  void update(StatelessWidget newWidget) {
    super.update(newWidget);
    assert(widget == newWidget);
    rebuild(force: true);
  }
}
