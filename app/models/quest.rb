# frozen_string_literal: true

class Quest < ApplicationRecord
  validates_length_of :name, maximum: 50
end
