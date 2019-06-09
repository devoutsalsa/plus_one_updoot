defmodule PlusOneUpdoot do
  alias PlusOneUpdoot.Atom, as: PlusOneUpdootAtom
  alias PlusOneUpdoot.Module, as: PlusOneUpdootModule

  defdelegate atom!(), to: PlusOneUpdootAtom, as: :increment!

  defdelegate atom!(arg), to: PlusOneUpdootAtom, as: :increment!

  defdelegate module!(), to: PlusOneUpdootModule, as: :increment!

  defdelegate module!(arg), to: PlusOneUpdootModule, as: :increment!
end
