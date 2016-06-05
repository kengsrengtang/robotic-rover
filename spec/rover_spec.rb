require 'spec_helper'

describe Rover do
  let!(:map){ Map.new 3,3 }
  subject{ Rover.new 1,1, 'N', map }

  it {subject.should respond_to :move}  
  it {subject.should respond_to :get_position}  
  it {subject.should respond_to :rotate}  

  it 'initialize' do
    expect(subject.x).to eq 1
    expect(subject.y).to eq 1
    expect(subject.facing).to eq 0
  end

  it 'return current position' do
    expect(subject.get_position).to eq '1 1 N'
  end

  describe '#movement' do
    it 'move north' do
      rover = Rover.new 1,1,'N', map
      rover.move
      expect(rover.get_position).to eq '1 2 N'
    end
  
    it 'move east' do
      rover = Rover.new 1,1,'E', map
      rover.move
      expect(rover.get_position).to eq '2 1 E'
    end

    it 'move south' do
      rover = Rover.new 1,1,'S', map
      rover.move
      expect(rover.get_position).to eq '1 0 S'
    end

    it 'move west' do
      rover = Rover.new 1,1,'W', map
      rover.move
      expect(rover.get_position).to eq '0 1 W'
    end
  end

  describe '#rotation' do
    context '#counterclockwise' do
      it 'rotate west' do
        rover = Rover.new 1, 1, 'N', map
        rover.rotate false
        expect(rover.get_position).to eq '1 1 W'
      end

      it 'rotate west' do
        rover = Rover.new 1, 1, 'W', map
        rover.rotate false
        expect(rover.get_position).to eq '1 1 S'
      end

      it 'rotate west' do
        rover = Rover.new 1, 1, 'S', map
        rover.rotate false
        expect(rover.get_position).to eq '1 1 E'
      end

      it 'rotate west' do
        rover = Rover.new 1, 1, 'E', map
        rover.rotate false
        expect(rover.get_position).to eq '1 1 N'
      end
    end

    context '#clockwise' do
      it 'rotate west' do
        rover = Rover.new 1, 1, 'N', map
        rover.rotate true
        expect(rover.get_position).to eq '1 1 E'
      end

      it 'rotate west' do
        rover = Rover.new 1, 1, 'E', map
        rover.rotate true 
        expect(rover.get_position).to eq '1 1 S'
      end

      it 'rotate west' do
        rover = Rover.new 1, 1, 'S', map
        rover.rotate true
        expect(rover.get_position).to eq '1 1 W'
      end

      it 'rotate west' do
        rover = Rover.new 1, 1, 'W', map
        rover.rotate true
        expect(rover.get_position).to eq '1 1 N'
      end
    end
  end
end
