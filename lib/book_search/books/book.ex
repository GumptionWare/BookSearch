defmodule BookSearch.Books.Book do
  use Ecto.Schema
  import Ecto.Changeset

  schema "books" do
    field :title, :string
    # FK to Authors table
    belongs_to :author, BookSearch.Authors.Author
    has_one :book_content, BookSearch.Books.BookContent # add `BookContent` association
    # Add a many-to-many relationship with the 'tags' table through the 'book_tags' join table
    many_to_many :tags, BookSearch.Tags.Tag, join_through: "book_tags", on_replace: :delete

    timestamps()
  end

  @doc false
  def changeset(book, attrs, tags \\ []) do
    book
    |> cast(attrs, [:title, :author_id])
    # Update the many-to-many relationship with the 'tags' table
    |> put_assoc(:tags, tags)
    # add cast_assoc to book_content
    |> cast_assoc(:book_content)
    # Validate the presence of 'title'
    |> validate_required([:title])
  end
end
