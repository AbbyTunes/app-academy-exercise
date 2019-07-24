require 'date'

class Cat <  ApplicationRecord

    COLOR = ['grey', 'white', 'black']

    validates :birth_date, :color, :name, :sex, :description, presence: true
    validates :sex, inclusion: {in: ['M','F']}
    validates :color, inclusion: {in: COLOR }
    

    def age
        current_date = Date.today
        current_date.year - self.birth_date.year
    end


end