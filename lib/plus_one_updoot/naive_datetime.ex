defmodule PlusOneUpdoot.NaiveDateTime do
  alias PlusOneUpdoot.Counter

  def increment!(arg \\ ~N[2000-01-01 00:00:00.000000]) do
    Counter.increment_naive_datetime!(arg)
  end
end
