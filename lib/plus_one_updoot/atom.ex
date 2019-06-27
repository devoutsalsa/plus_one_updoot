defmodule PlusOneUpdoot.Atom do
  alias PlusOneUpdoot.Counter

  def increment!(arg \\ :totes_unique_atom_i_swear) when is_atom(arg) do
    Counter.increment_atom!(arg)
  end
end
