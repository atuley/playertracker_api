defmodule PlayertrackerApiWeb.PlayerView do
  use PlayertrackerApiWeb, :view

  def render("players.json", %{data: data}), do: %{players: data}
end
