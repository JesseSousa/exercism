defmodule RPNCalculator do
  def calculate!(stack, operation) do
    operation.(stack)
  end

  def calculate(stack, operation) do
    try do
      stack
      |> calculate!(operation)
      |> then(&{:ok, &1})
    rescue
      _ -> :error
    end
  end

  def calculate_verbose(stack, operation) do
    try do
      stack
      |> calculate!(operation)
      |> then(&{:ok, &1})
    rescue
      error -> {:error, Exception.message(error)}
    end
  end
end
