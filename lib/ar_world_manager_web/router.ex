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


    post "/sign_up", UserController, :create
    post "/sign_in", UserController, :sign_in
    post "/create-detection-image", DetectionImageController, :create_detection_image
    get "/get-detection-images", DetectionImageController, :list_detection_images
    post "/sign-up", UserController, :create
  end

  scope "/api/v1", ArWorldManagerWeb do
    pipe_through [:api, :jwt_authenticated]
    post "/create-like", LikeController, :create
    post "/create-comment", CommentController, :create

    get "/my-user", UserController, :show
  end




  # Other scopes may use custom stacks.
  # scope "/api", ArWorldManagerWeb do
  #   pipe_through :api
  # end
end
