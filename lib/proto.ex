defmodule Proto do
  @moduledoc """
  Documentation for Proto.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Proto.hello()
      :world

  """
  def hello do
    :world
  end

  # Lets build a struct that we can use to test our protocol
  defstruct name: "proto", type: "protocols implementattion"

  # Lets build a protocol to use for our structs
  # Notice we add a moduletag that defines our protocol
  # can fall back to any if we are lacking an implementation
  defprotocol St.Chars do
    @fallback_to_any true
    def to_string(value)
  end

  # A different kind of struct for our protocol to consume
  defmodule State do
    defstruct context: "this is here"
  end


  # Implement our protocol for a certain kind of struct
  defimpl St.Chars, for: __MODULE__ do
    def to_string(%{name: n, type: t}), do: "{name: #{n}, type: #{t}}"
  end

  # Implement our protocol for an  Any kind
  defimpl St.Chars, for: Any do
    def to_string(_), do: "Wow this is an any"
  end
end
