defmodule Service do
  def hello do
    {:ok, res} = Redix.command(:redix, ["INCR", "bar"])
    "count #{res}"
  end
end
