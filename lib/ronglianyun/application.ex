defmodule Ronglianyun.Application do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      worker(Ronglianyun, [])
    ]

    opts = [strategy: :one_for_one, name: Ronglianyun.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
