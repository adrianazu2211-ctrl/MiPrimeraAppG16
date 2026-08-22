import 'package:flutter/material.dart';
import 'superhero_data.dart';
import 'superhero_question.dart';

class SuperheroQuizScreen extends StatefulWidget {
  const SuperheroQuizScreen({super.key});

  @override
  State<SuperheroQuizScreen> createState() => _SuperheroQuizScreenState();
}

class _SuperheroQuizScreenState extends State<SuperheroQuizScreen> {
  int _currentIndex = 0;
  int _correctCount = 0;
  int _incorrectCount = 0;

  final List<Color> _optionColors = const [
    Color(0xFF6C63FF), // morado
    Color(0xFFFF6584), // rosado/rojo
    Color(0xFFFFC93C), // amarillo
    Color(0xFF00BFA6), // teal
  ];

  void _answerQuestion(String selected) {
    final SuperheroQuestion current = superheroQuestions[_currentIndex];
    final bool isCorrect = selected == current.correctAnswer;

    setState(() {
      if (isCorrect) {
        _correctCount++;
      } else {
        _incorrectCount++;
      }
    });

    if (_currentIndex < superheroQuestions.length - 1) {
      setState(() => _currentIndex++);
    } else {
      _showEndDialog();
    }
  }

  void _showEndDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        title: const Text('¡Juego terminado!'),
        content: Text(
          'El juego ha llegado a su fin.\n\n'
          'Respuestas correctas: $_correctCount\n'
          'Respuestas incorrectas: $_incorrectCount',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              _restartQuiz();
            },
            child: const Text('Jugar de nuevo'),
          ),
        ],
      ),
    );
  }

  void _restartQuiz() {
    setState(() {
      _currentIndex = 0;
      _correctCount = 0;
      _incorrectCount = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final SuperheroQuestion current = superheroQuestions[_currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('¿Cómo se llama el superhéroe?'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  current.imagePath,
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 24),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: current.options.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1.6,
                ),
                itemBuilder: (context, index) {
                  final option = current.options[index];
                  return ElevatedButton(
                    onPressed: () => _answerQuestion(option),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          _optionColors[index % _optionColors.length],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      option,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  );
                },
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _ScoreChip(
                    label: 'Correctas',
                    value: _correctCount,
                    color: Colors.green,
                  ),
                  _ScoreChip(
                    label: 'Incorrectas',
                    value: _incorrectCount,
                    color: Colors.red,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                'Pregunta ${_currentIndex + 1} de ${superheroQuestions.length}',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ScoreChip extends StatelessWidget {
  final String label;
  final int value;
  final Color color;

  const _ScoreChip({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: color,
      label: Text(
        '$label: $value',
        style: TextStyle(color: color, fontWeight: FontWeight.bold),
      ),
    );
  }
}
