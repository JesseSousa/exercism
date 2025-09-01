defmodule TakeANumber do
  def start() do
    spawn(fn ->
      loop()
    end)
  end

  defp loop(message \\ 0) do
    receive do
      {:report_state, sender_pid} ->
        send(sender_pid, message)
        loop(message)

      {:take_a_number, sender_pid} ->
        send(sender_pid, message + 1)
        loop(message + 1)

      :stop ->
        nil

      number ->
        loop(message)
        number
    end
  end
end
