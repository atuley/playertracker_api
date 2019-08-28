defmodule PlayertrackerApiWeb.PlayerController do
  use PlayertrackerApiWeb, :controller
  alias PlayertrackerApi.Player
  
  def players(conn, _params) do
    render(conn, "players.json", %{data: Player.all()})
  end
end
