defmodule PlusOneUpdoot do
  alias PlusOneUpdoot.Atom, as: PlusOneUpdootAtom
  alias PlusOneUpdoot.Email, as: PlusOneUpdootEmail
  alias PlusOneUpdoot.Integer, as: PlusOneUpdootInteger
  alias PlusOneUpdoot.Module, as: PlusOneUpdootModule
  alias PlusOneUpdoot.String, as: PlusOneUpdootString

  defdelegate atom!(), to: PlusOneUpdootAtom, as: :increment!

  defdelegate atom!(arg), to: PlusOneUpdootAtom, as: :increment!

  defdelegate email!(), to: PlusOneUpdootEmail, as: :increment!

  defdelegate email!(arg), to: PlusOneUpdootEmail, as: :increment!

  defdelegate integer!(), to: PlusOneUpdootInteger, as: :increment!

  defdelegate module!(), to: PlusOneUpdootModule, as: :increment!

  defdelegate module!(arg), to: PlusOneUpdootModule, as: :increment!

  defdelegate string!(), to: PlusOneUpdootString, as: :increment!

  defdelegate string!(arg), to: PlusOneUpdootString, as: :increment!
end
