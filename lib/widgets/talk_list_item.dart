import 'package:flutter/material.dart';
import '../models/tasks_models.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  // funções de callback para notificar o widget das alterações
  final VoidCallback onChanged;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  // construtor dos dados necessários
  const TaskItem({
    super.key,
    required this.task,
    required this.onChanged,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      // Cor de fundo do card, ligeiramente mais clara que o fundo da tela
      color: const Color(0xFF161b22),
      margin: EdgeInsets.symmetric(vertical: 6.2, horizontal: 8.0),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        // O Checkbox à esquerda
        leading: Checkbox(
          value: task.isDone, 
          onChanged: (value) => onChanged(),
          activeColor: Colors.green,
        ),
        // O título da tarefa
        title: Text(
          task.title,
          style: TextStyle(
            // Aplica o estilo de texto riscado se a tarefa estiver concluída
            decoration: task.isDone ? TextDecoration.lineThrough : TextDecoration.none,
            color: task.isDone ? Colors.grey : Colors.white,
            fontSize: 16
          ),
        ),
        // O botão de deletar à direita
        // trailing: IconButton(
        //   icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
        //   onPressed: onDelete, // Chama o callback de deleção ao ser pressionado
        // ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit_outlined, color: Colors.blueAccent),
              onPressed: onEdit, // Chama o callback de deleção ao ser pressionado
            ),
            IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
              onPressed: onDelete, // Chama o callback de deleção ao ser pressionado
            ),
          ],
        ),
        onTap: onChanged, // Permite clicar em qualquer lugar do item para marcar/desmarcar
      ),
    );
  }
}