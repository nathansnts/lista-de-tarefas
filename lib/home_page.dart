// ignore_for_file: unnecessary_string_escapes

import 'package:flutter/material.dart';
import 'package:lista_tarefas/models/tarefas.dart';
import 'package:lista_tarefas/widgets/itens_lista.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Tasks> tasks = [];

  void addTarefa(String tarefa) {
    setState(() {
      Tasks task1 = Tasks(
        title: tarefa,
        date: DateTime.now().subtract(
          const Duration(hours: 3),
        ),
      );
      tasks.add(task1);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Tarefa adicionada com sucesso!'),
        ),
      );
      assigmentController.clear();
    });
  }

  void removeAllTasks() {
    setState(() {
      tasks.clear();
    });
  }

  void removeATask(Tasks tarefa) {
    setState(() {
      tasks.remove(tarefa);
    });
  }

  final TextEditingController assigmentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                children: <Widget>[
                  Image.asset(
                      'D:/Projetos Flutter/lista_tarefas/imgs/Lista2.png',
                      height: 50,
                      width: 50),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'Lista de Tarefas',
                    style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          controller: assigmentController,
                          //onChanged: lerTarefa,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Adicione uma tarefa',
                            hintText: 'Ex: Lavar a casa',
                          ),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: TextButton(
                          onPressed: () {
                            String text = assigmentController.text;
                            (text.isEmpty)
                                ? showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text(
                                          'Campo não pode ser vazio!'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text(
                                            'Ok',
                                            style: TextStyle(
                                              color: Color(0xFF34C7C7),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : addTarefa(text);
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: const Color(0xFF2EDAE0),
                            fixedSize: const Size(45, 60),
                          ),
                          child: const Text(
                            '+',
                            style: TextStyle(
                              fontSize: 25,
                              color: Color(0xFFE2EBEB),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: ListView(
                      //É utilizado para poder deixar a altura da lista conforme a altura dos componentes
                      shrinkWrap: true,
                      children: <Widget>[
                        for (Tasks tarefa in tasks)
                          ItensLista(
                            tarefa: tarefa,
                            removeATask: removeATask,
                          ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            'Você possui ${tasks.length} tarefa(s) adicionada(s)!',
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF959999),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              (tasks.isEmpty)
                                  ? showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        title: const Text(
                                            'Não existem tarefa(s) adicionada(s)!'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text(
                                              'Ok',
                                              style: TextStyle(
                                                color: Color(0xFF34C7C7),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        title: const Text(
                                            'Deseja remover todas as tarefas?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              removeAllTasks();
                                              Navigator.pop(context);
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                  content: Text(
                                                      'Tarefa(s) removida(s) com sucesso!'),
                                                ),
                                              );
                                            },
                                            child: const Text(
                                              'Sim',
                                              style: TextStyle(
                                                color: Color(0xFF34C7C7),
                                              ),
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text(
                                              'Não',
                                              style: TextStyle(
                                                color: Color(0xFF34C7C7),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: const Color(0xFF2EDAE0),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              fixedSize: const Size(15, 45),
                            ),
                            child: const Text(
                              'Limpar Tarefas',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0xFFE2EBEB),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
