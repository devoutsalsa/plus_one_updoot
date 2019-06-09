defmodule PlusOneUpdoot.MixProject do
  use Mix.Project

  def project do
    [
      app: :plus_one_updoot,
      deps: deps(),
      description: description(),
      elixir: "~> 1.8",
      package: package(),
      start_permanent: Mix.env() == :prod,
      version: "0.1.0"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {PlusOneUpdoot.Application, []}
    ]
  end

  defp deps() do
    [
      # Doc generator
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end

  defp description() do
    "Generate incemental, unique items for testing (e.g. Foo0 -> Foo1 -> Foo2...)"
  end

  defp package() do
    [
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/amorphid/plus_one_updoot-elixir"}
    ]
  end
end
