# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Quest', type: :request do
  def json
    JSON.parse(response.body)
  end

  describe 'POST /quest' do
    let(:quest_params) do
      {
        quest: {
          name: 'Vitalii Turzhanskyi',
          description: 'Quest of the lifetime'
        }
      }
    end

    it 'creates quest record' do
      expect do
        post '/quests', params: quest_params
      end.to change { Quest.count }.by(1)
    end

    it 'return "created" status' do
      post '/quests', params: quest_params

      expect(response.status).to eq(201)
    end

    it 'returns informative message' do
      post '/quests', params: quest_params

      expect(json).to eq('Quest was successfully created')
    end
  end

  context 'too long name' do
    let(:long_name) do
      'cdefccccccccccccccccccccredscerfrere'\
      'sadtrghbfewrgtjyumhnhbgffdvrgtrgresg'\
      'dsvcefrvrefvre.'
    end

    let(:quest_params) do
      {
        quest: {
          name: long_name
        }
      }
    end

    let(:error_details) do
      ['Name is too long (maximum is 50 characters)']
    end

    let(:unprocessable_entity) do
      422
    end

    it 'cannot process request, return error' do
      post '/quests', params: quest_params

      expect(json).to eq(error_details)
      expect(response.status).to eq(unprocessable_entity)
    end
  end
end
