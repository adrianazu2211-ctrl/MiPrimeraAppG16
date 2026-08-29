import 'superhero_question.dart';

final List<SuperheroQuestion> superheroQuestions = [
  const SuperheroQuestion(
    imagePath: 'Assets/Images/capitan_america.jpg',
    options: [
      'El Americano',
      'Capitán Americano',
      'Capitán América',
      'Sr Capitán',
    ],
    correctAnswer: 'Capitán América',
  ),
  const SuperheroQuestion(
    imagePath: 'Assets/Images/hulk.jpg',
    options: ['El Verdoso', 'Hulk', 'Hombre Verde', 'Increíble Tipo'],
    correctAnswer: 'Hulk',
  ),
  const SuperheroQuestion(
    imagePath: 'Assets/Images/iron_man.jpg',
    options: ['Hombre de Hierro', 'Robot Man', 'El Metálico', 'Iron Boy'],
    correctAnswer: 'Hombre de Hierro',
  ),
  const SuperheroQuestion(
    imagePath: 'Assets/Images/spiderman.jpg',
    options: ['El Arácnido', 'Hombre Araña', 'Súper Araña', 'Spider Boy'],
    correctAnswer: 'Hombre Araña',
  ),
  const SuperheroQuestion(
    imagePath: 'Assets/Images/super_man.jpg',
    options: ['El Volador', 'Superman', 'Hombre de Acero Falso', 'Super Boy'],
    correctAnswer: 'Superman',
  ),
];
