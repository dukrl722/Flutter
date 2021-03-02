import 'package:flutter/material.dart';
import 'package:project/components/editor.dart';
import 'package:project/models/transferencia.dart';

const _titleAppBar = 'Criando Transferência';
const _toolTipNumeroConta = '0000';
const _toolTipValor = '0,00';
const _rotuleNumeroConta = 'Número da Conta';
const _rotuleValor = 'Valor';
const _buttonText = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleAppBar),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Editor(
              controller: _controladorCampoNumeroConta,
              tooltip: _toolTipNumeroConta,
              rotule: _rotuleNumeroConta),
          Editor(
              controller: _controladorCampoValor,
              tooltip: _toolTipValor,
              rotule: _rotuleValor,
              icon: Icons.monetization_on_outlined),
          RaisedButton(
            child: Text(_buttonText),
            onPressed: () => _createTranfer(context),
          )
        ],
      )),
    );
  }

  void _createTranfer(BuildContext context) {
    final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double valor = double.tryParse(_controladorCampoValor.text);

    if ((numeroConta != null && valor != null) != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferenciaCriada);
    }
  }
}
