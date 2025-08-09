defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    inventory
    |> Enum.sort_by(& &1[:price])
  end

  def with_missing_price(inventory) do
    inventory
    |> Enum.filter(&is_nil(&1[:price]))
  end

  def update_names(inventory, old_word, new_word) do
    inventory
    |> Enum.map(
      &Map.update(&1, :name, nil, fn name -> String.replace(name, old_word, new_word) end)
    )
  end

  def increase_quantity(%{quantity_by_size: quantities} = item, count) do
    quantities
    |> Map.new(fn {key, val} -> {key, val + count} end)
    |> then(&Map.put(item, :quantity_by_size, &1))
  end

  def total_quantity(item) do
    item
    |> Map.get(:quantity_by_size, %{})
    |> Enum.reduce(0, fn {_, value}, acc -> acc + value end)
  end
end
