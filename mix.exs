defmodule PlusOneUpdoot.MixProject do
  use Mix.Project

  def project do
    [
      app: :plus_one_updoot,
      deps: deps(),
      description: description(),
      elixir: "~> 1.8",
      homepage_url: github_url(),
      package: package(),
      source_url: github_url(),
      start_permanent: Mix.env() == :prod,
      version: "0.3.0"
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

  def github_url() do
    "https://github.com/devoutsalsa/plus_one_updoot"
  end

  defp description() do
    "Generate fake, incemental, unique values for testing (e.g. Foo0 -> Foo1 -> Foo2...)"
  end

  defp package() do
    [
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => github_url()},
      maintainers: ["Michael Pope"],
      name: "plus_one_updoot"
    ]
  end
end
