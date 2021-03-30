defmodule PlusOneUpdoot.Date do
  alias PlusOneUpdoot.Counter

  def increment!(arg \\ ~D[2000-01-01]) do
    Counter.increment_date!(arg)
  end
end
