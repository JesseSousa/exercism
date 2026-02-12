defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """

  def compare(a, b) when a == b, do: :equal

  def compare(a, b) when length(a) == length(b), do: :unequal

  def compare(a, b) do
    cond do
      length(a) < length(b) -> if contains?(b, a), do: :sublist, else: :unequal
      length(a) > length(b) -> if contains?(a, b), do: :superlist, else: :unequal
    end
  end

  defp contains?(super_list, sub_list) when length(super_list) < length(sub_list), do: false

  defp contains?([_ | tail] = super_list, sub_list) do
    if List.starts_with?(super_list, sub_list) do
      true
    else
      contains?(tail, sub_list)
    end
  end
end
