defmodule PlayertrackerApiWeb.Router do
  use PlayertrackerApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PlayertrackerApiWeb do
    pipe_through :api
  end
end
