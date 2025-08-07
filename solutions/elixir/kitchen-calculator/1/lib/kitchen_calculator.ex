defmodule KitchenCalculator do
  @cup_in_ml 240
  @fluid_once_in_ml 30
  @teaspoon_in_ml 5
  @tablespoon_in_ml 15

  def get_volume({_, volume}), do: volume

  def to_milliliter({:cup, volume}), do: {:milliliter, volume * @cup_in_ml}

  def to_milliliter({:fluid_ounce, volume}), do: {:milliliter, volume * @fluid_once_in_ml}

  def to_milliliter({:teaspoon, volume}), do: {:milliliter, volume * @teaspoon_in_ml}

  def to_milliliter({:tablespoon, volume}), do: {:milliliter, volume * @tablespoon_in_ml}

  def to_milliliter({:milliliter, volume}), do: {:milliliter, volume}

  def from_milliliter(volume_pair, :cup = unit) do
    {unit, get_volume(volume_pair) / @cup_in_ml}
  end

  def from_milliliter(volume_pair, :fluid_ounce = unit) do
    {unit, get_volume(volume_pair) / @fluid_once_in_ml}
  end

  def from_milliliter(volume_pair, :teaspoon = unit) do
    {unit, get_volume(volume_pair) / @teaspoon_in_ml}
  end

  def from_milliliter(volume_pair, :tablespoon = unit) do
    {unit, get_volume(volume_pair) / @tablespoon_in_ml}
  end

  def from_milliliter(volume_pair, :milliliter = unit) do
    {unit, get_volume(volume_pair)}
  end

  def convert(volume_pair, desired_unit) do
    volume_pair
    |> to_milliliter()
    |> from_milliliter(desired_unit)
  end
end
