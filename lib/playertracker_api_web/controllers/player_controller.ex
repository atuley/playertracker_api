defmodule PlayertrackerApiWeb.PlayerController do
  use PlayertrackerApiWeb, :controller
  alias PlayertrackerApi.Player
  
  def players(conn, _params) do
    render(conn, "players.json", %{data: Player.all()})
  end

  def details(conn, %{"ids" => ids}) do
    render(conn, "details.json", %{data: Player.details(ids)})
  end
end
