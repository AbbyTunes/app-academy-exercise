# == Schema Information
#
# Table name: tracks
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  ord        :integer          not null
#  album_id   :integer          not null
#  lyrics     :text
#  bonus      :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ApplicationRecord

    belongs_to :album # doesn't need presence: true
    has_one :band, through: :album, source: :band

    validates :name, :ord, presence: true
    validates :ord, uniqueness: {scope: :album_id}
    validates :bonus, inclusion: {in: [true, false]}

    after_initialize :set_default

    def set_default
        self.bonus ||= false
    end
end
