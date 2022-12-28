defmodule BookSearch.Books.BookContent do
  use Ecto.Schema
  import Ecto.Changeset

  schema "book_content" do
    field :full_text, :string
    # field :book_id, :id
    # Use `belongs_to/3` instead of `field/3`(above...)
    belongs_to :book, BookSearch.Books.Book

    timestamps()
  end

  @doc false
  def changeset(book_content, attrs) do
    book_content
    |> cast(attrs, [:full_text])
    |> validate_required([:full_text])
  end
end
