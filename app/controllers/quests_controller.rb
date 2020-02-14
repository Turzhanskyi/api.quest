# frozen_string_literal: true

class QuestsController < ApplicationController
  def create
    quest = Quest.new(quest_params)

    if quest.save
      render(
        json: 'Quest was successfully created'.to_json,
        status: :created
      )
    else
      render(
        json: quest.errors.full_messages,
        status: :unprocessable_entity
      )
    end
  end

  private

  def quest_params
    params.require(:quest).permit(:name, :description)
  end
end
