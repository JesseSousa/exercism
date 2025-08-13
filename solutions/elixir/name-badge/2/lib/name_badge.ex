defmodule NameBadge do
  def print(id, name, department) do
    ""
    |> Kernel.<>(if id, do: "[#{id}] - ", else: "")
    |> Kernel.<>("#{name} - ")
    |> Kernel.<>(String.upcase(department || "owner"))
  end
end
