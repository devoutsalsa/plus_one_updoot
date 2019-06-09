defmodule PlusOneUpdootTest do
  use ExUnit.Case, async: true
  alias PlusOneUpdoot.RuntimeError, as: PlusOneUpdootRuntimeError

  doctest PlusOneUpdoot

  describe "&atom!/1" do
    test "has a default" do
      default = 
        :attributes
        |> PlusOneUpdoot.Atom.__info__()
        |> Keyword.fetch!(:element)
        |> case do 
          [element] -> 
            element
        end
      actual = PlusOneUpdoot.atom!()
      expected = :"#{default}0"
      assert actual == expected
    end

    test "iterates atoms" do
      base_atom = :unobtanium
      assert PlusOneUpdoot.atom!(base_atom) == :"#{base_atom}0"
      assert PlusOneUpdoot.atom!(base_atom) == :"#{base_atom}1"
      assert PlusOneUpdoot.atom!(base_atom) == :"#{base_atom}2"
    end
  end

  describe "&module!/1" do
    test "iterates fake module names" do
      # FakeModule is also the default arg
      fake_module0 = PlusOneUpdoot.module!(FakeModule)
      assert is_atom(fake_module0)
      # converting atom to string is required to avoid raising an error in test
      # an error is raise if the returned atom existed before function returns
      assert "Elixir.FakeModule0" == Atom.to_string(fake_module0)

      assert "Elixir.FakeModule1" ==
               FakeModule
               |> PlusOneUpdoot.module!()
               |> Atom.to_string()

      assert "Elixir.FakeModule2" ==
               FakeModule
               |> PlusOneUpdoot.module!()
               |> Atom.to_string()
    end

    test "raises error when arg is already a module" do
      Code.eval_string("defmodule ArgIsAlreadyModule do ; end")
      error = "ArgIsAlreadyModule is a REAL module.  Use a FAKE module."
      func = fn -> PlusOneUpdoot.module!(ArgIsAlreadyModule) end
      assert_raise PlusOneUpdootRuntimeError, error, func
    end

    test "raises error when atom already exists" do
      assert "Elixir.ExistingAtomModule0" ==
               ExistingAtomModule
               |> PlusOneUpdoot.module!()
               |> Atom.to_string()

      assert "Elixir.ExistingAtomModule1" ==
               ExistingAtomModule
               |> PlusOneUpdoot.module!()
               |> Atom.to_string()

      # the next iteration of ExistingAtomModuleXXX is ExistingAtomModule2
      true = is_atom(ExistingAtomModule2)
      func = fn -> PlusOneUpdoot.module!(ExistingAtomModule) end

      error =
        "ExistingAtomModule2 is an EXISTING ATOM.  Use better fake module to generate a NONEXISTENT ATOM."

      assert_raise PlusOneUpdootRuntimeError, error, func
    end
  end
end
