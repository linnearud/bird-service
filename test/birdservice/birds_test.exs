defmodule Birdservice.BirdsTest do
  use Birdservice.DataCase

  alias Birdservice.Birds

  describe "birds" do
    alias Birdservice.Birds.Bird

    @valid_attrs %{characteristics: "some characteristics", hunt: "some hunt", link: "some link", name_en: "some name_en", name_latin: "some name_latin", name_sv: "some name_sv", slug: "some slug", spread: "some spread"}
    @update_attrs %{characteristics: "some updated characteristics", hunt: "some updated hunt", link: "some updated link", name_en: "some updated name_en", name_latin: "some updated name_latin", name_sv: "some updated name_sv", slug: "some updated slug", spread: "some updated spread"}
    @invalid_attrs %{characteristics: nil, hunt: nil, link: nil, name_en: nil, name_latin: nil, name_sv: nil, slug: nil, spread: nil}

    def bird_fixture(attrs \\ %{}) do
      {:ok, bird} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Birds.create_bird()

      bird
    end

    test "list_birds/0 returns all birds" do
      bird = bird_fixture()
      assert Birds.list_birds() == [bird]
    end

    test "get_bird!/1 returns the bird with given id" do
      bird = bird_fixture()
      assert Birds.get_bird!(bird.id) == bird
    end

    test "create_bird/1 with valid data creates a bird" do
      assert {:ok, %Bird{} = bird} = Birds.create_bird(@valid_attrs)
      assert bird.characteristics == "some characteristics"
      assert bird.hunt == "some hunt"
      assert bird.link == "some link"
      assert bird.name_en == "some name_en"
      assert bird.name_latin == "some name_latin"
      assert bird.name_sv == "some name_sv"
      assert bird.slug == "some slug"
      assert bird.spread == "some spread"
    end

    test "create_bird/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Birds.create_bird(@invalid_attrs)
    end

    test "update_bird/2 with valid data updates the bird" do
      bird = bird_fixture()
      assert {:ok, %Bird{} = bird} = Birds.update_bird(bird, @update_attrs)
      assert bird.characteristics == "some updated characteristics"
      assert bird.hunt == "some updated hunt"
      assert bird.link == "some updated link"
      assert bird.name_en == "some updated name_en"
      assert bird.name_latin == "some updated name_latin"
      assert bird.name_sv == "some updated name_sv"
      assert bird.slug == "some updated slug"
      assert bird.spread == "some updated spread"
    end

    test "update_bird/2 with invalid data returns error changeset" do
      bird = bird_fixture()
      assert {:error, %Ecto.Changeset{}} = Birds.update_bird(bird, @invalid_attrs)
      assert bird == Birds.get_bird!(bird.id)
    end

    test "delete_bird/1 deletes the bird" do
      bird = bird_fixture()
      assert {:ok, %Bird{}} = Birds.delete_bird(bird)
      assert_raise Ecto.NoResultsError, fn -> Birds.get_bird!(bird.id) end
    end

    test "change_bird/1 returns a bird changeset" do
      bird = bird_fixture()
      assert %Ecto.Changeset{} = Birds.change_bird(bird)
    end
  end

  describe "orders" do
    alias Birdservice.Birds.Order

    @valid_attrs %{name_latin: "some name_latin", name_sv: "some name_sv", slug: "some slug"}
    @update_attrs %{name_latin: "some updated name_latin", name_sv: "some updated name_sv", slug: "some updated slug"}
    @invalid_attrs %{name_latin: nil, name_sv: nil, slug: nil}

    def order_fixture(attrs \\ %{}) do
      {:ok, order} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Birds.create_order()

      order
    end

    test "list_orders/0 returns all orders" do
      order = order_fixture()
      assert Birds.list_orders() == [order]
    end

    test "get_order!/1 returns the order with given id" do
      order = order_fixture()
      assert Birds.get_order!(order.id) == order
    end

    test "create_order/1 with valid data creates a order" do
      assert {:ok, %Order{} = order} = Birds.create_order(@valid_attrs)
      assert order.name_latin == "some name_latin"
      assert order.name_sv == "some name_sv"
      assert order.slug == "some slug"
    end

    test "create_order/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Birds.create_order(@invalid_attrs)
    end

    test "update_order/2 with valid data updates the order" do
      order = order_fixture()
      assert {:ok, %Order{} = order} = Birds.update_order(order, @update_attrs)
      assert order.name_latin == "some updated name_latin"
      assert order.name_sv == "some updated name_sv"
      assert order.slug == "some updated slug"
    end

    test "update_order/2 with invalid data returns error changeset" do
      order = order_fixture()
      assert {:error, %Ecto.Changeset{}} = Birds.update_order(order, @invalid_attrs)
      assert order == Birds.get_order!(order.id)
    end

    test "delete_order/1 deletes the order" do
      order = order_fixture()
      assert {:ok, %Order{}} = Birds.delete_order(order)
      assert_raise Ecto.NoResultsError, fn -> Birds.get_order!(order.id) end
    end

    test "change_order/1 returns a order changeset" do
      order = order_fixture()
      assert %Ecto.Changeset{} = Birds.change_order(order)
    end
  end

  describe "families" do
    alias Birdservice.Birds.Family

    @valid_attrs %{name_latin: "some name_latin", name_sv: "some name_sv", slug: "some slug"}
    @update_attrs %{name_latin: "some updated name_latin", name_sv: "some updated name_sv", slug: "some updated slug"}
    @invalid_attrs %{name_latin: nil, name_sv: nil, slug: nil}

    def family_fixture(attrs \\ %{}) do
      {:ok, family} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Birds.create_family()

      family
    end

    test "list_families/0 returns all families" do
      family = family_fixture()
      assert Birds.list_families() == [family]
    end

    test "get_family!/1 returns the family with given id" do
      family = family_fixture()
      assert Birds.get_family!(family.id) == family
    end

    test "create_family/1 with valid data creates a family" do
      assert {:ok, %Family{} = family} = Birds.create_family(@valid_attrs)
      assert family.name_latin == "some name_latin"
      assert family.name_sv == "some name_sv"
      assert family.slug == "some slug"
    end

    test "create_family/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Birds.create_family(@invalid_attrs)
    end

    test "update_family/2 with valid data updates the family" do
      family = family_fixture()
      assert {:ok, %Family{} = family} = Birds.update_family(family, @update_attrs)
      assert family.name_latin == "some updated name_latin"
      assert family.name_sv == "some updated name_sv"
      assert family.slug == "some updated slug"
    end

    test "update_family/2 with invalid data returns error changeset" do
      family = family_fixture()
      assert {:error, %Ecto.Changeset{}} = Birds.update_family(family, @invalid_attrs)
      assert family == Birds.get_family!(family.id)
    end

    test "delete_family/1 deletes the family" do
      family = family_fixture()
      assert {:ok, %Family{}} = Birds.delete_family(family)
      assert_raise Ecto.NoResultsError, fn -> Birds.get_family!(family.id) end
    end

    test "change_family/1 returns a family changeset" do
      family = family_fixture()
      assert %Ecto.Changeset{} = Birds.change_family(family)
    end
  end

  describe "subfamilies" do
    alias Birdservice.Birds.Subfamily

    @valid_attrs %{families: "some families", name_latin: "some name_latin", name_sv: "some name_sv", slug: "some slug"}
    @update_attrs %{families: "some updated families", name_latin: "some updated name_latin", name_sv: "some updated name_sv", slug: "some updated slug"}
    @invalid_attrs %{families: nil, name_latin: nil, name_sv: nil, slug: nil}

    def subfamily_fixture(attrs \\ %{}) do
      {:ok, subfamily} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Birds.create_subfamily()

      subfamily
    end

    test "list_subfamilies/0 returns all subfamilies" do
      subfamily = subfamily_fixture()
      assert Birds.list_subfamilies() == [subfamily]
    end

    test "get_subfamily!/1 returns the subfamily with given id" do
      subfamily = subfamily_fixture()
      assert Birds.get_subfamily!(subfamily.id) == subfamily
    end

    test "create_subfamily/1 with valid data creates a subfamily" do
      assert {:ok, %Subfamily{} = subfamily} = Birds.create_subfamily(@valid_attrs)
      assert subfamily.families == "some families"
      assert subfamily.name_latin == "some name_latin"
      assert subfamily.name_sv == "some name_sv"
      assert subfamily.slug == "some slug"
    end

    test "create_subfamily/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Birds.create_subfamily(@invalid_attrs)
    end

    test "update_subfamily/2 with valid data updates the subfamily" do
      subfamily = subfamily_fixture()
      assert {:ok, %Subfamily{} = subfamily} = Birds.update_subfamily(subfamily, @update_attrs)
      assert subfamily.families == "some updated families"
      assert subfamily.name_latin == "some updated name_latin"
      assert subfamily.name_sv == "some updated name_sv"
      assert subfamily.slug == "some updated slug"
    end

    test "update_subfamily/2 with invalid data returns error changeset" do
      subfamily = subfamily_fixture()
      assert {:error, %Ecto.Changeset{}} = Birds.update_subfamily(subfamily, @invalid_attrs)
      assert subfamily == Birds.get_subfamily!(subfamily.id)
    end

    test "delete_subfamily/1 deletes the subfamily" do
      subfamily = subfamily_fixture()
      assert {:ok, %Subfamily{}} = Birds.delete_subfamily(subfamily)
      assert_raise Ecto.NoResultsError, fn -> Birds.get_subfamily!(subfamily.id) end
    end

    test "change_subfamily/1 returns a subfamily changeset" do
      subfamily = subfamily_fixture()
      assert %Ecto.Changeset{} = Birds.change_subfamily(subfamily)
    end
  end

  describe "genera" do
    alias Birdservice.Birds.Genus

    @valid_attrs %{name_latin: "some name_latin", name_sv: "some name_sv", slug: "some slug"}
    @update_attrs %{name_latin: "some updated name_latin", name_sv: "some updated name_sv", slug: "some updated slug"}
    @invalid_attrs %{name_latin: nil, name_sv: nil, slug: nil}

    def genus_fixture(attrs \\ %{}) do
      {:ok, genus} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Birds.create_genus()

      genus
    end

    test "list_genera/0 returns all genera" do
      genus = genus_fixture()
      assert Birds.list_genera() == [genus]
    end

    test "get_genus!/1 returns the genus with given id" do
      genus = genus_fixture()
      assert Birds.get_genus!(genus.id) == genus
    end

    test "create_genus/1 with valid data creates a genus" do
      assert {:ok, %Genus{} = genus} = Birds.create_genus(@valid_attrs)
      assert genus.name_latin == "some name_latin"
      assert genus.name_sv == "some name_sv"
      assert genus.slug == "some slug"
    end

    test "create_genus/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Birds.create_genus(@invalid_attrs)
    end

    test "update_genus/2 with valid data updates the genus" do
      genus = genus_fixture()
      assert {:ok, %Genus{} = genus} = Birds.update_genus(genus, @update_attrs)
      assert genus.name_latin == "some updated name_latin"
      assert genus.name_sv == "some updated name_sv"
      assert genus.slug == "some updated slug"
    end

    test "update_genus/2 with invalid data returns error changeset" do
      genus = genus_fixture()
      assert {:error, %Ecto.Changeset{}} = Birds.update_genus(genus, @invalid_attrs)
      assert genus == Birds.get_genus!(genus.id)
    end

    test "delete_genus/1 deletes the genus" do
      genus = genus_fixture()
      assert {:ok, %Genus{}} = Birds.delete_genus(genus)
      assert_raise Ecto.NoResultsError, fn -> Birds.get_genus!(genus.id) end
    end

    test "change_genus/1 returns a genus changeset" do
      genus = genus_fixture()
      assert %Ecto.Changeset{} = Birds.change_genus(genus)
    end
  end
end
