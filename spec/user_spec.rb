require 'user'
require 'database_helpers'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(username: 'cingloker', email: 'cingloker@example.com', password: '12345')
      persisted_data = persisted_data(id: user.id, table: 'users')
      expect(user.id).to eq persisted_data.first['id']
      expect(user.email).to eq 'cingloker@example.com'
      expect(user.username).to eq 'cingloker'
    end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('12345')
      User.create(username: 'cingloker', email: 'cingloker@example.com', password: '12345')
    end
  end

  describe '.find_by_id' do
    it 'finds the user by their id' do
      user = User.create(username: 'cingloker', email: 'cingloker@example.com', password: '12345')
      result = User.find_by_id(id: user.id)
      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
    end
    it 'returns nil if no id is provided' do
      expect(User.find_by_id(id: nil)).to eq nil
    end
  end


  describe '.authenticate' do
    it 'returns a user given a correct username and password, if one exists' do
      user = User.create(username: 'cingloker', email: 'cingloker@example.com', password: '12345')
      authenticated_user = User.authenticate(username: 'cingloker', email: 'cingloker@example.com', password: '12345')
      expect(authenticated_user.id).to eq user.id
    end

    it 'returns nil if an incorrect email address is provided' do
        user = User.create(username: 'cingloker', email: 'cingloker@example.com', password: '12345')
        expect(User.authenticate(username: 'cingloker', email: 'cing@example.com', password: '12345')).to be_nil
      end
  end
end
