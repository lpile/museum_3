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
    @patrons << patron if @patrons_by_exhibit_interest.each_pair {|k,v| true if patron.interests.include?(v) && (patron.spending_money >= k.cost)}
  end
end
