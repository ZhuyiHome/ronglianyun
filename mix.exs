defmodule Ronglian.Mixfile do
  use Mix.Project

  @version "0.2.0"

  def project do
    [app: :ronglian,
     version: @version,
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description(),
     package: package(),
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger, :poison, :sweet_xml],
     mod: {Ronglian.Application, []}]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:httpoison, "~> 0.10"},
     {:inflex, "~> 1.8.1"},
     {:poison, "~> 2.2"},
     {:sweet_xml, "~> 0.6.5"},
     {:ex_doc, ">= 0.0.0", only: :dev},
     {:timex, "~> 3.0"},]
  end

  defp package do
    [# These are the default files included in the package
      name: :ronglian,
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Wade Xing"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/ZhuyiHome/ronglianyun"}]
  end

  defp description do
    """
    容联云 Elixir Client
    """
  end
end
