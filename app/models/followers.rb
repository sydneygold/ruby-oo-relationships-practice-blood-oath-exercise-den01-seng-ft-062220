class Follower
    
    attr_reader :name, :age, :life_motto

    @@all = []

    def initialize name, age, life_motto
        @name = name
        @age = age
        @life_motto = life_motto

        @@all << self
    end

    def self.all
        @@all
    end
    
    def cults
        bloodoaths = BloodOath.all.select do |bloodoath|
            bloodoath.follower == self
        end
        bloodoaths.map { |bloodoath|
            bloodoath.cult }
        binding.pry
    end

    def self.of_a_certain_age age
        all.select { |follower| follower.age >= age }
    end

    def join_cult cult, initiation_date
        BloodOath.new self, cult, initiation_date
    end

    def my_cult_slogans
        bloodoaths = BloodOath.all.select do |blood_oath|
            blood_oath.follower == self
        end
        bloodoaths.map { |blood_oath| blood_oath.cult.slogans }
    end

    # def self.all
    #     @@all
    # end

    # def average_age
    #     total_age = follower.age.reduce(0) do |sum, follower|
    #         sum += follower.age
    #     end
    #     total_age / self.cult_population
    # end

# binding.pry
end