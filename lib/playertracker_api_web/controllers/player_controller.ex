defmodule PlayertrackerApiWeb.PlayerController do
  use PlayertrackerApiWeb, :controller

  def players(conn, _params) do
    render(conn, "players.json", %{data: %{}})
  end
end
