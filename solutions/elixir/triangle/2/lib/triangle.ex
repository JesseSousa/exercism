defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: {:ok, kind} | {:error, String.t()}
  def kind(a, b, c) do
    with {:ok, :valid} <- validate_triangle(a, b, c) do
      case Enum.dedup(Enum.sort([a, b, c])) do
        sides when length(sides) == 3 -> {:ok, :scalene}
        sides when length(sides) == 2 -> {:ok, :isosceles}
        sides when length(sides) == 1 -> {:ok, :equilateral}
      end
    else
      error -> error
    end
  end

  defp validate_triangle(a, b, c) do
    [s1, s2, max] = Enum.sort([a, b, c])

    cond do
      not Enum.all?([a, b, c], &(&1 > 0)) ->
        {:error, "all side lengths must be positive"}

      s1 + s2 <= max ->
        {:error, "side lengths violate triangle inequality"}

      true ->
        {:ok, :valid}
    end
  end
end
