defmodule Birdservice.Repo.Migrations.CreateBirdImages do
  use Ecto.Migration

  def change do
    create table(:bird_images) do
      add :path, :string

      timestamps()
    end

  end
end
