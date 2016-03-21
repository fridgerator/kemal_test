class Post < ActiveRecord::Model
  adapter postgres

  primary id        : Int
  field title       : String
  field body        : String

  def to_h
    {
      id: id,
      title: title,
      body: body
    }
  end
end