defmodule PlayertrackerApi.PlayerTest do
  use ExUnit.Case, async: false

  alias PlayertrackerApi.Player

  describe "all/0" do
    test "should return all franchise NBA players" do
      players = Player.all()
      first_player = players |> List.first()

      assert first_player == %{
                                firstName: "Ivica",
                                id: "1627826",
                                lastName: "Zubac",
                                number: "40",
                                position: "C",
                                teamId: "1610612746",
                                teamColor: "#ed174b",
                                tricode: "LAC"
                              }
      assert players |> length == 382
    end
  end

  describe "details/1" do
    test "should return details for players last played game" do
      assert Player.details(["1"]) == %{
                                        firstName: "Ivica",
                                        id: "1627826",
                                        lastName: "Zubac",
                                        number: "40",
                                        position: "C",
                                        teamId: "1610612746",
                                        teamColor: "#ed174b",
                                        tricode: "LAC",
                                        points: "32",
                                        assists: "8",
                                        rebounds: "9",
                                        steals: "1",
                                        blocks: "1",
                                        turnovers: "3",
                                        minutes: "10"
                                      }
    end
  end
end
