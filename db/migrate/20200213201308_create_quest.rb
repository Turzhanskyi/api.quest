# frozen_string_literal: true

class CreateQuest < ActiveRecord::Migration[5.2]
  def change
    create_table :quests do |t|
      t.string :name, limit: 50
      t.text :description
    end
  end
end
