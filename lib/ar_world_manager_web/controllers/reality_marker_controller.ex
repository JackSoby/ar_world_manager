defmodule ArWorldManagerWeb.RealityMarkerController do
  use ArWorldManagerWeb, :controller
  alias ArWorldManager.RealityManager
  import Plug.Conn

  require IEx
  def create_post(conn, %{"reality_marker" => reality_marker}) do

    RealityManager.create_reality_marker(reality_marker)
    # render(conn, "reality_marker.json")
    conn
    |> send_resp(200, "marker created!")
  end

  def get_posts(conn, _params) do
    markers = RealityManager.list_reality_markers()


    render(conn, "index.json", reality_markers: markers)
  end
end
