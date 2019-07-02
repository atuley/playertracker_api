defmodule PlayertrackerApi.Player do
  def all() do
    NbaEx.players()
  	|> Enum.reduce([], fn player, acc ->
      struct_player = Map.from_struct(player)

  		new_player = %{
        id: struct_player[:personId],
        firstName: struct_player[:firstName],
        lastName: struct_player[:lastName],
        number: struct_player[:jersey],
        position: struct_player[:pos],
        teamId: struct_player[:teamId],
        # triCode: "GSW",
        # teamColor: "#000",
        # teamLogo: "https://www.nba.com/assets/logos/teams/primary/web/GSW.svg",
        # player: "https://ak-static.cms.nba.com/wp-content/uploads/headshots/nba//2018/260x190/1962937917.png",
        # images: %{
        # 	player: "https://ak-static.cms.nba.com/wp-content/uploads/headshots/nba/1610612747/2018/260x190/1627826.png",
        # 	teamLogo: "https://www.nba.com/assets/logos/teams/primary/web/LAL.svg"
        # }
      }

	    [ new_player | acc ]
  	end)
  end
end
