import 'package:demo_app_food_30102022/common/bases/base_bloc.dart';
import 'package:demo_app_food_30102022/common/bases/base_event.dart';
import 'package:flutter/cupertino.dart';

import 'package:provider/provider.dart';

class ProgressListenerWidget<T extends BaseBloc> extends StatefulWidget {
  final Widget child;
  final Function(BaseEvent event) callback;

  const ProgressListenerWidget({required this.child, required this.callback});

  @override
  _ProgressListenerWidgetState createState() =>
      _ProgressListenerWidgetState<T>();
}

class _ProgressListenerWidgetState<T> extends State<ProgressListenerWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    var bloc = context.read<T>() as BaseBloc;
    bloc.progressStream.listen(
      (event) {
        widget.callback(event);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<BaseEvent?>(
      create: (_) => (context.read<T>() as BaseBloc).progressStream,
      initialData: null,
      updateShouldNotify: (prev, current) {
        return true;
      },
      child: Consumer<BaseEvent?>(
        builder: (context, event, child) {
          return Container(
            child: widget.child,
          );
        },
      ),
    );
  }
}
