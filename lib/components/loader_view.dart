import 'package:flutter/cupertino.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';


void showLoader(BuildContext context) {
  if (!Loader.isShown) {
    Loader.show(context, progressIndicator: _refreshWidget());
  }
}

void hideLoader() {
  if (Loader.isShown) {
    Loader.hide();
  }
}

Widget _refreshWidget() {
  return Image.asset(
    'assets/gif/loader_anim.gif',
    width: 150,
    fit: BoxFit.contain,
  );
}
