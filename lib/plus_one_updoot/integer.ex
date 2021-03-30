defmodule PlusOneUpdoot.Integer do
  alias PlusOneUpdoot.Counter

  def increment!() do
    Counter.increment_integer!()
  end
end
