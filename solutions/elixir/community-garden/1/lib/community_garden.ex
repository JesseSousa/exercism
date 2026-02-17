# Use the Plot struct as it is provided
defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  def start(opts \\ []) do
    Agent.start(fn -> %{plots: [], next_id: 1} end, opts)
  end

  def list_registrations(pid) do
    Agent.get(pid, fn state -> state.plots end)
  end

  def register(pid, register_to) do
    Agent.get_and_update(pid, fn state ->
      next_id = state.next_id
      new_plot = %Plot{plot_id: next_id, registered_to: register_to}

      state
      |> Map.put(:plots, [new_plot | state.plots])
      |> Map.put(:next_id, next_id + 1)
      |> then(&{new_plot, &1})
    end)
  end

  def release(pid, plot_id) do
    Agent.update(pid, fn state ->
      state.plots
      |> Enum.filter(&(&1.plot_id != plot_id))
      |> then(&Map.put(state, :plots, &1))
    end)
  end

  def get_registration(pid, plot_id) do
    Agent.get(pid, fn state ->
      case Enum.find(state.plots, &(&1.plot_id == plot_id)) do
        nil -> {:not_found, "plot is unregistered"}
        plot -> plot
      end
    end)
  end
end
