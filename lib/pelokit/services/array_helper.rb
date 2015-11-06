module Pelokit
  module Services
    class ArrayHelper

      class Error < ArgumentError; end

      def two_smallest(list)
        raise Error if list.nil? || list.count < 2

        # Start with the first two elements in the array. Ensure the first
        # candidate is the smallest of the two.
        candidates = [
          [list[0], list[1]].min,
          [list[0], list[1]].max
        ]

        # For the remaining elements, insert into candidates if the item is smaller than
        # one or both of the current candidates. Maintain candidates[0] as the smallest
        # item so we easily know which one to eject; i.e. candidates[1].
        list.each_with_index do |item, index|
          next if [0, 1].include? index
          next unless item < candidates[1]

          if item < candidates[0]
            candidates = [item, candidates[0]]
          else
            candidates[1] = item
          end
        end

        # By this point, candidates contains the smallest sum.
        candidates.inject 0, :+
      end

    end
  end
end
