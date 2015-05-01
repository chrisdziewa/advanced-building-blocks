require 'spec_helper'
require_relative '../my_enumerable'

describe '#my_each' do
    include Enumerable
    context 'with a valid array' do
        it 'does not change original array' do
            array = [4, 3, 2 ,1]
            result = []
            array.my_each { | item | result << item + 1}
            expect(array).to eql([4,3,2,1])
        end
    end

    context 'without a block' do
        it 'returns an enumerable object string' do
            array = [4, 3, 2, 1]
            result = array.my_each
            expect(result).to be_instance_of(String)
        end
    end

    context 'with a string' do
        it 'raises a no method error' do
            string = "abcde"
            expect {string.my_each}.to raise_error(NoMethodError)
        end
    end

    context 'with a nil value' do
        it 'raises a no method error' do
            value = nil
            expect{value.my_each}.to raise_error(NoMethodError)
        end
    end
end

describe '#my_select' do
    before :each do
        @array = [1,2,3,4,5]
    end
    context 'with one false value and the rest true' do
        it 'returns a new array with one less value than the original array' do
            new_array = @array.my_select { |item| item <= 4}
            expect(new_array.length).to eql(@array.length - 1)
        end
    end

    context 'with all true values' do
        it 'returns a new array equal to the original' do
            new_array = @array.my_select {|item| item < 6}
            expect(new_array).to eql(@array)
        end
    end

    context 'with all false values' do
        it 'returns an empty array' do
            new_array = @array.my_select {|item| item < 1}
            expect(new_array).to be_empty
        end
    end

    context 'when used on a non-array' do
        it 'raises a no method error' do
            string = "this won't work"
            expect{string.my_select {|item| item < 3}}.to raise_error(NoMethodError)
        end
    end
end

describe '#my_all?' do
    before :each do
        @array = [1,2,3,4,5]
    end
    context 'with all true values' do
        it 'returns true' do
            response = @array.my_all? { |value| value < 6   }
            expect(response).to eql(true)
        end
    end

    context 'with at least one false value' do
        it 'returns false' do
            response = @array.my_all? { | value | value < 5 }
            expect(response).to eql(false)
        end
    end
end

describe '#my_any?' do
    before :each do
        @array = [1,2,3,4,5]
    end
    context 'with all true values' do
        it 'returns true' do
            response = @array.my_any? {|value| value < 7}
            expect(response).to eql(true)
        end
    end

    context 'with all false values' do
        it 'returns false' do
            response = @array.my_any? {|value| value > 6}
            expect(response).to eql(false)
        end
    end

    context 'with one true value' do
        it 'returns true' do
            response = @array.my_any? {|value| value < 2}
            expect(response).to eql(true)
        end
    end
end

describe '#my_none?' do
    before :each do
        @array = [1,2,3,4,5]
    end
    context 'with all true values' do
        it 'returns false' do
            response = @array.my_none? {|value| value < 6}
            expect(response).to eql(false)
        end
    end

    context 'with all false values' do
        it 'returns true' do
            response = @array.my_none? {|value| value > 5}
            expect(response).to eql(true)
        end
    end

    context 'with one true value' do
        it 'returns false' do
            response = @array.my_none? {|value| value > 4}
            expect(response).to eql(false)
        end
    end
end

describe '#my_inject' do
    before :each do
        @array = [1,2,3,4,5]
    end
    context 'with no argument' do
        it 'returns a sum of the array' do
            sum = @array.my_inject {|sum, value| sum + value}
            expect(sum).to eql(15)
        end
    end

    context 'with an argument' do
        it 'returns a sum of the array added to the start value' do
            sum = @array.my_inject(5) {|sum, value| sum + value }
            expect(sum).to eql(20)
        end
    end
end






