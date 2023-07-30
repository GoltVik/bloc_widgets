# BlocWidgets

[![pub package](https://img.shields.io/pub/v/bloc_widgets.svg)](https://pub.dev/packages/bloc_widgets)

`bloc_widgets` is a Flutter package that provides an alternative to the `ConsumerWidget` from the `riverpod` package specifically designed for the `flutter_bloc` package.  
It simplifies the integration of blocs and widgets by extending StatelessWidget, overriding build method and providing `buildWithBloc` instead, which should be using to build widget for given state.

`BlocConsumerWidget` additionally provides `listenWhen`,`buildWhen`,`listen` methods which `BlocConsumer` is using.    
`BlocBuilderWidget` additionally provides `buildWhen` method which `BlocBuilder` is using.  
`BlocListenerWidget` additionally provides `listenWhen` method which `BlocListener` is using.  
`SelectorWidget` additionally provides `selector` method which `BlocSelector` is using .

Those widgets support `Bloc` and `Cubit` as well.

## Features

- Wrapping `BlocConsumer` functionality into `BlocConsumerWidget`
- Wrapping `BlocBuilder` functionality into `BlocBuilderWidget`
- Wrapping `BlocListener` functionality into `BlocListenerWidget`
- Wrapping `BlocSelector` functionality into `BlocSelectorWidget`

## Installation

Add `bloc_widgets` as a dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  bloc_widgets: ^1.0.1
```


## Contributing

Contributions to `bloc_widgets` are welcome! If you find a bug or want to suggest an improvement, please create an issue or submit a pull request on the GitHub repository.

## License

`bloc_widgets` package is released under the MIT License. See the LICENSE file for more details.

