class Museum
  attr_reader :name, :exhibits, :patrons, :patrons_by_exhibit_interest

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
    @patrons_by_exhibit_interest = {}
  end

  def add_exhibit(exhibit)
    @patrons_by_exhibit_interest[exhibit] = []
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    @exhibits.select do |i|
      if patron.interests.include?(i.name)
        @patrons_by_exhibit_interest[i] << patron
        i
      end
    end
  end

  def admit(patron)
    @patrons << patron
  end

end
