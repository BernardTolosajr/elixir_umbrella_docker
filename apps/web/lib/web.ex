defmodule Web.Application do
  use Application
  require Logger

  def start(_type, _args) do
    port = Application.get_env(:web, :port)

    children = [
      Plug.Adapters.Cowboy.child_spec(:http, Web.HelloWorldPlug, [], port: port)
    ]

    Logger.info("Started application")

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
