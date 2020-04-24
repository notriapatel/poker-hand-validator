require_relative 'poker_hand_evaluator'
require 'minitest'
require 'minitest/autorun'

describe PokerHandEvaluator do
  describe '#hand_classifications' do
    HIGH_CARD = %w[AS KC 3H 8C 5H].shuffle.join(' ')
    ONE_PAIR = %w[7H 7S 4H 8D 5D].shuffle.join(' ')
    TWO_PAIR = %w[8H 8S 4S 7D 7C].shuffle.join(' ')
    THREE_OF_A_KIND = %w[0C 0S 0D KS QC].shuffle.join(' ')
    STRAIGHT = %w[5S 4D 3S 2H AC].shuffle.join(' ')
    FLUSH = %w[QD KD AD 3D 2D].shuffle.join(' ')
    FULL_HOUSE = %w[JC JS JD 6D 6H].shuffle.join(' ')
    FOUR_OF_A_KIND = %w[9H 9S 9D 9C 2S].shuffle.join(' ')
    STRAIGHT_FLUSH = %w[6C 5C 4C 3C 2C].shuffle.join(' ')
    ROYAL_FLUSH = %w[AH KH QH JH 0H].shuffle.join(' ')

    it 'identifies HIGH_CARD hands' do
      evaluate = PokerHandEvaluator.new([HIGH_CARD])
      evaluate.hand_classifications.must_equal(['HIGH_CARD'])
    end

    it 'identifies ONE_PAIR hands' do
      evaluate = PokerHandEvaluator.new([ONE_PAIR])
      evaluate.hand_classifications.must_equal(['ONE_PAIR'])
    end

    it 'identifies TWO_PAIR hands' do
      evaluate = PokerHandEvaluator.new([TWO_PAIR])
      evaluate.hand_classifications.must_equal(['TWO_PAIR'])
    end

    it 'identifies THREE_OF_A_KIND hands' do
      evaluate = PokerHandEvaluator.new([THREE_OF_A_KIND])
      evaluate.hand_classifications.must_equal(['THREE_OF_A_KIND'])
    end

    it 'identifies FULL_HOUSE hands' do
      evaluate = PokerHandEvaluator.new([FULL_HOUSE])
      evaluate.hand_classifications.must_equal(['FULL_HOUSE'])
    end

    it 'identifies FOUR_OF_A_KIND hands' do
      evaluate = PokerHandEvaluator.new([FOUR_OF_A_KIND])
      evaluate.hand_classifications.must_equal(['FOUR_OF_A_KIND'])
    end

    it 'identifies FLUSH hands' do
      evaluate = PokerHandEvaluator.new([FLUSH])
      evaluate.hand_classifications.must_equal(['FLUSH'])
    end

    it 'identifies STRAIGHT hands' do
      evaluate = PokerHandEvaluator.new([STRAIGHT])
      evaluate.hand_classifications.must_equal(['STRAIGHT'])
    end

    it 'identifies STRAIGHT_FLUSH hands' do
      evaluate = PokerHandEvaluator.new([STRAIGHT_FLUSH])
      evaluate.hand_classifications.must_equal(['STRAIGHT_FLUSH'])
    end

    it 'identifies ROYAL_FLUSH hands' do
      evaluate = PokerHandEvaluator.new([ROYAL_FLUSH])
      evaluate.hand_classifications.must_equal(['ROYAL_FLUSH'])
    end

    it 'handles multiple hands & returns identifications in given order' do
      evaluate = PokerHandEvaluator.new([
        THREE_OF_A_KIND,
        TWO_PAIR,
        STRAIGHT,
        ROYAL_FLUSH,
        HIGH_CARD,
        FLUSH,
        FOUR_OF_A_KIND,
        STRAIGHT_FLUSH,
        FULL_HOUSE,
        ONE_PAIR,
      ])

      evaluate.hand_classifications.must_equal([
        'THREE_OF_A_KIND',
        'TWO_PAIR',
        'STRAIGHT',
        'ROYAL_FLUSH',
        'HIGH_CARD',
        'FLUSH',
        'FOUR_OF_A_KIND',
        'STRAIGHT_FLUSH',
        'FULL_HOUSE',
        'ONE_PAIR',
      ])
    end
  end
end