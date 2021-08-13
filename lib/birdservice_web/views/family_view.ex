defmodule BirdserviceWeb.FamilyView do
  use BirdserviceWeb, :view
  alias BirdserviceWeb.FamilyView

  def render("index.json", %{families: families}) do
    %{data: render_many(families, FamilyView, "family.json")}
  end

  def render("show.json", %{family: family}) do
    %{data: render_one(family, FamilyView, "family.json")}
  end

  def render("family.json", %{family: family}) do
    %{id: family.id,
      slug: family.slug,
      name_latin: family.name_latin,
      name_sv: family.name_sv}
  end
end
