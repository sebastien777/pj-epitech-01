# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ApiProject.Repo.insert!(%ApiProject.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
# Fake Users
raoul = %ApiProject.Account.User{
  email: "raoul@mail.pt",
  username: "CoolRaoul33",
}
{:ok, raoul} = ApiProject.Repo.insert(raoul)

roger = %ApiProject.Account.User{
  email: "supremheal@mail.st",
  username: "roger roger",
}
{:ok, roger} = ApiProject.Repo.insert(roger)

deo = %ApiProject.Account.User{
  email: "deodosaure@gail.tb",
  username: "assTooT8",
}
{:ok, deo} = ApiProject.Repo.insert(deo)


# Fake Schedules
ApiProject.Repo.insert!%ApiProject.Schedule.Workingtime{
  end: ~N[2022-10-24 10:10:10],
  start: ~N[2022-12-31 12:00:00],
  user: raoul.id,
}
ApiProject.Repo.insert!%ApiProject.Schedule.Workingtime{
  end: ~N[2022-10-24 10:10:10],
  start: ~N[2022-12-31 12:00:00],
  user: roger.id,
}
ApiProject.Repo.insert!%ApiProject.Schedule.Workingtime{
  end: ~N[2022-10-24 10:10:10],
  start: ~N[2022-12-31 12:00:00],
  user: deo.id,
}
# Fake Clocks
ApiProject.Repo.insert!%ApiProject.Timers.Clock{
  status: true,
  time: ~N[2022-12-31 14:00:00],
  user: raoul.id,
}
ApiProject.Repo.insert!%ApiProject.Timers.Clock{
  status: false,
  time: ~N[2022-02-28 14:00:00],
  user: roger.id,
}
ApiProject.Repo.insert!%ApiProject.Timers.Clock{
  status: false,
  time: ~N[2022-02-28 14:00:00],
  user: deo.id,
}


# steps :
# mix phx.gen.context Account User users username:string email:string 
# mix phx.gen.json Account User users username:string email:string --no-context --no-schema // context already created ^ 
# mix run priv/repo/seeds.exs
# === mix phx.gen.json Timers Clock clocks time:datetime status:boolean user:references:users

