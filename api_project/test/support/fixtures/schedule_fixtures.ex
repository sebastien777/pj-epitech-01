defmodule ApiProject.ScheduleFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ApiProject.Schedule` context.
  """

  @doc """
  Generate a workingtime.
  """
  def workingtime_fixture(attrs \\ %{}) do
    {:ok, workingtime} =
      attrs
      |> Enum.into(%{
        end: ~N[2022-10-23 19:09:00],
        start: ~N[2022-10-23 19:09:00]
      })
      |> ApiProject.Schedule.create_workingtime()

    workingtime
  end
end
