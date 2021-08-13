defmodule Birdservice.Repo.Migrations.ChangeOrderImageColumn do
  use Ecto.Migration

  def change do
    alter table(:orders) do
      add :image_path, :string
    end
  end
end
