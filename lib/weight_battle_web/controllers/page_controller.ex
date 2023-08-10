defmodule WeightBattleWeb.PageController do
  use WeightBattleWeb, :controller

  @data %{
    "Laura" => %{
      goal: 55.0,
      color: "sky-500",
      data_points: [
        %{
          date: NaiveDateTime.new!(~D[2023-08-07], ~T[08:00:00]),
          weight: 59.9
        },
        %{
          date: NaiveDateTime.new!(~D[2023-08-08], ~T[08:00:00]),
          weight: 59.4
        },
        %{
          date: NaiveDateTime.new!(~D[2023-08-09], ~T[08:00:00]),
          weight: 59.0
        },
        %{
          date: NaiveDateTime.new!(~D[2023-08-10], ~T[08:00:00]),
          weight: 58.7
        }
      ]
    },
    "Ronald" => %{
      goal: 100.0,
      color: "pink-500",
      data_points: [
        %{
          date: NaiveDateTime.new!(~D[2023-08-07], ~T[08:00:00]),
          weight: 108.5
        },
        %{
          date: NaiveDateTime.new!(~D[2023-08-08], ~T[08:00:00]),
          weight: 108.2
        },
        %{
          date: NaiveDateTime.new!(~D[2023-08-09], ~T[08:00:00]),
          weight: 107.6
        },
        %{
          date: NaiveDateTime.new!(~D[2023-08-10], ~T[08:00:00]),
          weight: 108.1
        }
      ]
    }
  }

  def home(conn, _params) do
    render(conn |> assign(:data, @data), :home)
  end
end
