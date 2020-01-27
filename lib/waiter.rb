class Waiter

  attr_accessor :name, :yrs_experience
  @@all = []

  def initialize(name, yrs_experience)
    @name = name
    @yrs_experience = yrs_experience
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(customer, total, tip=0)
      Meal.new(self, customer, total, tip)
  end

  def meals
    Meal.all.select { |meal| meal.waiter == self}
  end

  def best_tipper
    best_tipped_meal = meals.max { |meal_a, meal_b| meal_a.tip <=> meal_b.tip }
    best_tipped_meal.customer
  end

  def most_frequent_customer
    most_frequent_customer = meals.customer.max {|customer_a, customer_b| customer_a.count <=> customer_b.count}
    most_frequent_customer
end
