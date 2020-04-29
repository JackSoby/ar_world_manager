defmodule ArWorldManagerWeb.Router do
  use ArWorldManagerWeb, :router

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

  scope "/api", ArWorldManagerWeb do
    post "/create-detection-image", DetectionImageController, :create_detection_image
    get "/get-detection-images", DetectionImageController, :list_detection_images
  end


  # Other scopes may use custom stacks.
  # scope "/api", ArWorldManagerWeb do
  #   pipe_through :api
  # end
end
