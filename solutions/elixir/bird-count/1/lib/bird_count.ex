defmodule BirdCount do
  def today([]), do: nil

  def today([head | _]) do
    head
  end

  def increment_day_count([]), do: [1]

  def increment_day_count([head | tail]) do
    [head + 1 | tail]
  end

  def has_day_without_birds?(list) do
    Enum.any?(list, &(&1 == 0))
  end

  def total(list) do
    Enum.reduce(list, 0, &(&1 + &2))
  end

  def busy_days(list) do
    Enum.reduce(list, 0, &if(&1 >= 5, do: &2 + 1, else: &2))
  end
end
