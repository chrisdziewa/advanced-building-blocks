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