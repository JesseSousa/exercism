defmodule LogLevel do
  def to_label(level, legacy?) do
    case level do
      0 -> if legacy?, do: :unknown, else: :trace
      1 -> :debug
      2 -> :info
      3 -> :warning
      4 -> :error
      5 -> if legacy?, do: :unknown, else: :fatal
      _ -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    case to_label(level, legacy?) do
      l when l in [:error, :fatal] -> :ops
      :unknown -> if legacy?, do: :dev1, else: :dev2
      _ -> false
    end
  end
end
