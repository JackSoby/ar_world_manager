defmodule ArWorldManagerWeb.CommentController do
  use ArWorldManagerWeb, :controller
  require IEx
  alias ArWorldManager.RealityManager


  def create(conn, %{"comment" => comment}) do
    res = RealityManager.create_comment(comment)

    conn
    |> send_resp(200, "")
  end
end
