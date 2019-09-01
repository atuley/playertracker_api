defmodule PlayertrackerApiWeb.PlayerView do
  use PlayertrackerApiWeb, :view

  def render("players.json", %{data: data}), do: %{players: data}
  def render("details.json", %{data: data}), do: %{details: data}
end
