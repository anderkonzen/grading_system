defmodule GradingSystem.Application.SchoolService do

  def register_teacher(school, teacher) do
    %{school | teachers: [teacher | school.teachers]}
  end

  def register_class(school, class) do
    %{school | classes: [class | school.classes]}
  end

  def assoc_class_teacher(class, teacher) do
    %{class | teacher: teacher}
  end
end
