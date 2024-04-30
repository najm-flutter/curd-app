import 'package:block_test/features/posts/domain/entities/post_entities.dart';
import 'package:block_test/features/posts/presentation/bloc/aduposts/adu_posts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({super.key, required this.isUpdate, this.postEntities});
  final bool isUpdate;
  final PostEntities? postEntities;

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final TextEditingController _bodyCo = TextEditingController();
  final TextEditingController _titleCo = TextEditingController();
  @override
  void initState() {
    super.initState();
    _bodyCo.text = widget.isUpdate ? widget.postEntities!.body : '';
    _titleCo.text = widget.isUpdate ? widget.postEntities!.title : '';
  }

  void validator() {
    if (_formState.currentState!.validate()) {
      PostEntities postEntities = PostEntities(
          postId: widget.isUpdate ? widget.postEntities!.postId : 0,
          title: _titleCo.text,
          body: _bodyCo.text,
          userId: 0);
      if (widget.isUpdate) {
        BlocProvider.of<AduPostsBloc>(context).add(UpdatePostEvent(postEntities: widget.postEntities!));
      } else {
        BlocProvider.of<AduPostsBloc>(context).add(AddPostEvent(postEntities: postEntities));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Form(
          key: _formState,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _textEditingCu(textEditingController: _titleCo, hintText: "Title", textLins: 1),
              _textEditingCu(textEditingController: _bodyCo, hintText: "body", textLins: 6),
              ElevatedButton.icon(
                  onPressed: ()=> validator(),
                  icon: Icon(widget.isUpdate ? Icons.edit : Icons.add),
                  label: widget.isUpdate ? Text("Update") : Text("add"))
            ],
          )),
    );
  }
}

Widget _textEditingCu(
    {required TextEditingController textEditingController, required String hintText, required int textLins}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      controller: textEditingController,
      validator: (value) => value!.isEmpty ? "error Empty" : null,
      maxLines: textLins,
      minLines: textLins,
      decoration: InputDecoration(border: OutlineInputBorder(), hintText: hintText),
    ),
  );
}
