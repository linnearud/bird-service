defmodule Birdservice.Birds do
  @moduledoc """
  The Birds context.
  """

  import Ecto.Query, warn: false
  alias Birdservice.Repo

  alias Birdservice.Birds.Bird

  @doc """
  Returns the list of birds.

  ## Examples

      iex> list_birds()
      [%Bird{}, ...]

  """
  def list_birds do
    birds = Repo.all(Bird) |> Repo.preload([:images, :genus])
  end

  @doc """
  Gets a single bird.

  Raises `Ecto.NoResultsError` if the Bird does not exist.

  ## Examples

      iex> get_bird!(123)
      %Bird{}

      iex> get_bird!(456)
      ** (Ecto.NoResultsError)

  """
  def get_bird!(id) do
    bird = Repo.get!(Bird, id) |> Repo.preload([:images, :genus])
  end

  @doc """
  Creates a bird.

  ## Examples

      iex> create_bird(%{field: value})
      {:ok, %Bird{}}

      iex> create_bird(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_bird(attrs \\ %{}) do
    %Bird{}
    |> Bird.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a bird.

  ## Examples

      iex> update_bird(bird, %{field: new_value})
      {:ok, %Bird{}}

      iex> update_bird(bird, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_bird(%Bird{} = bird, attrs) do
    bird
    |> Bird.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a bird.

  ## Examples

      iex> delete_bird(bird)
      {:ok, %Bird{}}

      iex> delete_bird(bird)
      {:error, %Ecto.Changeset{}}

  """
  def delete_bird(%Bird{} = bird) do
    Repo.delete(bird)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking bird changes.

  ## Examples

      iex> change_bird(bird)
      %Ecto.Changeset{data: %Bird{}}

  """
  def change_bird(%Bird{} = bird, attrs \\ %{}) do
    Bird.changeset(bird, attrs)
  end

  alias Birdservice.Birds.Order

  @doc """
  Returns the list of orders.

  ## Examples

      iex> list_orders()
      [%Order{}, ...]

  """
  def list_orders do
    Repo.all(Order)
  end

  @doc """
  Gets a single order.

  Raises `Ecto.NoResultsError` if the Order does not exist.

  ## Examples

      iex> get_order!(123)
      %Order{}

      iex> get_order!(456)
      ** (Ecto.NoResultsError)

  """
  def get_order!(id), do: Repo.get!(Order, id)

  @doc """
  Creates a order.

  ## Examples

      iex> create_order(%{field: value})
      {:ok, %Order{}}

      iex> create_order(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_order(attrs \\ %{}) do
    %Order{}
    |> Order.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a order.

  ## Examples

      iex> update_order(order, %{field: new_value})
      {:ok, %Order{}}

      iex> update_order(order, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_order(%Order{} = order, attrs) do
    order
    |> Order.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a order.

  ## Examples

      iex> delete_order(order)
      {:ok, %Order{}}

      iex> delete_order(order)
      {:error, %Ecto.Changeset{}}

  """
  def delete_order(%Order{} = order) do
    Repo.delete(order)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking order changes.

  ## Examples

      iex> change_order(order)
      %Ecto.Changeset{data: %Order{}}

  """
  def change_order(%Order{} = order, attrs \\ %{}) do
    Order.changeset(order, attrs)
  end

  alias Birdservice.Birds.Family

  @doc """
  Returns the list of families.

  ## Examples

      iex> list_families()
      [%Family{}, ...]

  """
  def list_families do
    Repo.all(Family)
  end

  @doc """
  Gets a single family.

  Raises `Ecto.NoResultsError` if the Family does not exist.

  ## Examples

      iex> get_family!(123)
      %Family{}

      iex> get_family!(456)
      ** (Ecto.NoResultsError)

  """
  def get_family!(id), do: Repo.get!(Family, id)

  @doc """
  Creates a family.

  ## Examples

      iex> create_family(%{field: value})
      {:ok, %Family{}}

      iex> create_family(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_family(attrs \\ %{}) do
    %Family{}
    |> Family.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a family.

  ## Examples

      iex> update_family(family, %{field: new_value})
      {:ok, %Family{}}

      iex> update_family(family, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_family(%Family{} = family, attrs) do
    family
    |> Family.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a family.

  ## Examples

      iex> delete_family(family)
      {:ok, %Family{}}

      iex> delete_family(family)
      {:error, %Ecto.Changeset{}}

  """
  def delete_family(%Family{} = family) do
    Repo.delete(family)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking family changes.

  ## Examples

      iex> change_family(family)
      %Ecto.Changeset{data: %Family{}}

  """
  def change_family(%Family{} = family, attrs \\ %{}) do
    Family.changeset(family, attrs)
  end

  alias Birdservice.Birds.Subfamily

  @doc """
  Returns the list of subfamilies.

  ## Examples

      iex> list_subfamilies()
      [%Subfamily{}, ...]

  """
  def list_subfamilies do
    Repo.all(Subfamily)
  end

  @doc """
  Gets a single subfamily.

  Raises `Ecto.NoResultsError` if the Subfamily does not exist.

  ## Examples

      iex> get_subfamily!(123)
      %Subfamily{}

      iex> get_subfamily!(456)
      ** (Ecto.NoResultsError)

  """
  def get_subfamily!(id), do: Repo.get!(Subfamily, id)

  @doc """
  Creates a subfamily.

  ## Examples

      iex> create_subfamily(%{field: value})
      {:ok, %Subfamily{}}

      iex> create_subfamily(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_subfamily(attrs \\ %{}) do
    %Subfamily{}
    |> Subfamily.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a subfamily.

  ## Examples

      iex> update_subfamily(subfamily, %{field: new_value})
      {:ok, %Subfamily{}}

      iex> update_subfamily(subfamily, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_subfamily(%Subfamily{} = subfamily, attrs) do
    subfamily
    |> Subfamily.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a subfamily.

  ## Examples

      iex> delete_subfamily(subfamily)
      {:ok, %Subfamily{}}

      iex> delete_subfamily(subfamily)
      {:error, %Ecto.Changeset{}}

  """
  def delete_subfamily(%Subfamily{} = subfamily) do
    Repo.delete(subfamily)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking subfamily changes.

  ## Examples

      iex> change_subfamily(subfamily)
      %Ecto.Changeset{data: %Subfamily{}}

  """
  def change_subfamily(%Subfamily{} = subfamily, attrs \\ %{}) do
    Subfamily.changeset(subfamily, attrs)
  end

  alias Birdservice.Birds.Genus

  @doc """
  Returns the list of genera.

  ## Examples

      iex> list_genera()
      [%Genus{}, ...]

  """
  def list_genera do
    Repo.all(Genus)
  end

  @doc """
  Gets a single genus.

  Raises `Ecto.NoResultsError` if the Genus does not exist.

  ## Examples

      iex> get_genus!(123)
      %Genus{}

      iex> get_genus!(456)
      ** (Ecto.NoResultsError)

  """
  def get_genus!(id), do: Repo.get!(Genus, id)

  @doc """
  Creates a genus.

  ## Examples

      iex> create_genus(%{field: value})
      {:ok, %Genus{}}

      iex> create_genus(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_genus(attrs \\ %{}) do
    %Genus{}
    |> Genus.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a genus.

  ## Examples

      iex> update_genus(genus, %{field: new_value})
      {:ok, %Genus{}}

      iex> update_genus(genus, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_genus(%Genus{} = genus, attrs) do
    genus
    |> Genus.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a genus.

  ## Examples

      iex> delete_genus(genus)
      {:ok, %Genus{}}

      iex> delete_genus(genus)
      {:error, %Ecto.Changeset{}}

  """
  def delete_genus(%Genus{} = genus) do
    Repo.delete(genus)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking genus changes.

  ## Examples

      iex> change_genus(genus)
      %Ecto.Changeset{data: %Genus{}}

  """
  def change_genus(%Genus{} = genus, attrs \\ %{}) do
    Genus.changeset(genus, attrs)
  end
end
