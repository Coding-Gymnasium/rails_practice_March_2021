class Curriculum < ApplicationRecord
    has_many :cohorts, dependent: :destroy
end
