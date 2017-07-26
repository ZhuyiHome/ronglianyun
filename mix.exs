defmodule Ronglianyun.Mixfile do
  use Mix.Project

  def project do
    [app: :ronglianyun,
     version: "0.1.0",
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
    [extra_applications: [:logger, :httpoison, :poison, :sweet_xml],
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
     {:inflex, "~> 1.8.0"},
     {:poison, "~> 2.2.0"},
     {:sweet_xml, "~> 0.6.3"},
     {:timex, "~> 3.0"},
     {:ex_doc, ">= 0.0.0", only: :dev}  ]
  end

  defp package do
    [# These are the default files included in the package
      name: :ronglianyun,
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Wade Xing"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/ZhuyiHome/ronglianyun"}]
  end

  defp description do
    """
    Send voice verification code via Ronglianyun (容联云通讯)
    """
  end
end
