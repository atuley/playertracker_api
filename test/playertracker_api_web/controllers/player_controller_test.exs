defmodule PlayertrackerApiWeb.PlayerControllerTest do
  use PlayertrackerApiWeb.ConnCase

  test "GET /api/players", %{conn: conn} do
    conn = get(conn, "/api/players")
    assert json_response(conn, 200)
  end
end
