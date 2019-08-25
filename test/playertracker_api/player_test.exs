defmodule PlayertrackerApi.PlayerTest do
  use ExUnit.Case, async: false

  alias PlayertrackerApi.Player

  describe "all/0" do
    test "should return all franchise NBA players" do
      first_player = Player.all() |> List.first()
      |> IO.inspect

      assert first_player.id == "1627826"
      assert first_player.firstName == "Ivica"
      assert first_player.lastName == "Zubac"
      assert first_player.number == "40"
      assert first_player.position == "C"
      assert first_player.tricode == "GSW"
      assert first_player.teamColor == "#000"
      
      assert Player.all() |> length == 499
    end
  end
end
