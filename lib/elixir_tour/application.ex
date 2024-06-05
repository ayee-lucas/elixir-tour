defmodule ElixirTour.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ElixirTourWeb.Telemetry,
      ElixirTour.Repo,
      {DNSCluster, query: Application.get_env(:elixir_tour, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: ElixirTour.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: ElixirTour.Finch},
      # Start a worker by calling: ElixirTour.Worker.start_link(arg)
      # {ElixirTour.Worker, arg},
      # Start to serve requests, typically the last entry
      ElixirTourWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElixirTour.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ElixirTourWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
