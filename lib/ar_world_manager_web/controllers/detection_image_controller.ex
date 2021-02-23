defmodule ArWorldManagerWeb.DetectionImageController do
  use ArWorldManagerWeb, :controller
  alias ArWorldManager.RealityManager
  import Plug.Conn
require IEx
  def create_detection_image(conn, %{"detection_image" => reality_marker}) do
    res = RealityManager.create_detection_image(reality_marker)

    conn
    |> send_resp(200, "marker created!")
  end

  def list_detection_images(conn, _params) do
    markers = RealityManager.list_detection_images()

    render(conn, "index.json", detection_images: markers)
  end
end
