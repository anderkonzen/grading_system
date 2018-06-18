# GradingSystem

```elixir

alias GradingSystem.Application.{AdministrationService, SchoolService, TeacherService}
alias GradingSystem.Application.{ExamService, EvaluationService}

# Usuário master cadastrou uma escola com professor
school = AdministrationService.create_school("Colegio Santo Antonio")
teacher = AdministrationService.create_teacher("Gilberto", "123123123")
school = SchoolService.register_teacher(school, teacher)

# Professor cadastrou uma turma
class = AdministrationService.create_class("Turma 81")
class = SchoolService.assoc_class_teacher(class, teacher)
student = AdministrationService.create_student("Chiquinho", 123)

# Professor criou modelo de prova
choice1 = ExamService.create_choice("Opcao 1")
choice2 = ExamService.create_choice("Opcao 2")
question1 = ExamService.create_question("Qual opcao correta?", true, [choice1, choice2], choice2)
question2 = ExamService.create_question("Escreva uma historia", false, [], nil)
exam = ExamService.create(teacher, "Prova Biologia", false, ~D[2018-05-01], [question1, question2])

# Professor aplicou prova para turma
# para cada aluno:
evaluation = EvaluationService.apply_exam(exam, ~D[2018-05-01], ~D[2018-05-01], student) 

# Professor compartilhou a prova para outros professores da mesma escola
ExamService.share(exam, teacher, school)


############
A partir daqui apenas esboço de utilização da API
############

# Professor editou modelo de prova
exam = ExamService.update(exam, %{name: "Template prova Bio 2"})
choice1 = ExamService.update_choice(choice1, %{statement: "nova escolha"})

# Professor criou prova a partir do template
exam2 = ExamService.create_from_template(exam)

# Professor criou nova versão de prova com base em uma outra
exam3 = ExamService.create_from_exam(exam)

# Aluno respondeu prova
questions = StudentService.get_questions(exam)
# para cada question:
answer1 = StudentService.answer_question(question1, "a historia que deveria ser contada", nil)
answer2 = StudentService.answer_question(question2, "", 1)

# Professor corrigiu prova do aluno
answer = EvaluationService.mark_corrected(exam, student)

# Professor colocou comentário em prova corrigida
evaluation = EvaluationService.add_comment(exam, student, "comentário do profe")

# Professor adicionou nota individual em cada questao
answer = AnswerService.mark(answer, mark)

# Sistema corrigiu questoes alternativas
evaluation = EvaluationService.run_evaluation(evaluation)