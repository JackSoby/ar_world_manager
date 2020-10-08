defmodule ArWorldManagerWeb.LikeController do
  use ArWorldManagerWeb, :controller
  require IEx
  alias ArWorldManager.RealityManager


  def create(conn, %{"like" => like}) do
    res = RealityManager.create_like(like)

    conn
    |> send_resp(200, "")
  end
end
