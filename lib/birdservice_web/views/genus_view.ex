defmodule BirdserviceWeb.GenusView do
  use BirdserviceWeb, :view
  alias BirdserviceWeb.GenusView

  def render("index.json", %{genera: genera}) do
    %{data: render_many(genera, GenusView, "genus.json")}
  end

  def render("show.json", %{genus: genus}) do
    %{data: render_one(genus, GenusView, "genus.json")}
  end

  def render("genus.json", %{genus: genus}) do
    %{id: genus.id,
      slug: genus.slug,
      name_latin: genus.name_latin,
      name_sv: genus.name_sv}
  end
end
