defmodule GradingSystem.Application.ExamService do
  alias GradingSystem.Domain.Exam
  alias GradingSystem.Domain.Choice
  alias GradingSystem.Domain.Question

  def create(teacher, title, is_template, date, questions) do
    %Exam{title: title, is_template: is_template, date: date, teacher: teacher}
  end

  def create_question(statement, is_multiple, choices, correct_choice) do
    %Question{statement: statement, is_multiple: is_multiple, choices: choices, correct_choice: correct_choice}
  end

  def create_choice(statement) do
    %Choice{statement: statement}
  end

  def share(exam, teacher, school) do

  end

end
