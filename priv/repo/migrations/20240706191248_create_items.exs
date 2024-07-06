defmodule Cafe.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :name, :string
      add :price, :decimal
      add :count, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
