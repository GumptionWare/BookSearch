defmodule BookSearch.Tags.Tag do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tags" do
    field :name, :string
    # Add a many-to-many relationship with the 'books' table through the 'book_tags' join table
    many_to_many :books, BookSearch.Books.Book, join_through: "book_tags", on_replace: :delete

    timestamps()
  end
  
  # Define a changeset function for updating tags
  @doc false
  def changeset(tag, attrs) do
    tag
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
