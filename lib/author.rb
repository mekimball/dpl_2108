# frozen_string_literal: true

class Author
  attr_reader :books

  def initialize(info)
    @first_name   = info[:first_name]
    @last_name    = info[:last_name]
    @books        = []
  end

  def name
    "#{@first_name} #{@last_name}"
  end

  def write(title, date)
    data = { author_first_name: @first_name,
             author_last_name: @last_name,
             title: title,
             publication_date: date }
    Book.new(data)
  end

  def publish(book)
    @books << book
  end

  def publication_range
    pub_hash = {}
    years = books.map(&:publication_year)
    pub_hash[:start]  = years.min
    pub_hash[:end]    = years.max
    pub_hash
  end
end
