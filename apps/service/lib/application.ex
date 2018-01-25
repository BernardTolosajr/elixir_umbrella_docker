defmodule Service.Application do
  use Application

  def start(_type, _args) do
    url = Application.get_env :service, :redis_url
    Redix.start_link(url, name: :redix)

    children = [
    ]

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end

