import 'package:domining_app/shared/widgets/items/widgets.dart';
import 'package:domining_app/shared/widgets/resources/styles.dart';
import 'package:flutter/material.dart';

class BaseLayout extends StatefulWidget {
  final Widget? leading, fields;  final String? title, dis;

  const BaseLayout({super.key, this.fields, this.title, this.dis, this.leading});

  @override
  State<BaseLayout> createState() => _BaseLayoutState();
}

class _BaseLayoutState extends State<BaseLayout> {
  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Are you sure?'),
            content: const Text('Do you want to exit an App'),
            actions: <Widget>[
              TextButton(
                onPressed: () =>
                    Navigator.of(context).pop(false), //<-- SEE HERE
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () =>
                    Navigator.of(context).pop(true), // <-- SEE HERE
                child: const Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) {
          return;
        }
        await _onWillPop();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: widget.leading,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
                  // page header
               widget.title != null ?
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        widget.title!,
                        style: AppStyles.large(),
                      ),
                    ],
                  ),
                  freev(v: 5),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      child: Text(
                        widget.dis!,
                        style: AppStyles.light(),
                      ),
                    ),
                  ),
                ],
              ) : const SizedBox(),
              freev(v: 45),
              //fields
              widget.fields ?? const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
