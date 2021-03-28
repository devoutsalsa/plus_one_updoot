defmodule PlusOneUpdoot.String do
  alias PlusOneUpdoot.Counter

  def increment!(arg \\ "absolutely-the-most-amazing-default-string-of-all-time")
      when is_binary(arg) do
    Counter.increment_string!(arg)
  end
end
