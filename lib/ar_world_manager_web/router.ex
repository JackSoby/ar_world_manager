defmodule ArWorldManagerWeb.Router do
  use ArWorldManagerWeb, :router

  alias ArWorldManagerWeb.Guardian

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ArWorldManagerWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  pipeline :jwt_authenticated do
    plug Guardian.AuthPipeline
  end

  scope "/api/v1", ArWorldManagerWeb do
    pipe_through :api


    post "/sign-up", UserController, :create
    post "/sign-in", UserController, :sign_in

  end

  scope "/api/v1", ArWorldManagerWeb do
    pipe_through [:api, :jwt_authenticated]
    post "/create-reality-markers", RealityMarkerController, :create_post
    get "/get-reality-markers", RealityMarkerController, :get_posts
    get "/my_user", UserController, :show
  end




  # Other scopes may use custom stacks.
  # scope "/api", ArWorldManagerWeb do
  #   pipe_through :api
  # end
end
