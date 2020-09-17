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
        Meal.all.select do |meal|
            meal.waiter == self
        end
    end

    def best_tipper
        best_tipped_meal = meals.max {|meal_a, meal_b| meal_a.tip <=> meal_b.tip }
        
        best_tipped_meal.customer
        # max_tip = 0
        # max_tipper = nil
        # meals.collect do |meal|
        #     if max_tip < meal.tip
        #         max_tip = meal.tip
        #         max_tipper = meal.customer
        #     end
        # end
        # max_tipper
    end
end