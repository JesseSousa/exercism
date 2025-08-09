defmodule Username do
  def sanitize(username) do
    Enum.reduce(username, ~c"", fn char, acc ->
      case char do
        char when char >= ?a and char <= ?z -> acc ++ [char]
        ?_ -> acc ++ [char]
        ?ä -> acc ++ ~c"ae"
        ?ö -> acc ++ ~c"oe"
        ?ü -> acc ++ ~c"ue"
        ?ß -> acc ++ ~c"ss"
        _ -> acc
      end
    end)
  end
end
