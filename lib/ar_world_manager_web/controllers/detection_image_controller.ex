defmodule ArWorldManagerWeb.DetectionImageController do
  use ArWorldManagerWeb, :controller
  require IEx
  alias ArWorldManager.RealityManager

  def index(conn, _params) do
    render(conn, "index.json")
  end

  def create_detection_image(conn, %{"detection_image" => detection_image}) do
    res = RealityManager.create_detection_image(detection_image)
    IO.inspect(res)
    conn
    |> send_resp(200, "")
  end

  def list_detection_images(conn, _params) do
    detection_images = RealityManager.list_detection_images()
    IO.inspect(detection_images)

    render(conn, "index.json", %{detection_images: detection_images})
  end
end
