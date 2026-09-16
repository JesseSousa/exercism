defmodule LogParser do
  def valid_line?(line) do
    Regex.match?(~r/^\[(ERROR|DEBUG|INFO|WARNING)\]\s[a-zA-Z\s]+/u, line)
  end

  def split_line(line) do
    Regex.split(~r/\<(\~|\*|\=|\-)*\>/, line)
  end

  def remove_artifacts(line) do
    Regex.replace(~r/end-of-line[0-9]+/iu, line, "")
  end

  def tag_with_user_name(line) do
    case Regex.named_captures(~r/User\s+(?<username>[\w\p{P}\p{S}]+)/iu, line) do
      nil -> line
      %{"username" => username} -> "[USER] #{username} #{line}"
    end
  end
end
