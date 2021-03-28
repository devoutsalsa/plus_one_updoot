defmodule PlusOneUpdoot.Email do
  alias PlusOneUpdoot.Counter

  defstruct domain: "example.com",
            local_part: "totes-not-fake-address-"

  def increment!(%__MODULE__{domain: domain, local_part: local_part} = arg \\ %__MODULE__{})
      when is_binary(domain) and is_binary(local_part) do
    arg
    |> Counter.increment_email!()
    |> case do
      %__MODULE__{domain: domain, local_part: local_part} ->
        local_part <> "@" <> domain
    end
  end
end
