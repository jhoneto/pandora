# frozen_string_literal: true

class Company < ApplicationRecord
  belongs_to :organization

  validates :name, presence: true
end
