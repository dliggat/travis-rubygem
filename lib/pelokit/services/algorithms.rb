module Services

  refine Array do
    def sum
      self.inject 0, :+
    end
  end

  class Error < ArgumentError; end

  class Algorithms

    # Given an array, return the sum of the two smallest elements in that array.
    # Handle erroneous input, and do it in linear time; i.e. avoid sorting the array.
    def two_smallest(array)
      raise Error if array.nil? || array.count < 2

      # Start with the first two elements in the array. Ensure the first
      # candidate is the smallest of the two.
      candidates = [
        [array[0], array[1]].min,
        [array[0], array[1]].max
      ]

      # For the remaining elements, insert into candidates if the item is smaller than
      # one or both of the current candidates. Maintain candidates[0] as the smallest
      # item so we easily know which one to eject; i.e. candidates[1].
      array.each_with_index do |item, index|
        next if [0, 1].include? index
        next unless item < candidates[1]
        if item < candidates[0]
          candidates = [item, candidates[0]]
        else
          candidates[1] = item
        end
      end

      # By this point, candidates contains the smallest sum.
      candidates.sum
    end

  end
end
