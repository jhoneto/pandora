# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(Company, type: :model) do
  describe 'validations' do
    subject(:company) { build(:company) }

    it { is_expected.to(belong_to(:organization)) }
    it { expect(company).to(validate_presence_of(:name)) }
  end
end
