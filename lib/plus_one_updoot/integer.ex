defmodule PlusOneUpdoot.Integer do
  alias PlusOneUpdoot.Counter

  def increment!(integer \\ 0) do
    Counter.increment_integer!(integer)
  end
end
