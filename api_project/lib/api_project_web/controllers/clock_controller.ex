defmodule ApiProjectWeb.ClockController do
  use ApiProjectWeb, :controller

  alias ApiProject.Timers
  alias ApiProject.Timers.Clock

  action_fallback ApiProjectWeb.FallbackController

  def index(conn, params) do
    clocks = Timers.list_clocks()
    render(conn, "index.json", clocks: clocks)
  end

  def create(conn, params) do
    user_id = params["user_id"]
    IO.inspect(user_id)
    with {:ok, %Clock{} = clock} <- Timers.create_clock(%{
      "user": user_id,
      "status": true,
      "time": ~N[2010-10-10 10:10:10]
    }
  ) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.clock_path(conn, :show, clock))
      |> render("show.json", clock: clock)
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
