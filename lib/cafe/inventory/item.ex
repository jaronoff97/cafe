defmodule Cafe.Inventory.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field :count, :integer
    field :name, :string
    field :price, :decimal

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:name, :price, :count])
    |> validate_required([:name, :price, :count])
    |> validate_number(:price, greater_than: 0)
  end
end
