defmodule Ronglian.Application do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      worker(Ronglian, [])
    ]

    opts = [strategy: :one_for_one, name: Ronglian.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
