import 'package:flutter/material.dart';

void main() {
  runApp(BytebankApp());
}

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioTransferencia(),
      ),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta =
  TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando Transferências'),
      ),
      body: Column(children: [
        Editor(_controladorCampoNumeroConta, 'Número da Conta', '0000', null),
        Editor(_controladorCampoValor, 'Valor', '0.00', Icons.monetization_on),
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: TextField(
        //     controller: _controladorCampoValor,
        //     style: TextStyle(fontSize: 24.0),
        //     decoration: InputDecoration(
        //       icon: Icon(Icons.monetization_on),
        //       labelText: 'Valor',
        //       hintText: '0.00',
        //     ),
        //     keyboardType: TextInputType.number,
        //   ),
        // ),
        RaisedButton(
          onPressed: () {
            debugPrint('clicou no confirmar');
            final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
            final double valor = double.tryParse(_controladorCampoValor.text);

            //if(numeroConta!= null && valor != null){
              final transferenciaCriada = Transferencia(valor, numeroConta);
              debugPrint('$transferenciaCriada');
            //}
          },
          child: Text('Confirmar'),
        )
      ]),
    );
  }
}

class Editor extends StatelessWidget {
  final TextEditingController _controlador;
  final String _rotulo;
  final String _dica;
  final IconData _icone;


  Editor(this._controlador, this._rotulo, this._dica, this._icone);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _controlador,
        style: TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
          icon: Icon(_icone),
          labelText: _rotulo,
          hintText: _dica,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}


class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: Column(
        children: [
          // ItemTransferencia(Transferencia(100.00, '1000')),
          // ItemTransferencia(Transferencia(200.00, '2000')),
          // ItemTransferencia(Transferencia(300.00, '3000')),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text(_transferencia.valor.toString()),
          subtitle: Text(_transferencia.numeroConta.toString()),
        ));
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }
}
