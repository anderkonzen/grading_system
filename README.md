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
template = ExamService.create_template(teacher, "Prova Biologia", ~D[2018-05-01], [question1, question2])

# Professor aplicou prova para turma
# - para cada aluno:
evaluation = EvaluationService.apply_exam(exam, ~D[2018-05-01], ~D[2018-05-01], student) 

# Professor compartilhou a prova para outros professores da mesma escola
ExamService.share(exam, teacher, school)


############
A partir daqui apenas esboço de utilização da API
############

# Professor editou modelo de prova
# - dado que temos a estrutura da prova/questoes/respostas
exam_template = ExamService.update(exam_template, %{name: "Template prova Bio 2"})
question1 = Exam.update_question(exam_template, question1, %{statement: "Novo enunciado"})
choice1 = ExamService.update_choice(question1, choice1, %{statement: "nova escolha"})

# Professor criou prova a partir do template
exam2 = ExamService.create_from_template(exam_template)

# Professor criou nova versão de prova com base em uma outra
exam3 = ExamService.create_from_exam(exam)

# Aluno respondeu prova
# - dado que encontramos uma evaluation em aberto (pelas datas), podemos buscar o exame e suas perguntas. Para cada pergunta o aluno:
# Discursiva
answer1 = StudentService.answer_question(question1, "a historia que deveria ser contada", nil)
# Multipla escolha
answer2 = StudentService.answer_question(question2, "", 1)

# Professor corrigiu prova do aluno
evaluation = EvaluationService.mark_corrected(exam, student)
# ou dado que temos a evaluation em questao
evaluation = EvaluationService.mark_corrected(evaluation)

# Professor colocou comentário em prova corrigida
evaluation = EvaluationService.add_comment(exam, evalution, student, "comentário do profe")

# Professor adicionou nota individual em cada questao
answer = AnswerService.mark(answer, mark)

# Sistema corrigiu questoes alternativas
evaluation = EvaluationService.run_evaluation(evaluation)