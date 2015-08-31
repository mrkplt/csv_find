require './lib/csv_find'

# Example class for use in csv_find module specs
#
class People
  include CsvFind
  csv_file('spec/support/demo.csv', {})
end

describe People do
  let(:person1) do
    People.new(first: 'Mark', last: 'Platt', nickname: 'JCool', line_number: 2)
  end

  let(:person2) do
    People.new(first: 'Longinus',
               last: 'Smith',
               nickname: 'Pebbles',
               line_number: 3)
  end

  let(:person3) do
    People.new(first: 'Johnny',
               last: 'Radiation',
               nickname: 'Pebbles',
               line_number: 4)
  end

  let(:person4) do
    People.new(first: 'Charlie',
               last: 'Mansfield',
               nickname: 'Sammykins',
               line_number: 5)
  end

  context 'class methods' do
    it 'responds to .first' do
      (People).should respond_to(:first)
    end

    it '.first returns correctly' do
      expect(People.first).to eq person1
    end

    it 'responds to .last' do
      (People).should respond_to(:last)
    end

    it '.last returns correctly' do
      expect(People.last).to eq person4
    end

    it 'responds to .find' do
      (People).should respond_to(:find)
    end

    it '.find returns correctly' do
      expect(People.find(2)).to eq person1
      expect(People.find(3)).to eq person2
      expect(People.find(4)).to eq person3
      expect(People.find(5)).to eq person4
    end

    it 'responds to .where' do
      (People).should respond_to(:where)
    end

    it '.where returns correctly' do
      expect(People.where(nickname: 'Pebbles')).to eq [person2, person3]
      expect(People.where(nickname: 'Pebbles', last: 'Radiation'))
        .to eq [person3]
    end

    it '.where returns an empty array if there are no results' do
      expect(People.where(nickname: 'Beastmode')).to eq []
    end

    it 'responds to .each' do
      (People).should respond_to(:each)
    end

    it '.each line yields' do
      @output = []
      People.each { |person| @output << person.first }
      expect(@output).to eq %w(Mark Longinus Johnny Charlie)
    end
  end
  context 'instance methods' do
    it 'responds to .first as defined in the csv' do
      (People.new).should respond_to(:first)
    end

    it 'responds to .last as defined in the csv' do
      (People.new).should respond_to(:last)
    end

    it 'responds to .nickname as defined in the csv' do
      (People.new).should respond_to(:nickname)
    end
  end
end
