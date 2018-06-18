defmodule GradingSystem.Application.AdministrationService do
  alias GradingSystem.Domain.School
  alias GradingSystem.Domain.Teacher
  alias GradingSystem.Domain.Student
  alias GradingSystem.Domain.Class

  def create_school(name) do
    %School{name: name}
  end

  def create_teacher(name, cpf) do
    %Teacher{name: name, cpf: cpf}
  end

  def create_student(name, code) do
    %Student{name: name, code: code}
  end

  def create_class(name) do
    %Class{name: name}
  end
end
