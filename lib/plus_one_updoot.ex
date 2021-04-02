defmodule PlusOneUpdoot do
  alias PlusOneUpdoot.Atom, as: PlusOneUpdootAtom
  alias PlusOneUpdoot.Date, as: PlusOneUpdootDate
  alias PlusOneUpdoot.Email, as: PlusOneUpdootEmail
  alias PlusOneUpdoot.Integer, as: PlusOneUpdootInteger
  alias PlusOneUpdoot.Module, as: PlusOneUpdootModule
  alias PlusOneUpdoot.NaiveDateTime, as: PlusOneUpdootNaiveDateTime
  alias PlusOneUpdoot.String, as: PlusOneUpdootString

  defdelegate atom!(), to: PlusOneUpdootAtom, as: :increment!

  defdelegate atom!(arg), to: PlusOneUpdootAtom, as: :increment!

  defdelegate date!(), to: PlusOneUpdootDate, as: :increment!

  defdelegate date!(arg), to: PlusOneUpdootDate, as: :increment!

  defdelegate email!(), to: PlusOneUpdootEmail, as: :increment!

  defdelegate email!(arg), to: PlusOneUpdootEmail, as: :increment!

  defdelegate integer!(), to: PlusOneUpdootInteger, as: :increment!

  defdelegate integer!(arg), to: PlusOneUpdootInteger, as: :increment!

  defdelegate module!(), to: PlusOneUpdootModule, as: :increment!

  defdelegate module!(arg), to: PlusOneUpdootModule, as: :increment!

  defdelegate naive_datetime!(), to: PlusOneUpdootNaiveDateTime, as: :increment!

  defdelegate naive_datetime!(arg), to: PlusOneUpdootNaiveDateTime, as: :increment!

  defdelegate string!(), to: PlusOneUpdootString, as: :increment!

  defdelegate string!(arg), to: PlusOneUpdootString, as: :increment!
end
