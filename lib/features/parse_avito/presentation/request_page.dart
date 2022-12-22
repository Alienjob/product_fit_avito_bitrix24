import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_fit_avito_bitrix/features/parse_avito/application/bloc/request_form_bloc.dart';
import 'package:product_fit_avito_bitrix/features/parse_avito/domain/processing_result.dart';

class RequestPage extends StatefulWidget {
  const RequestPage({super.key});

  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  final TextEditingController linkController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: BlocProvider(
          create: (context) => RequestFormBloc(),
          child: BlocBuilder<RequestFormBloc, RequestFormState>(
            buildWhen: (previous, current) {
              return previous.isProcessing != current.isProcessing;
            },
            builder: (context, state) {
              linkController.text = state.url;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  LinkField(linkController: linkController),
                  DoButton(),
                  (state.isProcessing)
                      ? const CircularProgressIndicator()
                      : ProcessingTablo(result: state.result),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class ProcessingTablo extends StatelessWidget {
  const ProcessingTablo({
    Key? key,
    required this.result,
  }) : super(key: key);
  final ProcessingResult result;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text('finded ${result.elements}'),
          Text('new ${result.newElements}'),
          Text('sended ${result.sendedElements}'),
        ],
      ),
    );
  }
}

class LinkField extends StatelessWidget {
  const LinkField({
    Key? key,
    required this.linkController,
  }) : super(key: key);

  final TextEditingController linkController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: linkController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'avito search link',
        ),
        onChanged: (text) {
          BlocProvider.of<RequestFormBloc>(context)
              .add(RequestFormEventUrlChanged(url: text));
        },
      ),
    );
  }
}

class DoButton extends StatelessWidget {
  const DoButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () => BlocProvider.of<RequestFormBloc>(context).add(
        RequestFormEventSearch(url: linkUrl),
      ),
      label: const Text('Do processing'),
    );
  }
}
