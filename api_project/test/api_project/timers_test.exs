defmodule ApiProject.TimersTest do
  use ApiProject.DataCase

  alias ApiProject.Timers

  describe "clocks" do
    alias ApiProject.Timers.Clock

    import ApiProject.TimersFixtures

    @invalid_attrs %{status: nil, time: nil}

    test "list_clocks/0 returns all clocks" do
      clock = clock_fixture()
      assert Timers.list_clocks() == [clock]
    end

    test "get_clock!/1 returns the clock with given id" do
      clock = clock_fixture()
      assert Timers.get_clock!(clock.id) == clock
    end

    test "create_clock/1 with valid data creates a clock" do
      valid_attrs = %{status: true, time: ~N[2022-10-23 18:48:00]}

      assert {:ok, %Clock{} = clock} = Timers.create_clock(valid_attrs)
      assert clock.status == true
      assert clock.time == ~N[2022-10-23 18:48:00]
    end

    test "create_clock/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Timers.create_clock(@invalid_attrs)
    end

    test "update_clock/2 with valid data updates the clock" do
      clock = clock_fixture()
      update_attrs = %{status: false, time: ~N[2022-10-24 18:48:00]}

      assert {:ok, %Clock{} = clock} = Timers.update_clock(clock, update_attrs)
      assert clock.status == false
      assert clock.time == ~N[2022-10-24 18:48:00]
    end

    test "update_clock/2 with invalid data returns error changeset" do
      clock = clock_fixture()
      assert {:error, %Ecto.Changeset{}} = Timers.update_clock(clock, @invalid_attrs)
      assert clock == Timers.get_clock!(clock.id)
    end

    test "delete_clock/1 deletes the clock" do
      clock = clock_fixture()
      assert {:ok, %Clock{}} = Timers.delete_clock(clock)
      assert_raise Ecto.NoResultsError, fn -> Timers.get_clock!(clock.id) end
    end

    test "change_clock/1 returns a clock changeset" do
      clock = clock_fixture()
      assert %Ecto.Changeset{} = Timers.change_clock(clock)
    end
  end
end
