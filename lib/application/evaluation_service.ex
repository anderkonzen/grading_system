defmodule GradingSystem.Application.EvaluationService do
  alias GradingSystem.Domain.Evaluation

  def apply_exam(exam, start_date, end_date, student) do
    %Evaluation{start_date: start_date, end_date: end_date, exam: exam, student: student}
  end

end
