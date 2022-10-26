defmodule ApiProjectWeb.ClockController do
  use ApiProjectWeb, :controller

  alias ApiProject.Timers
  alias ApiProject.Timers.Clock

  alias ApiProject.Schedule
  alias ApiProject.Schedule.Workingtime

  action_fallback ApiProjectWeb.FallbackController

  def index(conn, _params) do
    clocks = Timers.list_clocks()
    render(conn, "index.json", clocks: clocks)
  end

  def create(conn, params) do
    user_id = params["user_id"]

    clock_exists = Timers.clock_exists?(user_id)

    if !clock_exists do
      with {:ok, %Clock{} = clock} <-
             Timers.create_clock(%{
               user: user_id,
               time: DateTime.utc_now()
             }) do
        conn
        |> put_status(:created)
        |> put_resp_header("location", Routes.clock_path(conn, :show, clock))
        |> render("show.json", clock: clock)
      end
    end

    last_clock = Timers.list_one_clock(user_id)
    last_clock = Enum.at(last_clock, 0)

    if last_clock.status do
      with {:ok, %Clock{} = clock} <-
             Timers.create_clock(%{
               user: user_id,
               status: false,
               time: DateTime.utc_now()
             }) do
        conn
        |> put_status(:created)
        |> put_resp_header("location", Routes.clock_path(conn, :show, clock))
        |> render("show.json", clock: clock)
      end
    else
      IO.inspect("clock out")
      workingtime_clock_in = Timers.list_one_clock(user_id)
      workingtime_clock_in = Enum.at(workingtime_clock_in, 0)

      if workingtime_clock_in.status == false do
        with {:ok, %Workingtime{} = workingtime} <-
               Schedule.create_workingtime(%{
                 user: user_id,
                 start: workingtime_clock_in.time,
                 end: DateTime.utc_now()
               }) do
          conn
          |> put_status(:created)
          |> put_resp_header("location", Routes.workingtime_path(conn, :show, workingtime))
        end
      end

      with {:ok, %Clock{} = clock} <-
             Timers.create_clock(%{
               user: user_id,
               status: true,
               time: DateTime.utc_now()
             }) do
        conn
        |> put_status(:created)
        |> put_resp_header("location", Routes.clock_path(conn, :show, clock))
        |> render("show.json", clock: clock)
      end
    end
  end

  def show(conn, %{"id" => id}) do
    clock = Timers.get_clock!(id)
    render(conn, "show.json", clock: clock)
  end

  def update(conn, %{"id" => id, "clock" => clock_params}) do
    clock = Timers.get_clock!(id)

    with {:ok, %Clock{} = clock} <- Timers.update_clock(clock, clock_params) do
      render(conn, "show.json", clock: clock)
    end
  end

  def delete(conn, %{"id" => id}) do
    clock = Timers.get_clock!(id)

    with {:ok, %Clock{}} <- Timers.delete_clock(clock) do
      send_resp(conn, :no_content, "")
    end
  end
end
