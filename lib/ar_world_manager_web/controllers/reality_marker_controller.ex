defmodule ArWorldManagerWeb.RealityMarkerController do
  use ArWorldManagerWeb, :controller
  alias ArWorldManager.RealityManager
  import Plug.Conn
require IEx
  def create_post(conn, %{"detection_image" => reality_marker}) do
    RealityManager.create_detection_image(reality_marker)
    conn
    |> send_resp(200, "marker created!")
  end

  def get_posts(conn, _params) do
    images = RealityManager.list_detection_images()

    render(conn, "index.json", detection_images: images)
  end
end
