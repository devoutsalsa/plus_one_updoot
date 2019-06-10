defmodule PlusOneUpdoot do
  alias PlusOneUpdoot.Atom, as: PlusOneUpdootAtom
  alias PlusOneUpdoot.Email, as: PlusOneUpdootEmail
  alias PlusOneUpdoot.Module, as: PlusOneUpdootModule

  defdelegate atom!(), to: PlusOneUpdootAtom, as: :increment!

  defdelegate atom!(arg), to: PlusOneUpdootAtom, as: :increment!

  defdelegate email!(), to: PlusOneUpdootEmail, as: :increment!

  defdelegate email!(arg), to: PlusOneUpdootEmail, as: :increment!

  defdelegate module!(), to: PlusOneUpdootModule, as: :increment!

  defdelegate module!(arg), to: PlusOneUpdootModule, as: :increment!
end
