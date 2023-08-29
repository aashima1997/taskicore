import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

errordialog(dialogContext, String title, String description) {
  var alertStyle = const AlertStyle(
    animationType: AnimationType.grow,
    overlayColor: Colors.black87,
    isCloseButton: true,
    isOverlayTapDismiss: true,
    titleStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
    descStyle:
    TextStyle(color: Colors.red, fontWeight: FontWeight.w500, fontSize: 16),
    animationDuration: Duration(milliseconds: 400),
  );

  Alert(
      context: dialogContext,
      style: alertStyle,
      title: title,
      desc: description,
      buttons: [
        DialogButton(
          onPressed: () {
            Navigator.pop(dialogContext);
          },
          color: Colors.blue,
          child: const Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        )
      ]).show();
}
class TryAgainButton extends StatelessWidget {
  const TryAgainButton({Key? key, this.onPressed}) : super(key: key);
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: [
            Lottie.asset("images/coffeeLoading.json", width: 400,height: 300),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.red),
                onPressed: onPressed,
                child: const Text("Try Again")),
          ],
        ));
  }
}
Future<bool> onBackPressed(BuildContext context, ) async {
  return (await Alert(
    context: context,
    type: AlertType.warning,
    title:"Cancel",
    desc:
    "Are you sure want to cancel?",
    buttons: [
      DialogButton(
        onPressed:() {
          Navigator.pop(context);
          Navigator.pop(context);
        },
        width: 120,
        child: const Text(
          "Yes",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      DialogButton(
        onPressed: () {
          Navigator.pop(context);
        },
        width: 120,
        child: const Text(
          "No",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      )
    ],
  ).show()) ??
      false;
}