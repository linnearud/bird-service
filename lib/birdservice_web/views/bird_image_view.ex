defmodule BirdserviceWeb.BirdImageView do
  use BirdserviceWeb, :view
  alias BirdserviceWeb.BirdImageView

  def render("index.json", %{bird_images: bird_images}) do
    %{data: render_many(bird_images, BirdImageView, "bird_image.json")}
  end

  def render("show.json", %{bird_image: bird_image}) do
    %{data: render_one(bird_image, BirdImageView, "bird_image.json")}
  end

  def render("bird_image.json", %{bird_image: bird_image}) do
    %{id: bird_image.id,
      path: bird_image.path}
  end
end
