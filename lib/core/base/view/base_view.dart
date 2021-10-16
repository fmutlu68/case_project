import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class BaseView<TViewModel extends Store> extends StatefulWidget {
  final Widget Function(BuildContext context, TViewModel model)
      onPageBuilder; // Sayfa Oluşturulurken Buradan Başlayacak
  final void Function(TViewModel model)
      onModelReady; // Sayfanın Init State Methodu
  final VoidCallback? onDispose; // Sayfa Kapanırken Kullanılacak
  final TViewModel viewModel; // ViewModel
  final Future<bool> Function()? onWillPop; // Sayfadan Pop Edilirken Çalışacak
  BaseView(
      {Key? key,
      required this.onPageBuilder,
      required this.onModelReady,
      this.onDispose,
      required this.viewModel,
      this.onWillPop})
      : super(key: key);

  @override
  _BaseViewState createState() => _BaseViewState<TViewModel>();
}

class _BaseViewState<TViewModel extends Store>
    extends State<BaseView<TViewModel>> {
  late TViewModel viewModel;
  @override
  void initState() {
    viewModel = widget.viewModel;
    widget.onModelReady(viewModel);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.onDispose != null) widget.onDispose!();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: widget.onPageBuilder(context, viewModel),
      onWillPop: widget.onWillPop,
    );
  }
}
