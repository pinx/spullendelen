require 'spec_helper'

describe ThingsController do
  context 'seeing things' do
    let!(:valid_member) { create :member }
    let!(:other_member) { create :member, email: 'test@way.nl' }
    let!(:things) { create_list :thing, 2, member: valid_member }
    let!(:thing3) { create :thing, member: other_member }

    before { sign_in valid_member }

    describe '#index' do
      it 'assigns owned things to member' do
        get :index, { member_id: valid_member.id }

        expect(assigns[:things]).to match_array things
      end
    end
  end
end
