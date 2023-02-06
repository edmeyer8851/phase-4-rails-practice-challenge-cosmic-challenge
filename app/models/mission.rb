class Mission < ApplicationRecord
    belongs_to :scientist
    belongs_to :planet
    validates :name, presence: true
    validates_associated :scientist, :planet
    validates :scientist, uniqueness: { scope: :name }
end
