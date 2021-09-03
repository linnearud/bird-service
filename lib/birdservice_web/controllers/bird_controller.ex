defmodule BirdserviceWeb.BirdController do
  use BirdserviceWeb, :controller

  alias Birdservice.Birds
  alias Birdservice.Birds.Bird

  action_fallback BirdserviceWeb.FallbackController

  def index(conn, _params) do
    birds = Birds.list_birds()
    render(conn, "index.json", birds: birds)
  end

  def create(conn, %{"bird" => bird_params}) do
    with {:ok, %Bird{} = bird} <- Birds.create_bird(bird_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.bird_path(conn, :show, bird))
      |> render("show.json", bird: bird)
    end
  end

  def show_related(conn, %{"id" => id, "size" => size}) do
    birds = Birds.get_related_birds!(id, size)
    render(conn, "index.json", birds: birds)
  end

  def show(conn, %{"id" => id}) do
    bird = Birds.get_bird!(id)
    render(conn, "show.json", bird: bird)
  end

  def update(conn, %{"id" => id, "bird" => bird_params}) do
    bird = Birds.get_bird!(id)

    with {:ok, %Bird{} = bird} <- Birds.update_bird(bird, bird_params) do
      render(conn, "show.json", bird: bird)
    end
  end

  def delete(conn, %{"id" => id}) do
    bird = Birds.get_bird!(id)

    with {:ok, %Bird{}} <- Birds.delete_bird(bird) do
      send_resp(conn, :no_content, "")
    end
  end
end
