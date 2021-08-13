defmodule Birdservice.Repo.Migrations.RemoveIncorrectField do
  use Ecto.Migration

  def change do
    alter table(:subfamilies) do
      remove :families
    end
  end
end
