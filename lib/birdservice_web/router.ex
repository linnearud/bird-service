defmodule BirdserviceWeb.Router do
  use BirdserviceWeb, :router

  pipeline :static do
    plug Plug.Static,
      at: "/static",
      from: {:birdservice, "priv/static"}
  end

  scope "/", BirdserviceWeb do
    scope "/static" do
      pipe_through :static
      get "/*path", FallbackController, :notfound
    end
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", BirdserviceWeb do
    pipe_through :api

    resources "/birds", BirdController, except: [:new, :edit]
    resources "/bird_images", BirdImageController, except: [:new, :edit]
    resources "/orders", OrderController, except: [:new, :edit]
    resources "/families", FamilyController, except: [:new, :edit]
    resources "/subfamilies", SubfamilyController, except: [:new, :edit]
    resources "/genera", GenusController, except: [:new, :edit]
  end


  pipeline :browser do
    plug(:accepts, ["html"])
  end

  scope "/", BirdserviceWeb do
    pipe_through :browser
    get "/", DefaultController, :index
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: BirdserviceWeb.Telemetry
    end
  end
end
