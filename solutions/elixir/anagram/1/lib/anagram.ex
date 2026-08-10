defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    base_word_letters = split_letters(base)

    Enum.filter(candidates, fn candidate ->
      candidate_letters = split_letters(candidate)

      String.downcase(base) != String.downcase(candidate) and
        Enum.sort(candidate_letters) == Enum.sort(base_word_letters)
    end)
  end

  defp split_letters(word) do
    word
    |> String.downcase()
    |> String.split("")
  end
end
