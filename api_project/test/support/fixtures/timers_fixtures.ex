defmodule ApiProject.TimersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ApiProject.Timers` context.
  """

  @doc """
  Generate a clock.
  """
  def clock_fixture(attrs \\ %{}) do
    {:ok, clock} =
      attrs
      |> Enum.into(%{
        status: true,
        time: ~N[2022-10-23 18:48:00]
      })
      |> ApiProject.Timers.create_clock()

    clock
  end
end
