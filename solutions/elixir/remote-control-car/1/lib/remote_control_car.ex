defmodule RemoteControlCar do
  # Please implement the struct with the specified fields
  @enforce_keys [:nickname]
  defstruct [:nickname, distance_driven_in_meters: 0, battery_percentage: 100]

  def new() do
    %__MODULE__{
      nickname: "none"
    }
  end

  def new(nickname) do
    %__MODULE__{
      nickname: nickname
    }
  end

  def display_distance(%__MODULE__{} = remote_car) do
    "#{remote_car.distance_driven_in_meters} meters"
  end

  def display_battery(%__MODULE__{battery_percentage: 0}), do: "Battery empty"

  def display_battery(%__MODULE__{} = remote_car) do
    "Battery at #{remote_car.battery_percentage}%"
  end

  def drive(%__MODULE__{battery_percentage: 0} = remote_car), do: remote_car

  def drive(%__MODULE__{} = remote_car) do
    %{
      remote_car
      | distance_driven_in_meters: remote_car.distance_driven_in_meters + 20,
        battery_percentage: remote_car.battery_percentage - 1
    }
  end
end
