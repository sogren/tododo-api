require 'rails_helper'

RSpec.describe Api::V1::TasksController, type: :controller do
  let(:user) { create :user }
  let!(:task) { create :task, user: user }
  # let(:headers) {'Accept' => 'application/todo; version=1'}

  context 'when user signed in' do
    describe 'index' do

    end

    describe 'show' do

    end

    describe 'create' do

    end

    describe 'update' do

    end

    describe 'change_status' do

    end

    describe 'destroy' do

    end
  end

  context 'when user signed out' do
    %w(index create show update change_status destroy).each do |action|
      it "#{action} should be restricted" do
        make_request(action, task.id, FactoryGirl.attributes_for(:task))
        expect(response.status).to eql(401)
      end
    end
  end

  def make_request(action, id, hash)
    headers = {'Accept' => 'application/json'}
    token = user.create_new_auth_token
    headers.merge! token

    case action
    when 'index'
      get action, headers: headers
    when 'create'
      post action, { id: id, task: hash }, headers: headers
    when 'show'
      get action, { id: id }, headers: headers
    when 'update'
      put action, { id: id, task: hash }, headers: headers
    when 'change_status'
      get action, { id: id }, headers: headers
    when 'destroy'
      delete action, { id: id }, headers: headers
    end
  end
end











# g#
