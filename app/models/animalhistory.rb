class Animalhistory < ActiveRecord::Base
  attr_accessible :animal_id, :historia, :observaciones, :peso, :temperatura
   belongs_to :animal
end
