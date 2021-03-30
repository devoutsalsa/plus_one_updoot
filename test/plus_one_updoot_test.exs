defmodule PlusOneUpdootTest do
  use ExUnit.Case, async: true
  alias PlusOneUpdoot.RuntimeError, as: PlusOneUpdootRuntimeError

  doctest PlusOneUpdoot

  describe "&atom!/1" do
    test "has a default" do
      default = :totes_unique_atom_i_swear
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

  describe "&date!/1" do
    test "has a default" do
      actual = PlusOneUpdoot.date!()
      expected = ~D[2000-01-01]
      assert actual == expected
    end

    test "iterates dates" do
      base_atom = ~D[2004-01-01]
      assert PlusOneUpdoot.date!(base_atom) == ~D[2004-01-01]
      assert PlusOneUpdoot.date!(base_atom) == ~D[2004-01-02]
      assert PlusOneUpdoot.date!(base_atom) == ~D[2004-01-03]
    end
  end

  describe "&email!/1" do
    test "has a default" do
      default = %PlusOneUpdoot.Email{}
      actual = PlusOneUpdoot.email!()
      expected = default.local_part <> "0" <> "@" <> default.domain
      assert actual == expected
    end

    test "iterates emails" do
      local_part = "jorge-"
      domain = "mctacobox.com"
      base_email = %PlusOneUpdoot.Email{local_part: local_part, domain: domain}
      assert PlusOneUpdoot.email!(base_email) == "#{local_part}0@#{domain}"
      assert PlusOneUpdoot.email!(base_email) == "#{local_part}1@#{domain}"
      assert PlusOneUpdoot.email!(base_email) == "#{local_part}2@#{domain}"
    end
  end

  describe "&integer!/0" do
    test "iterates integers" do
      assert PlusOneUpdoot.integer!() == 0
      assert PlusOneUpdoot.integer!() == 1
      assert PlusOneUpdoot.integer!() == 2
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

      true = is_atom(ExistingAtomModule2)
      func = fn -> PlusOneUpdoot.module!(ExistingAtomModule) end

      error =
        "ExistingAtomModule2 is an EXISTING ATOM.  Use better fake module to generate a NONEXISTENT ATOM."

      assert_raise PlusOneUpdootRuntimeError, error, func
    end
  end

  describe "&string!/1" do
    test "has a default" do
      default = "absolutely-the-most-amazing-default-string-of-all-time"
      actual = PlusOneUpdoot.string!()
      expected = default <> "0"
      assert actual == expected
    end

    test "iterates strings" do
      boring_string = "my-test-string-could-be-4-times-more-clever"
      base_string = boring_string <> "-clever-clever-clever"
      assert PlusOneUpdoot.string!(base_string) == base_string <> "0"
      assert PlusOneUpdoot.string!(base_string) == base_string <> "1"
      assert PlusOneUpdoot.string!(base_string) == base_string <> "2"
    end
  end
end
