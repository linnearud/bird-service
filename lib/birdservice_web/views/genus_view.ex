defmodule BirdserviceWeb.GenusView do
  use BirdserviceWeb, :view
  alias BirdserviceWeb.GenusView
  alias BirdserviceWeb.BirdView
  alias BirdserviceWeb.SubfamilyView
  alias BirdserviceWeb.FamilyView

  def render("index.json", %{genera: genera}) do
    %{data: render_many(genera, GenusView, "genus.json")}
  end

  def render("show.json", %{genus: genus}) do
    %{data: render_one(genus, GenusView, "genus.json")}
  end

  def render("genus.json", %{genus: genus}) do
    if Ecto.assoc_loaded?(genus.birds) do
      %{id: genus.id,
        slug: genus.slug,
        name_latin: genus.name_latin,
        name_sv: genus.name_sv,
        birds: render_many(genus.birds, BirdView, "bird.json"),
        subfamily: render_one(genus.subfamily, SubfamilyView, "subfamily.json"),
        family: render_one(genus.family, FamilyView, "family.json"),
      }
    else
      %{id: genus.id,
        slug: genus.slug,
        name_latin: genus.name_latin,
        name_sv: genus.name_sv,
      }
    end
  end
end
