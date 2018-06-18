defmodule GradingSystem.Domain.Evaluation do
  defstruct start_date: nil,
            end_date: nil,
            grade: 0,
            comment: "",
            exam: nil,
            student: nil
end
