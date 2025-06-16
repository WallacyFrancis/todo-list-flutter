import 'package:flutter/material.dart';
import '../models/tasks_models.dart';
import '../widgets/talk_list_item.dart';

class TodoScreen extends StatefulWidget {
// Suggested code may be subject to a license. Learn more: ~LicenseLog:4133814274.
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  // A lista que armazena nossas tarefas. É a "fonte da verdade" do nosso estado.
  final List<Task> _tasks = [];
  // Controlador para o campo de texto no diálogo de adicionar tarefa.
  final TextEditingController _taskController = TextEditingController();

  // Função para exibir o diálogo de adicionar nova tarefa
  void _showAddTask() {
    // Limpa o texto do controlador antes de mostrar o diálogo
    _taskController.clear();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: const Color(0xFF161b22),
          title: const Text('Nova Tarefa'),
          content: TextField(
            controller: _taskController,
            autofocus: true,
            decoration: const InputDecoration(
              hintText: 'O que você precisa fazer?',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), // Fecha o diálogo,
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_taskController.text.isNotEmpty) {
                  _addTask(_taskController.text);
                  Navigator.pop(context);
                }
              }, 
              child: const Text('Adicionar'),
            ),
          ],
        );
      }
    );
  }

  // Função para adicionar uma tarefa à lista
  void _addTask(String title) {
    setState(() {
      _tasks.add(
        Task(
          id: DateTime.now().toString(),
          title: title,
          isDone: false, // ID único baseado no tempo atual
        )
      );
    });
  }

  void _toggleTaskStatus(Task task) {
    setState(() {
      task.isDone = !task.isDone;
    });
  }

  void _deleteTask(Task task) {
    setState(() {
      _tasks.remove(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Minhas Tarefas"),
      ),
      body: _tasks.isEmpty
        // Se a lista estiver vazia, mostra uma mensagem centralizada
        ? const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.checklist_rtl, size: 80, color: Colors.grey),
                SizedBox(height: 16),
                Text(
                  'Nenhuma tarefa ainda!',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                Text(
                  'Adicione uma nova tarefa usando o botão +',
                  style: TextStyle(color: Colors.grey),
                )
              ],
            )
          )
          // Se a lista não estiver vazia, mostra a ListView
          : ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                final task = _tasks[index];
                return TaskItem(
                  task: task,
                  onChanged: () => _toggleTaskStatus(task),
                  onDelete: () => _deleteTask(task),
                );
              },
            ),
        
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTask,
        tooltip: 'Adicionar Tarefa',
        child: const Icon(Icons.add),
      ),
    );
  }
}