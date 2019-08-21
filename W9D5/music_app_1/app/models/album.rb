# == Schema Information
#
# Table name: albums
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  year       :integer          not null
#  live       :boolean          default(FALSE), not null
#  band_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ApplicationRecord

    belongs_to :band # band_id: no need for presence
    has_many :tracks

    validates :band, :name, :year, presence: true
    validates :year, numericality: {minimum: 1900, maximum: 2020}
    validates :live, inclusion: {in: [true, false]} # boolean
    validates :name, uniqueness: {scope: :band_id}

    after_initialize :set_default

    def set_default
        self.live ||= false
    end
end
