defmodule FreelancerRates do
  @working_hours_per_day 8
  @billable_days 22

  def daily_rate(hourly_rate) do
    @working_hours_per_day * hourly_rate / 1
  end

  def apply_discount(before_discount, discount) do
    before_discount - discount / 100 * before_discount
  end

  def monthly_rate(hourly_rate, discount) do
    (@billable_days * apply_discount(daily_rate(hourly_rate), discount))
    |> Float.ceil()
    |> trunc()
  end

  def days_in_budget(budget, hourly_rate, discount) do
    (budget / apply_discount(daily_rate(hourly_rate), discount))
    |> Float.floor(1)
  end
end
