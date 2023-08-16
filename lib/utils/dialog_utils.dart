import 'package:flutter/material.dart';

class DialogUtils{


  static void showLoading(BuildContext context,String message){
    showDialog(context: context, builder: (buildContext){
      return AlertDialog(
        content: Row(
          children: [
            CircularProgressIndicator(),
            SizedBox(width: 12,),
            Text(message)
          ],
        ),
      );
    },
    barrierDismissible: false
    );
  }
  static void hideDialoge(BuildContext context){
    Navigator.pop(context);
  }
  static void showMessage(BuildContext context,
      String message,{String? posActionName,
      VoidCallback? posAction,
      String? negActionName,
        VoidCallback? negAction,
        bool dismissible = true
      }){
    List<Widget>actions = [];

    if(posActionName!=null){
      actions.add(
        TextButton(onPressed: (){
          Navigator.pop(context);
          posAction?.call();
        }, child: Text(posActionName))
      );
    }
    if(negActionName!=null){
      actions.add(
        TextButton(onPressed: (){
          Navigator.pop(context);
          negAction?.call();
        }, child: Text(negActionName))
      );
    }

    showDialog(context: context, builder: (buildContext){
      return AlertDialog(
        content: Text(message),
        actions: actions,
      );
    },barrierDismissible: dismissible);
  }
}