defmodule BirdserviceWeb.BirdImageController do
  use BirdserviceWeb, :controller

  alias Birdservice.Assets
  alias Birdservice.Assets.BirdImage

  action_fallback BirdserviceWeb.FallbackController

  def index(conn, _params) do
    bird_images = Assets.list_bird_images()
    render(conn, "index.json", bird_images: bird_images)
  end

  def create(conn, %{"bird_image" => bird_image_params}) do
    with {:ok, %BirdImage{} = bird_image} <- Assets.create_bird_image(bird_image_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.bird_image_path(conn, :show, bird_image))
      |> render("show.json", bird_image: bird_image)
    end
  end

  def show(conn, %{"id" => id}) do
    bird_image = Assets.get_bird_image!(id)
    render(conn, "show.json", bird_image: bird_image)
  end

  def update(conn, %{"id" => id, "bird_image" => bird_image_params}) do
    bird_image = Assets.get_bird_image!(id)

    with {:ok, %BirdImage{} = bird_image} <- Assets.update_bird_image(bird_image, bird_image_params) do
      render(conn, "show.json", bird_image: bird_image)
    end
  end

  def delete(conn, %{"id" => id}) do
    bird_image = Assets.get_bird_image!(id)

    with {:ok, %BirdImage{}} <- Assets.delete_bird_image(bird_image) do
      send_resp(conn, :no_content, "")
    end
  end
end
