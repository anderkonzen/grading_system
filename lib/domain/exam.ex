defmodule GradingSystem.Domain.Exam do
  defstruct title: "",
            is_template: false,
            date: nil,
            questions: [],
            teacher: nil
end
