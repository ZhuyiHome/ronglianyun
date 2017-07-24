defmodule Ronglianyun.Mixfile do
  use Mix.Project

  def project do
    [app: :ronglianyun,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger, :poison, :sweet_xml],
     mod: {Ronglianyun.Application, []}]
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
    [{:httpoison, "~> 0.10.0"},
     {:inflex, "~> 1.8.1"},
     {:poison, "~> 3.1"},
     {:sweet_xml, "~> 0.6.5"},
     {:timex, "~> 3.0"},]
  end
end
