# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Organization, type: :model do
  describe 'validations' do
    subject(:organization) { build(:organization) }

    it { expect(organization).to validate_presence_of(:name) }
  end
end