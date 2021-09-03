defmodule BirdserviceWeb.BirdView do
  use BirdserviceWeb, :view
  alias BirdserviceWeb.BirdView
  alias BirdserviceWeb.BirdImageView
  alias BirdserviceWeb.GenusView

  def render("index.json", %{birds: birds}) do
    %{data: render_many(birds, BirdView, "bird.json")}
  end

  def render("show.json", %{bird: bird}) do
    %{data: render_one(bird, BirdView, "bird.json")}
  end

  def render("bird.json", %{bird: bird}) do
    #TODO: Remove
    if Map.has_key?(bird, :related) do 
      %{
        bird: render_one(bird.bird_data, BirdView, "bird.json"),
        priority: bird.priority,
      }
    else
      if Ecto.assoc_loaded?(bird.images) && Ecto.assoc_loaded?(bird.genus) do
        %{id: bird.id,
          slug: bird.slug,
          name_sv: bird.name_sv,
          name_latin: bird.name_latin,
          name_en: bird.name_en,
          characteristics: bird.characteristics,
          spread: bird.spread,
          link: bird.link,
          hunt: bird.hunt,
          images: render_many(bird.images, BirdImageView, "bird_image.json"),
          genus: render_one(bird.genus, GenusView, "genus.json"),
        }
      else
        %{id: bird.id,
          slug: bird.slug,
          name_sv: bird.name_sv,
          name_latin: bird.name_latin,
          name_en: bird.name_en,
          characteristics: bird.characteristics,
          spread: bird.spread,
          link: bird.link,
          hunt: bird.hunt,
        }
      end
    end
  end
end
