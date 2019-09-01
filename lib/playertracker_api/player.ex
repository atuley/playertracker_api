defmodule PlayertrackerApi.Player do
  def all() do
    fetch_all_players()
    |> filter_out_non_franchise_players()
    |> trim_player_payload()
  end

  def details(ids) do
    %{name: "Steph"}
  end

  defp fetch_all_players() do
    %{"league" => %{"standard" => players}} =
      HTTPoison.get!("http://data.nba.net/prod/v1/2019/players.json")
      |> Map.get(:body)
      |> Jason.decode!()

    players
  end

  defp fetch_team_info() do
    %{"teams" => %{"config" => team_info}} =
      HTTPoison.get!("http://data.nba.net/prod/2019/teams_config.json")
      |> Map.get(:body)
      |> Jason.decode!()

    team_info
  end

  defp trim_player_payload(payload) do
    team_info = fetch_team_info()

    payload
    |> Enum.reduce([], fn player, acc ->
      player_team_info = team_info |> find_team_info(player)

      trimmed_player = %{
        id: player["personId"],
        firstName: player["firstName"],
        lastName: player["lastName"],
        number: player["jersey"],
        position: player["pos"],
        teamId: player["teamId"],
        tricode: player_team_info["tricode"],
        teamColor: player_team_info["primaryColor"]
      }

      [trimmed_player | acc]
    end)
  end

  defp find_team_info(team_info, player),
    do: Enum.find(team_info, fn team -> team["teamId"] == player["teamId"] end)

  def filter_out_non_franchise_players(players),
    do:
      Enum.filter(players, fn player ->
        player["teamId"] != "" && player["jersey"] != ""
      end)
end
