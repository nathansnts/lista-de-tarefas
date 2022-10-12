import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lista_tarefas/models/tasks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class ItensLista extends StatelessWidget {
  ItensLista({
    Key? key,
    required this.tarefa,
    required this.removeATask,
  }) : super(key: key);

  int position = 0;
  final Tasks tarefa;
  final Function removeATask;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Slidable(
        endActionPane: ActionPane(
          extentRatio: 0.4,
          motion: const ScrollMotion(),
          children: <Widget>[
            SlidableAction(
              onPressed: (context) {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Deseja remover a tarefa?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          removeATask(tarefa);
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Tarefa removida com sucesso!'),
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
              icon: Icons.delete_forever,
              backgroundColor: const Color(0xFFDF0404),
              label: 'Remover',
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            color: Color(0xFFD1D4D4),
            borderRadius: BorderRadius.all(
              Radius.circular(3),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Adicionada em: ${DateFormat('dd/MM/yyyy - HH:mm').format(tarefa.date)}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                tarefa.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
