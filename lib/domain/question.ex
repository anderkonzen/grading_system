defmodule GradingSystem.Domain.Question do
  defstruct statement: "",
            is_multiple: false,
            choices: [],
            correct_choice: nil
end
