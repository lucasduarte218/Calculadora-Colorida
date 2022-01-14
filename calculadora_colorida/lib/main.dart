import 'package:flutter/material.dart';

void main() {
  runApp(Calculadora());
}

class Calculadora extends StatefulWidget {
  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  var titulo = 'Calculadora';

  //
  var lista = [];
  int tamanho = 0;
  String display = '';
  String visor = '';
  int ultimoValor = 0;
  bool temSimbolo = true;
  bool resultado = false;

  //

//  Color cores[coresIndex] = Colors.pink;

  Color corBotao2 = Colors.white;

  var cores = [
    Colors.pink,
    Colors.orange,
    Colors.green,
    Colors.purple,
    Colors.lightBlue,
    Colors.yellow
  ];
  int coresIndex = 0;

  double tamBotao = 105;

  double fontTam = 40;

  final ButtonStyle style = ElevatedButton.styleFrom(
      primary: Colors.black, textStyle: const TextStyle(fontSize: 40));

  final ButtonStyle style1 = ElevatedButton.styleFrom(
      primary: Colors.pink, textStyle: const TextStyle(fontSize: 40));

//

  int listTam() {
    return lista.length;
  }

  int calcular() {
    int casaAnterior = 0;
    int casaPosterior = 0;
    int resultado1 = 0;
    print('calculando ...');
    for (int i = 0; i < tamanho; i++) {
      if (lista[i] == 'x') {
        int x = i - 1;
        int xx = lista[x];
        print('i-1 : $x');
        print('valor i-1 : $xx');
        casaAnterior = lista[i - 1];
        casaPosterior = lista[i + 1];
        resultado1 = casaAnterior * casaPosterior;
        print("calculo de $casaAnterior * $casaPosterior = $resultado1 ");
        casaPosterior = resultado1;
        lista[i + 1] = resultado1;
      } else if (lista[i] == '÷') {
        int x = i - 1;
        int xx = lista[x];
        print('i-1 : $x');
        print('valor i-1 : $xx');
        casaAnterior = lista[i - 1];
        casaPosterior = lista[i + 1];
        resultado1 = casaAnterior ~/ casaPosterior;
        print("calculo de $casaAnterior + $casaPosterior = $resultado1 ");
        casaPosterior = resultado1;
        lista[i + 1] = resultado1;
      } else if (lista[i] == '+') {
        int x = i - 1;
        int xx = lista[x];
        print('i-1 : $x');
        print('valor i-1 : $xx');
        casaAnterior = lista[i - 1];
        casaPosterior = lista[i + 1];
        resultado1 = casaAnterior + casaPosterior;
        print("calculo de $casaAnterior + $casaPosterior = $resultado1 ");
        casaPosterior = resultado1;
        lista[i + 1] = resultado1;
      } else if (lista[i] == '-') {
        int x = i - 1;
        int xx = lista[x];
        print('i-1 : $x');
        print('valor i-1 : $xx');
        casaAnterior = lista[i - 1];
        casaPosterior = lista[i + 1];
        resultado1 = casaAnterior - casaPosterior;
        print("calculo de $casaAnterior + $casaPosterior = $resultado1 ");
        casaPosterior = resultado1;
        lista[i + 1] = resultado1;
      } else {
        String t = lista[i].toString();
        print('calculo: lista instacia atual[$i] = ' + t);
      }
    }
    resultado = true;
    return casaPosterior;
  }

  void del() {
    lista.removeLast();
    tamanho--;
  }

  void addNumero(int s) {
    print(lista.length);
    if (!temSimbolo && tamanho > 0 && (lista[tamanho - 1] != 'x')) {
      print('numero em cima de numero');
      String temp = lista[tamanho - 1].toString();
      String ss = s.toString();
      String tran = temp + ss;
      int fim = int.parse(tran);
      lista[tamanho - 1] = fim;
    } else {
      print('so 1 numero');
      lista.add(s);
      tamanho++;
    }

    temSimbolo = false;
  }

  void addSimbolo(String s) {
    if (!temSimbolo) {
      lista.add(s);
      tamanho++;
      temSimbolo = true;
    }
  }

  void attDisplay() {
    visor = '';
    if (!resultado) {
      for (int i = 0; i < tamanho; i++) {
        visor = visor + lista[i].toString();
        print('display: lista[$i] = ' + lista[i].toString());
      }
    } else {
      visor = ultimoValor.toString();
      lista.clear();
      tamanho = 0;
      addNumero(ultimoValor);
      resultado = false;
    }
  }

//
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Text(
                titulo,
                style: TextStyle(color: cores[coresIndex]),
              ),
              centerTitle: true,
            ),
            backgroundColor: Colors.black,
            body: SafeArea(
                child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          color: Colors.black12,
                          child: Center(
                            child: Text(visor,
                                style: TextStyle(
                                    fontSize: fontTam * 2,
                                    color: Colors.white)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  child: Divider(
                    color: cores[coresIndex],
                    thickness: 2,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.black,
                          child: ElevatedButton(
                              style: style,
                              onPressed: () {
                                setState(() {
                                  lista.clear();
                                  tamanho = 0;
                                  attDisplay();
                                });
                              },
                              child: Center(
                                child: Text(
                                  'C',
                                  style: TextStyle(
                                      fontSize: fontTam,
                                      color: cores[coresIndex]),
                                ),
                              )),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.black,
                          child: ElevatedButton(
                              style: style,
                              onPressed: () {
                                setState(() {
                                  del();
                                  attDisplay();
                                });
                              },
                              child: Center(
                                child: Text(
                                  'DEL',
                                  style: TextStyle(
                                      fontSize: fontTam - 3,
                                      color: cores[coresIndex]),
                                ),
                              )),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.black,
                          child: ElevatedButton(
                              style: style,
                              onPressed: () {
                                setState(() {});
                              },
                              child: Center(
                                child: Text(
                                  '%',
                                  style: TextStyle(
                                      fontSize: fontTam,
                                      color: cores[coresIndex]),
                                ),
                              )),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.black,
                          child: ElevatedButton(
                              style: style,
                              onPressed: () {
                                setState(() {
                                  setState(() {
                                    addSimbolo('÷');
                                    attDisplay();
                                  });
                                });
                              },
                              child: Center(
                                child: Text(
                                  '÷',
                                  style: TextStyle(
                                      fontSize: fontTam,
                                      color: cores[coresIndex]),
                                ),
                              )),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.black,
                          child: ElevatedButton(
                              style: style,
                              onPressed: () {
                                setState(() {
                                  addNumero(1);
                                  attDisplay();
                                });
                              },
                              child: Center(
                                child: Text(
                                  '1',
                                  style: TextStyle(
                                      fontSize: fontTam,
                                      color: cores[coresIndex]),
                                ),
                              )),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.black,
                          child: ElevatedButton(
                              style: style,
                              onPressed: () {
                                setState(() {
                                  addNumero(2);
                                  attDisplay();
                                });
                              },
                              child: Center(
                                child: Text(
                                  '2',
                                  style: TextStyle(
                                      fontSize: fontTam,
                                      color: cores[coresIndex]),
                                ),
                              )),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.black,
                          child: ElevatedButton(
                              style: style,
                              onPressed: () {
                                setState(() {
                                  addNumero(3);
                                  attDisplay();
                                });
                              },
                              child: Center(
                                child: Text(
                                  '3',
                                  style: TextStyle(
                                      fontSize: fontTam,
                                      color: cores[coresIndex]),
                                ),
                              )),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.black,
                          child: ElevatedButton(
                              style: style,
                              onPressed: () {
                                setState(() {
                                  addSimbolo('x');
                                  attDisplay();
                                });
                              },
                              child: Center(
                                child: Text(
                                  'x',
                                  style: TextStyle(
                                      fontSize: fontTam,
                                      color: cores[coresIndex]),
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.black,
                          child: ElevatedButton(
                              style: style,
                              onPressed: () {
                                setState(() {
                                  addNumero(4);
                                  attDisplay();
                                });
                              },
                              child: Center(
                                child: Text(
                                  '4',
                                  style: TextStyle(
                                      fontSize: fontTam,
                                      color: cores[coresIndex]),
                                ),
                              )),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.black,
                          child: ElevatedButton(
                              style: style,
                              onPressed: () {
                                setState(() {
                                  addNumero(5);
                                  attDisplay();
                                });
                              },
                              child: Center(
                                child: Text(
                                  '5',
                                  style: TextStyle(
                                      fontSize: fontTam,
                                      color: cores[coresIndex]),
                                ),
                              )),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.black,
                          child: ElevatedButton(
                              style: style,
                              onPressed: () {
                                setState(() {
                                  addNumero(6);
                                  attDisplay();
                                });
                              },
                              child: Center(
                                child: Text(
                                  '6',
                                  style: TextStyle(
                                      fontSize: fontTam,
                                      color: cores[coresIndex]),
                                ),
                              )),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.black,
                          child: ElevatedButton(
                              style: style,
                              onPressed: () {
                                setState(() {
                                  addSimbolo('-');
                                  attDisplay();
                                });
                              },
                              child: Center(
                                child: Text(
                                  '-',
                                  style: TextStyle(
                                      fontSize: fontTam,
                                      color: cores[coresIndex]),
                                ),
                              )),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.black,
                          child: ElevatedButton(
                              style: style,
                              onPressed: () {
                                setState(() {
                                  addNumero(7);
                                  attDisplay();
                                });
                              },
                              child: Center(
                                child: Text(
                                  '7',
                                  style: TextStyle(
                                      fontSize: fontTam,
                                      color: cores[coresIndex]),
                                ),
                              )),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.black,
                          child: ElevatedButton(
                              style: style,
                              onPressed: () {
                                setState(() {
                                  addNumero(8);
                                  attDisplay();
                                });
                              },
                              child: Center(
                                child: Text(
                                  '8',
                                  style: TextStyle(
                                      fontSize: fontTam,
                                      color: cores[coresIndex]),
                                ),
                              )),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.black,
                          child: ElevatedButton(
                              style: style,
                              onPressed: () {
                                setState(() {
                                  addNumero(9);
                                  attDisplay();
                                });
                              },
                              child: Center(
                                child: Text(
                                  '9',
                                  style: TextStyle(
                                      fontSize: fontTam,
                                      color: cores[coresIndex]),
                                ),
                              )),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.black,
                          child: ElevatedButton(
                              style: style,
                              onPressed: () {
                                setState(() {
                                  addSimbolo('+');
                                  attDisplay();
                                });
                              },
                              child: Center(
                                child: Text(
                                  '+',
                                  style: TextStyle(
                                      fontSize: fontTam,
                                      color: cores[coresIndex]),
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.black,
                          child: ElevatedButton(
                              style: style,
                              onPressed: () {
                                setState(() {
                                  if (coresIndex == cores.length - 1) {
                                    coresIndex = 0;
                                  } else {
                                    coresIndex++;
                                  }
                                  attDisplay();
                                });
                              },
                              child: Center(
                                child: Text(
                                  'COR',
                                  style: TextStyle(
                                      fontSize: fontTam - 6.5,
                                      color: cores[coresIndex]),
                                ),
                              )),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.black,
                          child: ElevatedButton(
                              style: style,
                              onPressed: () {
                                setState(() {
                                  addNumero(0);
                                  attDisplay();
                                });
                              },
                              child: Center(
                                child: Text(
                                  '0',
                                  style: TextStyle(
                                      fontSize: fontTam,
                                      color: cores[coresIndex]),
                                ),
                              )),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.black,
                          child: ElevatedButton(
                              style: style,
                              onPressed: () {},
                              child: Center(
                                child: Text(
                                  ',',
                                  style: TextStyle(
                                      fontSize: fontTam,
                                      color: cores[coresIndex]),
                                ),
                              )),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.black,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: cores[coresIndex],
                                  textStyle: const TextStyle(fontSize: 40)),
                              onPressed: () {
                                setState(() {
                                  print('cliquei em calcular');
                                  ultimoValor = calcular();
                                  attDisplay();
                                });
                              },
                              child: Center(
                                child: Text(
                                  '=',
                                  style: TextStyle(
                                      fontSize: fontTam, color: Colors.black),
                                ),
                              )),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ))));
  }
}
