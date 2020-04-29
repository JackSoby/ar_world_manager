defmodule ArWorldManagerWeb.PageController do
  use ArWorldManagerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
