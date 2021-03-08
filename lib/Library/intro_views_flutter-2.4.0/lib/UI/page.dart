import 'package:flutter/material.dart' hide Page;
import 'package:flutter/src/widgets/navigator.dart' hide Page;

import 'package:sistem_monitoring/Library/intro_views_flutter-2.4.0/lib/Models/page_view_model.dart';

/// This is the class which contains the Page UI.
class Page extends StatefulWidget {
  ///page details
  final PageViewModel pageViewModel;

  ///percent visible of page
  final double percentVisible;

  /// [MainAxisAligment]
  final MainAxisAlignment columnMainAxisAlignment;

  //Constructor
  Page({
    this.pageViewModel,
    this.percentVisible = 1.0,
    this.columnMainAxisAlignment = MainAxisAlignment.spaceAround,
  });

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.all(8.0),
      width: double.infinity,
      color: widget.pageViewModel.pageColor,
      child: new Opacity(
        //Opacity is used to create fade in effect
        opacity: widget.percentVisible,
        child: new OrientationBuilder(
            builder: (BuildContext context, Orientation orientation) {
          return orientation == Orientation.portrait
              ? _buildPortraitPage()
              : __buildLandscapePage();
        }), //OrientationBuilder
      ),
    );
  }

  /// when device is Portrait place title, image and body in a column
  Widget _buildPortraitPage() {
    return new Column(
      mainAxisAlignment: widget.columnMainAxisAlignment,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: new _ImagePageTransform(
            percentVisible: widget.percentVisible,
            pageViewModel: widget.pageViewModel,
          ),
        ), //Transform
        Flexible(
          flex: 1,
          child: new _TitlePageTransform(
            percentVisible: widget.percentVisible,
            pageViewModel: widget.pageViewModel,
          ),
        ), //Transform
        Flexible(
          flex: 2,
          child: new _BodyPageTransform(
            percentVisible: widget.percentVisible,
            pageViewModel: widget.pageViewModel,
          ),
        ), //Transform
      ],
    );
  }

  /// if Device is Landscape reorder with row and column
  Widget __buildLandscapePage() {
    return new Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: new _ImagePageTransform(
            percentVisible: widget.percentVisible,
            pageViewModel: widget.pageViewModel,
          ),
        ), //Transform

        new Flexible(
          child: new Column(
            mainAxisAlignment: widget.columnMainAxisAlignment,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              new _TitlePageTransform(
                percentVisible: widget.percentVisible,
                pageViewModel: widget.pageViewModel,
              ), //Transform
              new _BodyPageTransform(
                percentVisible: widget.percentVisible,
                pageViewModel: widget.pageViewModel,
              ), //Transform
            ],
          ), // Column
        ),
      ],
    );
  }
}

/// Body for the Page.
class _BodyPageTransform extends StatelessWidget {
  final double percentVisible;

  final PageViewModel pageViewModel;

  const _BodyPageTransform({
    Key key,
    @required this.percentVisible,
    @required this.pageViewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Transform(
      //Used for vertical transformation
      transform:
          new Matrix4.translationValues(0.0, 30.0 * (1 - percentVisible), 0.0),
      child: new Padding(
        padding: const EdgeInsets.only(
          bottom: 15.0,
          left: 10.0,
          right: 10.0,
        ),
        child: DefaultTextStyle.merge(
          style: pageViewModel.bodyTextStyle,
          textAlign: TextAlign.center,
          child: pageViewModel.body,
        ),
      ), //Padding
    );
  }
}

/// Main Image of the Page
class _ImagePageTransform extends StatelessWidget {
  final double percentVisible;

  final PageViewModel pageViewModel;

  const _ImagePageTransform({
    Key key,
    @required this.percentVisible,
    @required this.pageViewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Transform(
      //Used for vertical transformation
      transform:
          new Matrix4.translationValues(0.0, 50.0 * (1 - percentVisible), 0.0),
      child: new Padding(
        padding: new EdgeInsets.only(
          top: 60.0,
          bottom: 0.0,
        ),
        child: new Container(
          width: double.infinity,
          child: pageViewModel.mainImage, //Loading main
        ), //Container
      ), //Padding
    );
  }
}

/// Title for the Page
class _TitlePageTransform extends StatelessWidget {
  final double percentVisible;

  final PageViewModel pageViewModel;

  const _TitlePageTransform({
    Key key,
    @required this.percentVisible,
    @required this.pageViewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Transform(
      //Used for vertical transformation
      transform:
          new Matrix4.translationValues(0.0, 30.0 * (1 - percentVisible), 0.0),
      child: new Padding(
        padding: new EdgeInsets.only(
          bottom: 0.0,
          left: 10.0,
          right: 10.0,
        ),
        child: DefaultTextStyle.merge(
          style: pageViewModel.titleTextStyle,
          child: pageViewModel.title,
        ),
      ), //Padding
    );
  }
}
